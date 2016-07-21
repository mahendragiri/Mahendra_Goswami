package com.agilecrm.serviceImpl;

import java.util.List;
import java.util.Map;

import com.agilecrm.daoI.EmployeeDao;
import com.agilecrm.daoImpl.EmployeeDaoImplByDataSource;
import com.agilecrm.dto.EmployeeDto;
import com.agilecrm.service.EmployeeService;

public class EmployeeServiceImpl implements EmployeeService{
	private EmployeeDao empdao=new EmployeeDaoImplByDataSource();
	@Override
	public boolean registerEmployee(EmployeeDto empdto) {
		return empdao.registerEmployee(empdto);
	}
	
	@Override
	public EmployeeDto getEmployee(String userId) {
		return empdao.getEmployee(userId);
	}
	

	@Override
	public boolean loginUser(String userId, String password) {
		return empdao.loginUser(userId, password);
	}
	
	@Override
	public boolean updateEmployee(EmployeeDto empdto) {
		return empdao.updateEmployee(empdto);
	}
	
	@Override
	public List<EmployeeDto> getAllEmployee() {
		return empdao.getAllEmployee();
	}
	
	@Override
	public boolean deleteEmployee(String userId) {
		return empdao.deleteEmployee(userId);
	}

	@Override
	public Map<String, String> searchUser() {
		return empdao.searchUser();
	}

	
	/*
	

	
	
	*/
}
