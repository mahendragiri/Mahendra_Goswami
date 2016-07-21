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

import com.agilecrm.constant.EmployeeConstant;
import com.agilecrm.delegate.EmployeeDelegate;
import com.agilecrm.dto.EmployeeDto;
import com.agilecrm.util.DataFormate;

public class RegisterEmployeeAction extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		System.out.println("RegisterEmployee");
		
		EmployeeDto employeeDto=new EmployeeDto();
		employeeDto.setFirstName(req.getParameter("firstName"));
		employeeDto.setLastName(req.getParameter("lastName"));
		
		String dob=req.getParameter("dob");		
		Date utilDate=DataFormate.StringToUtilDate(dob);		
		employeeDto.setDob(utilDate);
		
		employeeDto.setEmail(req.getParameter("email"));
		employeeDto.setMobileNo(Long.parseLong(req.getParameter("mobileNo")));
		employeeDto.setCompany(req.getParameter("company"));
		employeeDto.setDesignation(req.getParameter("designation"));
		employeeDto.setAddress(req.getParameter("address"));
		employeeDto.setUserId(req.getParameter("userId"));
		employeeDto.setPassword(req.getParameter("password"));
		employeeDto.setStatus(EmployeeConstant.ACTIVE_EMPLOYEE);
		
		System.out.println(employeeDto);
		EmployeeDelegate delegate=new EmployeeDelegate();
		
		boolean flag=delegate.registerEmployee(employeeDto);
		RequestDispatcher rd=null;
		System.out.println(flag);
		if(flag==true){
			String scs=EmployeeConstant.REGISTRATION_SUCCESS;
			rd=getServletContext().getRequestDispatcher("/jsp/login.jsp?MSG="+scs+"");
		}
		else{
			String scs=EmployeeConstant.REGISTRATION_FAIL;
			rd=getServletContext().getRequestDispatcher("/jsp/registration.jsp?MSG="+scs+"");

		}
		rd.forward(req, resp);
	}

}
