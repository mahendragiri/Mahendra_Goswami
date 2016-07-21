package com.agilecrm.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.agilecrm.delegate.EmployeeDelegate;
import com.google.appengine.labs.repackaged.org.json.JSONArray;
import com.google.appengine.labs.repackaged.org.json.JSONObject;
import com.google.gson.Gson;

public class GetAllEmployeeAction extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		

		EmployeeDelegate delegate=new EmployeeDelegate();
		List list=delegate.getAllEmployee();
		
//		JSONArray array = new JSONArray();
//		
//		JSONObject obj = new JSONObject();
//		
//		obj.put("name", emp.getName)
		
		
		String json;
		Gson gson=new Gson();
		json=gson.toJson(list);
		
		resp.setContentType("application/json");
		resp.getWriter().write(json);
	}

}
