package com.agilecrm.action;

import java.io.IOException;
import java.util.Properties;
import java.util.ResourceBundle;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.agilecrm.constant.EmployeeConstant;
import com.agilecrm.delegate.EmployeeDelegate;
import com.agilecrm.dto.EmployeeDto;

public class LoginEmployeeAction extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}
	
	public void setSession(String userId,HttpServletRequest req,HttpServletResponse resp){
		
		System.out.println("before getting session -->>  "+req.getSession());
		req.getSession().invalidate();
		//System.out.println("--->>  "+req.getSession(false));
		HttpSession session=req.getSession(true); 
		
        session.setAttribute("userId",userId);
        
        //setting session to expiry in 40 mins
		session.setMaxInactiveInterval(40*60);
		//create cookie for user
		Cookie userName = new Cookie("userId", userId);
		//setting session to expiry in 40 mins
		userName.setMaxAge(40*60);
		//add cookie with response
		resp.addCookie(userName);
	}
	
	
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		System.out.println("LoginEmployeeAction");
		String userId=req.getParameter("userId");
		String password=req.getParameter("password");
		
		
		ResourceBundle bundle=ResourceBundle.getBundle("com.agile.commons.adminDetails");
		Set<String> keys=bundle.keySet();
		Properties properties=new Properties();
		for(String key:keys){
			properties.put(key, bundle.getString(key));
		}
		
		
	
		if(userId.equals(properties.getProperty("userId"))&&password.equals(properties.getProperty("password"))){
			setSession(userId, req, resp);
			RequestDispatcher rd=getServletContext().getRequestDispatcher("/jsp/adminHome.jsp");
			rd.forward(req, resp);
			
		}
		else{
			EmployeeDelegate delegate=new EmployeeDelegate();
			boolean flag=false;
			try{
				flag=delegate.loginUser(userId, password);
				System.out.println(flag);
				if(flag==true){
					EmployeeDto empDto=delegate.getEmployee(userId);
					req.setAttribute("data", empDto);
					
					setSession(userId, req, resp);
			        
					RequestDispatcher rd=getServletContext().getRequestDispatcher("/jsp/userHome.jsp");
					rd.forward(req, resp);
				}
				else{
					String str=EmployeeConstant.INVALID_USER;
					RequestDispatcher rd=getServletContext().getRequestDispatcher("/jsp/login.jsp?MSG="+str+"");
					rd.forward(req, resp);
				}
			}
			catch(Exception e){
				e.printStackTrace();
				String str=EmployeeConstant.SERVER_PROBLEM;
				RequestDispatcher rd=getServletContext().getRequestDispatcher("/jsp/login.jsp?MSG="+str+"");
				rd.forward(req, resp);
			}
		}
		
	}

}
