package com.agilecrm.action;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.agilecrm.constant.EmployeeConstant;
import com.agilecrm.daoImpl.EmployeeDaoImplByDataSource;
import com.agilecrm.delegate.EmployeeDelegate;
import com.agilecrm.dto.EmployeeDto;
import com.agilecrm.util.DataFormate;

public class UpdateEmployeeAction extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		System.out.println("UpdateEmployeeAction");
		
		
		EmployeeDto employeeDto=new EmployeeDto();
		employeeDto.setFirstName(req.getParameter("firstName"));
		employeeDto.setLastName(req.getParameter("lastName"));
		
		String dob=req.getParameter("dob");
		employeeDto.setDob(DataFormate.StringToUtilDate(dob));
		
		employeeDto.setEmail(req.getParameter("email"));
		employeeDto.setMobileNo(Long.parseLong(req.getParameter("mobileNo")));
		employeeDto.setCompany(req.getParameter("company"));
		employeeDto.setDesignation(req.getParameter("designation"));
		employeeDto.setAddress(req.getParameter("address"));
		
		HttpSession session=req.getSession();
		String userId=(String)session.getAttribute("userId");
		employeeDto.setUserId(userId);
		
		EmployeeDelegate delegate=new EmployeeDelegate();		
		boolean flag=delegate.updateEmployee(employeeDto);
		RequestDispatcher rd=null;
		System.out.println(flag+"=====");
		if(flag==true){
			String scs=EmployeeConstant.UPDATION_SUCCESS;
			req.setAttribute("data",employeeDto);
			rd=getServletContext().getRequestDispatcher("/jsp/userHome.jsp?MSG="+scs+"");
		}
		else{
//			String scs=EmployeeConstant.UPDATION_FAIL;
//			rd=getServletContext().getRequestDispatcher("/jsp/registration.jsp?MSG="+scs+"");

		}
		rd.forward(req, resp);
	}
		

}
