<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Employee List</title>
<link
	href="http://localhost:8080/webjars/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" />
<script
	src="http://localhost:8080/webjars/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="http://localhost:8080/webjars/jquery/3.0.0/js/jquery.min.js"></script>
</head>
<body>
	<div class="container">
		<h2>Employee List</h2>
		<table class="table table-striped">
			<thead>
				<tr>
					<th scope="row">Employee ID</th>
					<th scope="row">First Name</th>
					<th scope="row">Last Name</th>
					<th scope="row">Email</th>
					<th scope="row">Phone</th>
					<th scope="row">Job Title</th>
					<th scope="row">Edit</th>
					<th scope="row">Delete</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${employee_list }" var="employee">
					<tr>
						<td>${employee.employeeId }</td>
						<td>${employee.firstName }</td>
						<td>${employee.lastName }</td>
						<td>${employee.email }</td>
						<td>${employee.phone }</td>
						<td>${employee.jobTitle }</td>
						<td><spring:url
								value="/employee/update/${employee.employeeId}" var="updateURL" />
							<a class="btn btn-primary" href="${updateURL}" role="button">
								Update</a></td>
						<td><spring:url
								value="/employee/delete/${employee.employeeId}" var="deleteURL" />
							<a class="btn btn-primary" href="${deleteURL}" role="button">
								Delete</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<spring:url value="/employee/add" var="addURL" />
		<a class="btn btn-primary" href="${addURL}" role="button"> Add New
			Employee</a>
	</div>
</body>
</html>