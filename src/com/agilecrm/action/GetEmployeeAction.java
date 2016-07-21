package com.agilecrm.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.agilecrm.delegate.EmployeeDelegate;
import com.agilecrm.dto.EmployeeDto;
import com.google.gson.Gson;

public class GetEmployeeAction extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		EmployeeDto empDto=null;
		String userId=req.getParameter("userId");		
		EmployeeDelegate delegate=new EmployeeDelegate();
		EmployeeDto emDto=delegate.getEmployee(userId);
		
		String json;
		Gson gson=new Gson();
		json=gson.toJson(emDto);
		
		resp.setContentType("application/json");
		resp.getWriter().write(json);
	}

}
