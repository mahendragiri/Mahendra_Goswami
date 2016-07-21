package com.agilecrm.action;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.agilecrm.constant.EmployeeConstant;
import com.agilecrm.daoImpl.EmployeeDaoImplByDataSource;
import com.agilecrm.delegate.EmployeeDelegate;
import com.agilecrm.dto.EmployeeDto;

@SuppressWarnings("serial")
public class AgileProjectServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {

		resp.setContentType("text/plain");
		resp.getWriter().println("Hello, world hiiii");
				
		EmployeeDto employeeDto=new EmployeeDto();
		employeeDto.setFirstName("mahendra");
		employeeDto.setLastName("giri");
		employeeDto.setDob(new Date());
		employeeDto.setEmail("agile@gmail.com");
		employeeDto.setMobileNo(9988776655l);
		employeeDto.setCompany("AgileCRM");
		employeeDto.setDesignation("software developer");
		employeeDto.setAddress("hyderabad");
		employeeDto.setUserId("so19");
		employeeDto.setPassword("giri");
		employeeDto.setStatus(EmployeeConstant.ACTIVE_EMPLOYEE);
		
		EmployeeDelegate delegate=new EmployeeDelegate();
		delegate.registerEmployee(employeeDto);
	}
}
