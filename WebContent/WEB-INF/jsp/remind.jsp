<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/style.css" />
<title>Novï¿½ u?ivatel</title>
</head>
<body>
<form:form action="remind" modelAttribute="user" method="POST">
    <br /><br />
    <label for="usernameInput">Username: </label>
    <form:input path="username" id="usernameInput" />
    <form:errors path="username" cssclass="error"></form:errors>
     <br />
    <label for="hints">Otázka: </label>
    <select name = "hint">
     <c:forEach items="${hints}" var="hint">
                    <option value="${hint}">${hint}</option>
      </c:forEach>
    </select>
     <br />
     <label for="passphraseInput">Odpoveď </label>
    <form:input  path="passphrase" id="passphrase" />
    <form:errors path="passphrase" cssclass="error"></form:errors>
    <br /><br />
     <br />
    <label for="passwordInput">New Password: </label>
    <form:input type="password" path="password" id="passwordInput" />
    <form:errors path="password" cssclass="error"></form:errors>
    <br /><br />
    <input type="submit" value="Submit" />
</form:form>
</body>
</html>