package com.agilecrm.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.apphosting.utils.config.ClientDeployYamlMaker.Request;

public class LogoutAction extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession session=(HttpSession)req.getSession(false);
		
			System.out.println("before invalidate-->>  "+session);
			session.invalidate();
			System.out.println("after invalidate--->>  "+session);
			
			RequestDispatcher rd=getServletContext().getRequestDispatcher("/home.html");
			rd.forward(req, resp);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

}
