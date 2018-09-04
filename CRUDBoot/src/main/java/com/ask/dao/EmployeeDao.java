package com.ask.dao;

import java.util.List;

import com.ask.model.Employee;

public interface EmployeeDao {

	public List<Employee> getAllEmployees();

	public Employee findEmployeeById(int id);

	public void addEmployee(Employee employee);

	public void updateEmployee(Employee employee);

	public void deleteEmployee(int id);
}
