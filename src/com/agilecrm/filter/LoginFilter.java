package com.agilecrm.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import com.agilecrm.constant.EmployeeConstant;

public class LoginFilter implements Filter{

	@Override
	public void destroy() {
		System.out.println("destroy() method of LoginFilter");
		
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain fc) throws IOException, ServletException {

		String userId=req.getParameter("userId");
		String password=req.getParameter("password");
		if(userId!=null && password!=null){
			fc.doFilter(req, res);
		}
		else{
			String str=EmployeeConstant.INVALID_USER;
			RequestDispatcher rd=req.getRequestDispatcher("/jsp/login.jsp?MSG="+str+"");
			rd.forward(req, res);
		}
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		System.out.println("init() method of LoginFilter");
		
	}

}