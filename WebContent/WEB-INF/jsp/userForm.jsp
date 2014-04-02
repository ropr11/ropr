<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Nový uživatel</title>
</head>
<body>
<form:form action="new" modelAttribute="user" method="POST">
    <label for="idInput">ID: </label>
    <form:input path="idUser" id="idnput"></form:input>
    <form:errors path="idUser" cssclass="error"></form:errors>
    <br />
    
    <label for="nameInput">Name: </label>
    <form:input path="name" id="nameInput"></form:input>
    <form:errors path="name" cssclass="error"></form:errors>
    <br />
     
    <label for="surnameInput">Surname: </label>
    <form:input path="surname" id="surnameInput"></form:input>
    <form:errors path="surname" cssclass="error"></form:errors>
    <br />
     
    <label for="phoneInput">Phone: </label>
    <form:input path="phone" id="phoneInput"></form:input>
    <form:errors path="phone" cssclass="error"></form:errors>
    <br />
     
    <label for="emailInput">Email: </label>
    <form:input path="email" id="emailInput"></form:input>
    <form:errors path="email" cssclass="error"></form:errors>
    <br />
     
    <label for="cityInput">Birthday: </label>
    <form:input path="city" id="cityInput" />
    <form:errors path="city" cssclass="error"></form:errors>
    <br />
    
    <label for="streetInput">Street: </label>
    <form:input path="street" id="streetInput" />
    <form:errors path="street" cssclass="error"></form:errors>
    <br />
    
    <label for="zipInput">ZIP: </label>
    <form:input path="zip" id="zipInput" />
    <form:errors path="zip" cssclass="error"></form:errors>
    <br />
     
    <label for="role">userRoles: </label>
    <form:select path="userRoles" id="userRole">
        <form:options items="${userRoles}"  itemValue="id" itemLabel="role"></form:options>
    </form:select>
    <form:errors path="userRoles" cssclass="error"></form:errors>
    <br />
    <br /><br />
    <label for="usernameInput">Username: </label>
    <form:input path="username" id="usernameInput" />
    <form:errors path="username" cssclass="error"></form:errors>
    <br />
    <label for="passwordInput">Password: </label>
    <form:input path="password" id="passwordInput" />
    <form:errors path="password" cssclass="error"></form:errors>
    <br /><br />
    
    <br />
    <input type="submit" value="Submit" />
</form:form>
</body>
</html>