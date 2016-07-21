package com.agilecrm.action;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.agilecrm.delegate.EmployeeDelegate;
import com.google.gson.Gson;

public class SearchUserAction extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		EmployeeDelegate delegate=new EmployeeDelegate();
		Map<String, String> map=delegate.searchUser();
		
		String json;
		Gson gson=new Gson();
		json=gson.toJson(map);
		System.out.println(json);
		
		resp.setContentType("application/json");
		resp.getWriter().write(json);
	}

}
