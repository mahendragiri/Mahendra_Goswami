package com.agilecrm.daoI;

import java.util.List;
import java.util.Map;

import com.agilecrm.dto.EmployeeDto;

public interface EmployeeDao {
	public boolean registerEmployee(EmployeeDto empdto) ;
	public EmployeeDto getEmployee(String userId);
	public boolean loginUser(String userId,String password);
	public boolean updateEmployee(EmployeeDto empdto);
	public List<EmployeeDto> getAllEmployee();
	public boolean deleteEmployee(String userId);
	public Map<String,String> searchUser();
	
	/*
	
	public boolean searchUserId(String userId);
	
	*/
	
}
