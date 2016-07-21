package com.agilecrm.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.agilecrm.constant.EmployeeConstant;

public class CheckSessionFilter implements Filter {

	private FilterConfig filterConfig;

	@Override
	public void init(FilterConfig fc) throws ServletException {
		System.out.println("init() method of CheckSessionFilter");
		this.filterConfig = fc;

	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain fc)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;

		HttpSession session = request.getSession(false);
		System.out.println("filter-- " + session);
		
		
		if (session != null) {
			fc.doFilter(request, response);
		} else {
			System.out.println("redirect login page");

//			 RequestDispatcher rd=request.getRequestDispatcher("/jsp/login.jsp");
//			 rd.forward(request,response);

//			String loginURI = request.getContextPath() + "/jsp/login.jsp";
//			response.sendRedirect(loginURI);
			
			//filterConfig.getServletContext().getRequestDispatcher("/jsp/login.jsp").forward(request, response);
			
			String loginURI = filterConfig.getServletContext().getContextPath() + "/jsp/login.jsp";
			response.sendRedirect(loginURI);
			
			
			System.out.println("after redirect");
		}
	}

	@Override
	public void destroy() {
		System.out.println("destroy() method of CheckSessionFilter");
		//this.filterConfig = null;

	}

}
