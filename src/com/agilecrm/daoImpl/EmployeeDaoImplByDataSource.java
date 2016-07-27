package com.agilecrm.daoImpl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.agilecrm.daoI.EmployeeDao;
import com.agilecrm.dto.EmployeeDto;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.FilterOperator;
import com.google.appengine.api.datastore.Query.FilterPredicate;




public class EmployeeDaoImplByDataSource implements EmployeeDao{
	static private 	DatastoreService ds=DatastoreServiceFactory.getDatastoreService();
	
	@Override
	public boolean registerEmployee(EmployeeDto empdto) {
		Entity emp=new Entity("Employee");
		boolean flag=true;
		emp.setProperty("firstName",empdto.getFirstName());
		emp.setProperty("lastName",empdto.getLastName());
		emp.setProperty("dob",empdto.getDob());
		emp.setProperty("email",empdto.getEmail());
		emp.setProperty("mobileNo",empdto.getMobileNo());
		emp.setProperty("company",empdto.getCompany());
		emp.setProperty("designation",empdto.getDesignation());
		emp.setProperty("address",empdto.getAddress());
		emp.setProperty("userId",empdto.getUserId());
		emp.setProperty("password",empdto.getPassword());
		emp.setProperty("status",empdto.getStatus());
		System.out.println("last");
		System.out.println("last");
		
		try{
			ds.put(emp);
			System.out.println("successfully data insertion");
			System.out.println("successfully data insertion");			
			return flag;
		}catch(Exception e){
			flag=false;
			return flag;
		}
	}
	
	
	

	@Override
	public EmployeeDto getEmployee(String userId) {
		FilterPredicate fp=new FilterPredicate("userId", FilterOperator.EQUAL,userId);
		Query q=new Query("Employee").setFilter(fp);
		PreparedQuery preparedQuery=ds.prepare(q);
		Entity result=preparedQuery.asSingleEntity();
		
		
		
		EmployeeDto empDto=new EmployeeDto();
		empDto.setFirstName(result.getProperty("firstName").toString());
		empDto.setLastName(result.getProperty("lastName").toString());
		empDto.setDob((Date)(result.getProperty("dob")));
		empDto.setEmail(result.getProperty("email").toString());
		empDto.setCompany(result.getProperty("company").toString());
		
		empDto.setDesignation(result.getProperty("designation").toString());
		empDto.setAddress(result.getProperty("address").toString());
		empDto.setMobileNo((Long)(result.getProperty("mobileNo")));
		return empDto;
	}
	

	@Override
	public boolean loginUser(String userId, String password) {
		boolean flag=false;
		try{
			FilterPredicate fp=new FilterPredicate("userId", FilterOperator.EQUAL,userId);
			Query q=new Query("Employee").setFilter(fp);
			PreparedQuery preparedQuery=ds.prepare(q);
			Entity result=preparedQuery.asSingleEntity();
			if(password.equals(((String)result.getProperty("password")))){
				flag= true;
			}
			return flag;
		}
		catch (Exception e) {
			return false;
		}
	}
	
	@Override
	public boolean updateEmployee(EmployeeDto empdto) {
		boolean flag=true;
		
		
		String userId=empdto.getUserId();
		try{
					
			FilterPredicate fp=new FilterPredicate("userId", FilterOperator.EQUAL,userId);
			Query q=new Query("Employee").setFilter(fp);
			PreparedQuery preparedQuery=ds.prepare(q);
			Entity entity=preparedQuery.asSingleEntity();
			
			
			entity.setProperty("firstName",empdto.getFirstName());
			entity.setProperty("lastName",empdto.getLastName());
			entity.setProperty("dob",empdto.getDob());
			entity.setProperty("email",empdto.getEmail());
			entity.setProperty("mobileNo",empdto.getMobileNo());
			entity.setProperty("company",empdto.getCompany());
			entity.setProperty("designation",empdto.getDesignation());
			entity.setProperty("address",empdto.getAddress());
			ds.put(entity);
	
			System.out.println("successfully updationtion");			
			return flag;
		}catch(Exception e){
			flag=false;
			return flag;
		}
	}
	

	@Override
	public List<EmployeeDto> getAllEmployee() {
		List<EmployeeDto> list=new ArrayList<EmployeeDto>();
		
		Query query=new Query("Employee");
		PreparedQuery preparedQuery=ds.prepare(query);
		for(Entity result:preparedQuery.asIterable()){
			
			EmployeeDto empDto=new EmployeeDto();
			empDto.setFirstName(result.getProperty("firstName").toString());
			empDto.setLastName(result.getProperty("lastName").toString());
			empDto.setDob((Date)(result.getProperty("dob")));
			empDto.setEmail(result.getProperty("email").toString());
			empDto.setCompany(result.getProperty("company").toString());			
			empDto.setDesignation(result.getProperty("designation").toString());
			empDto.setAddress(result.getProperty("address").toString());
			empDto.setMobileNo((Long)(result.getProperty("mobileNo")));
			empDto.setUserId((String)result.getProperty("userId"));
			
			list.add(empDto);			
		}
		return list;
	}
	
	
	@Override
	public boolean deleteEmployee(String userId) {
		try{
			FilterPredicate fp=new FilterPredicate("userId", FilterOperator.EQUAL,userId);
			Query q=new Query("Employee").setFilter(fp);
			PreparedQuery preparedQuery=ds.prepare(q);
			Entity result=preparedQuery.asSingleEntity();
			ds.delete(result.getKey());
			return true;
		}
		catch(Exception e){
			return false;
		}
	}
	
	

	@Override
	public Map<String,String> searchUser() {
		
		Query query=new Query("Employee");
		PreparedQuery preparedQuery=ds.prepare(query);

		Map<String,String> map=new HashMap<String,String>();
		for(Entity result:preparedQuery.asIterable()){			
			String userId=(String)result.getProperty("userId");
			String firstName=result.getProperty("firstName").toString();
			map.put(userId,firstName);		
		}
		
		return map;
	}

	


	
	
	
	
	
	/*





	
	*/

}
