# Spring-Boot-Oracle-JdbcTemplate-CRUD
Spring JdbcTemplate CRUD Web Application using Spring Boot, Bootstrap 4 and Oracle

Technologies Used
---
* Eclipse Oxygen and Install Spring Tool Suite for Eclipse IDE
* Spring Boot 2.0.4.BUILD-SNAPSHOT
* spring-boot-starter-jdbc
* spring-boot-starter-web
* spring-boot-devtools
* JSTL - JSP Standard Tag Library
* tomcat-embed-jasper
* Oracle Jdbc Driver
* Bootstrap 4
* Java 8

Oracle create database and tables
---
```sh
CREATE TABLE HR.EMPLOYEE
(
EMPLOYEE_ID  INTEGER                          NOT NULL,
FIRST_NAME   VARCHAR2(45 BYTE)                NOT NULL,
LAST_NAME    VARCHAR2(45 BYTE)                NOT NULL,
EMAIL        VARCHAR2(45 BYTE)                NOT NULL,
PHONE        VARCHAR2(20 BYTE)                NOT NULL,
JOB_TITLE    VARCHAR2(100 BYTE)               NOT NULL,
CONSTRAINT EMPLOYEE_PK PRIMARY KEY (EMPLOYEE_ID)
);
```
Oracle create sequence for employee_id
---
```sh
CREATE SEQUENCE HR.EMPLOYEES_SEQ
START WITH 208
MAXVALUE 9999999999999999999999999999
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;
```
Creating a Spring Boot Project with Eclipse STS
---
* Launch Eclipse IDE. Go to File -> New -> Other... Select Spring Starter Project under Spring Boot category then click Next
* In the next screen, you enter the content then click Next
* In the next step, you choose Spring Boot Version is 2.0.4 (SNAPSHOT) and choose the Web + DevTools + JDBC then click Finish.

Project Dependencies
---
* We will add the required dependencies to Maven pom.xml File 
```sh
<dependency>
    <groupId>com.oracle</groupId>
    <artifactId>ojdbc6</artifactId>
    <version>11.2.0.3</version>
</dependency>
<dependency>
    <groupId>javax.servlet</groupId>
    <artifactId>jstl</artifactId>
</dependency>
<dependency>
    <groupId>org.webjars</groupId>
    <artifactId>bootstrap</artifactId>
    <version>4.0.0</version>
</dependency>
<dependency>
    <groupId>org.apache.tomcat.embed</groupId>
    <artifactId>tomcat-embed-jasper</artifactId>
    <scope>provided</scope>
</dependency>
```

Model
---
* Create a `Employee` class under `com.ask.model` package with the code.
* The RowMapper is used to map a single row to a single domain object. We will create a `EmployeeRowMapper` implementing `RowMapper` interface under `com.ask.model` package with the code.

DAO Layer
---
* Create a `EmployeeDao` interface under `com.ask.dao` package and write the code it.
* Create a `EmployeeDaoImpl` class implements `EmployeeDao` interface under `com.ask.dao` package and write the code it. 
* We use JdbcTemplate query(), queryForObject() methods to query data from Oracle database and use the JdbcTemplate update() method for updating records in database. 

Service Layer
---
* Create a `EmployeeService` interface under `com.ask.service` package and write the code it. 
* Create a `EmployeeServiceImpl` class implements `EmployeeService` interface under `com.ask.service` package and write the code it.

Employee Controller
---
* We create a controller class named `EmployeeController` to integrate with the Oracle database using the `EmployeeServiceImpl` class. Create a `EmployeeController` class under `com.ask.controller` package and write the code it.

Configuring Spring Boot for Oracle and view resolvers
---
* In the sources folder, we will look for this project's a resource file under src/main/resources/application.properties. Open application.properties file and add the following properties.
```sh
spring.datasource.driver-class-name=oracle.jdbc.driver.OracleDriver
spring.datasource.url=jdbc:oracle:thin:@localhost:1521:xe
spring.datasource.username=hr
spring.datasource.password=hr

spring.mvc.view.prefix=/WEB-INF/jsp/
spring.mvc.view.suffix=.jsp
 ```  
View Layer
---
* Create `jsp` folder under `src\main\webapp\WEB-INF\` folder.
* Create `employee_list.jsp` and `employee_form.jsp` file under `src\main\webapp\WEB-INF\jsp\` folder and write the code it.

Run Spring Boot Application
---
Right click to the Project and follow the below steps:
* select Run As -> Maven clean
* select Run As -> Maven install
* select Run As -> Spring Boot App

Oracle JDBC Driver
---
* https://mvnrepository.com/artifact/oracle/ojdbc6/11.2.0.3

Employee List
---
![listemp](https://user-images.githubusercontent.com/33669266/45081922-e848c680-b100-11e8-8038-19b951dba90f.PNG)

Add New Employee
---
![addemp](https://user-images.githubusercontent.com/33669266/45081888-ccddbb80-b100-11e8-9e26-ce6b700d7b66.PNG)
