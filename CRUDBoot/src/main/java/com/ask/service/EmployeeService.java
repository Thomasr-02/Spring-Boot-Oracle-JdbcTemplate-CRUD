package com.ask.service;

import java.util.List;

import com.ask.model.Employee;

public interface EmployeeService {
	
	public List<Employee> getAllEmployees();

	public Employee findEmployeeById(int id);

	public void addEmployee(Employee employee);

	public void updateEmployee(Employee employee);

	public void deleteEmployee(int id);
}
