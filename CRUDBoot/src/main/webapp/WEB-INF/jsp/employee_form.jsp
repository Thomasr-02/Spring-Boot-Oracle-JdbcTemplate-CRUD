<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Employees</title>
<link
	href="http://localhost:8080/webjars/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" />
<script
	src="http://localhost:8080/webjars/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="http://localhost:8080/webjars/jquery/3.0.0/js/jquery.min.js"></script>
</head>
<body>
	<spring:url value="/employee/save" var="saveURL" />
	<h2>Employee</h2>
	<form:form modelAttribute="employeeForm" method="post"
		action="${saveURL }" cssClass="form">
		<form:hidden path="employeeId" />

		<div class="form-group">
			<label for="firstName">First Name</label>
			<form:input path="firstName" cssClass="form-control" id="firstName" />
		</div>

		<div class="form-group">
			<label for="lastName">Last Name</label>
			<form:input path="lastName" cssClass="form-control" id="lastName" />
		</div>

		<div class="form-group">
			<label for="email">Email</label>
			<form:input path="email" cssClass="form-control" id="email" />
		</div>

		<div class="form-group">
			<label for="phone">Phone</label>
			<form:input path="phone" cssClass="form-control" id="phone" />
		</div>

		<div class="form-group">
			<label for="jobTitle">Job Title</label>
			<form:input path="jobTitle" cssClass="form-control" id="jobTitle" />
		</div>

		<button type="submit" class="btn btn-primary">Save</button>
	</form:form>
</body>
</html>