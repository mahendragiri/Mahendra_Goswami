package com.agilecrm.delegate;

import java.util.List;
import java.util.Map;

import com.agilecrm.dto.EmployeeDto;
import com.agilecrm.service.EmployeeService;
import com.agilecrm.serviceImpl.EmployeeServiceImpl;

public class EmployeeDelegate {
	private EmployeeService service=new EmployeeServiceImpl();
	
	public boolean registerEmployee(EmployeeDto empdto) 
	{
		return service.registerEmployee(empdto);
	}
	public EmployeeDto getEmployee(String userId){
		return service.getEmployee(userId);
	}

	public boolean loginUser(String userId,String password){
		return service.loginUser(userId, password);
	}
	
	public boolean updateEmployee(EmployeeDto empdto){
		return service.updateEmployee(empdto); 
	}
	public List<EmployeeDto> getAllEmployee(){
		return service.getAllEmployee();
	}

	public boolean deleteEmployee(String userId){
		return service.deleteEmployee(userId);
	}
	

	public Map<String,String> searchUser(){
		return service.searchUser();
	}
	
	
	
	/*
	
	public boolean searchUserId(String userId){
		return service.searchUserId(userId);
	}
	
	*/
}
