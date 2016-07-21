package com.agilecrm.daoImpl;
import com.agilecrm.dto.Employee;
import com.agilecrm.dto.EmployeeDto;
import com.googlecode.objectify.Objectify;
import com.googlecode.objectify.ObjectifyFactory;
import com.googlecode.objectify.ObjectifyService;

public class EmployeeDaoImplByObjectify {

	public static EmployeeDto getEmployee(String userId){
		 EmployeeDto empDto=new EmployeeDto();
		 ObjectifyService.register(Employee.class);
		 System.out.println("before1");
		 
		 ObjectifyFactory factory=ObjectifyService.factory();
		 System.out.println("before2");
		 Objectify ofy=factory.begin();
		 System.out.println("before");
		 empDto=(EmployeeDto)ofy.load().type(Employee.class).filter("userId", userId);
		 System.out.println(empDto);
		return empDto;
	}

}
