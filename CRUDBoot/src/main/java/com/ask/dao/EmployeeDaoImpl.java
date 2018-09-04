package com.ask.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ask.model.Employee;
import com.ask.model.EmployeeRowMapper;

@Transactional
@Repository
public class EmployeeDaoImpl implements EmployeeDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public List<Employee> getAllEmployees() {

		String query = "SELECT * FROM EMPLOYEE";

		RowMapper<Employee> rowMapper = new EmployeeRowMapper();

		List<Employee> list = jdbcTemplate.query(query, rowMapper);

		return list;
	}

	@Override
	public Employee findEmployeeById(int id) {

		String query = "SELECT * FROM EMPLOYEE WHERE EMPLOYEE_ID = ?";

		RowMapper<Employee> rowMapper = new BeanPropertyRowMapper<Employee>(Employee.class);

		Employee employee = jdbcTemplate.queryForObject(query, rowMapper, id);

		return employee;
	}

	@Override
	public void addEmployee(Employee employee) {

		String query = "INSERT INTO EMPLOYEE (employee_id, first_name, last_name, email, phone, job_title) VALUES (EMPLOYEES_SEQ.NEXTVAL,?,?,?,?,?)";

		jdbcTemplate.update(query, employee.getFirstName(), employee.getLastName(),
				employee.getEmail(), employee.getPhone(), employee.getJobTitle());

	}

	@Override
	public void updateEmployee(Employee employee) {

		String query = "UPDATE EMPLOYEE SET first_name = ?, last_name = ?, email = ?, phone = ?, job_title = ?"
				+ "WHERE employee_id=?";

		jdbcTemplate.update(query, employee.getFirstName(), employee.getLastName(), employee.getEmail(),
				employee.getPhone(), employee.getJobTitle(), employee.getEmployeeId());
	}

	@Override
	public void deleteEmployee(int id) {

		String query = "DELETE FROM EMPLOYEE WHERE employee_id = ?";

		jdbcTemplate.update(query, id);
	}

}
