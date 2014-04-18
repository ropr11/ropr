<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/style.css" />
        <title>Nový uživatel</title>
    </head>
    <body>
        <div align="right">
            <a href="${pageContext.request.contextPath}/j_spring_security_logout"/><img src="${pageContext.request.contextPath}/pic/logout.jpg" alt="logout"/></a><br/>
        <a href="/index.htm"><img src="${pageContext.request.contextPath}/pic/zpet.jpg"></a>
    </div>
    
    <form:form action="new" modelAttribute="user" method="POST" >
        <table border="3" cellspacing="4" cellpadding="2" frame="box">
            <caption><b>Nový uživatel</b></caption>
            <tr><label for="id"></label>
            <form:input type="hidden" path="idUser" id="idUser"></form:input>

            <form:errors path="idUser" cssclass="error"></form:errors>
            </tr>
            <tr align="center" ><td colspan="2"> <label for="nameInput">Jméno: </label>
                <form:input path="name" id="nameInput"></form:input>
                <form:errors path="name" cssclass="error"></form:errors>
                </td>
            </tr>
            <tr>
                <td><label for="role">Nová role: </label>
                <form:select path="userRoles" id="userRole">
                    <form:options items="${userRoles}"  itemValue="id" itemLabel="role"></form:options>
                </form:select>
                <form:errors path="userRoles" cssclass="error"></form:errors></td>
                <td><label for="surnameInput">Příjmení:</label>
                <form:input path="surname" id="surnameInput"></form:input>
                <form:errors path="surname" cssclass="error"></form:errors></td>
            </tr>
            <tr>
                <td> <label for="usernameInput">Jméno: </label>
                <form:input path="username" id="usernameInput" />
                <form:errors path="username" cssclass="error"></form:errors></td>
                <td><label for="phoneInput">Telefon </label>
                <form:input path="phone" id="phoneInput"></form:input>
                <form:errors path="phone" cssclass="error"></form:errors></td>
            </tr>
            <tr>
                <td> <label for="hints">Bezpečnostní otázka: </label>
                    <select name = "hint">
                    <c:forEach items="${hints}" var="hint">
                        <option value="${hint}">${hint}</option>
                    </c:forEach>
                </select></td>
            <td> <label for="emailInput">Email: </label>
                <form:input path="email" id="emailInput"></form:input>
                <form:errors path="email" cssclass="error"></form:errors>
                </td>
            </tr>
            <tr>
                <td> <label for="passphraseInput">Odpověď: </label>
                <form:input  path="passphrase" id="passphrase" />
                <form:errors path="passphrase" cssclass="error"></form:errors></td>
                <td> <label for="cityInput">Město: </label>
                <form:input path="city" id="cityInput" />
                <form:errors path="city" cssclass="error"></form:errors>
                </td>
            </tr>
            <tr>
                <td><label for="streetInput">Ulice: </label>
                <form:input path="street" id="streetInput" />
                <form:errors path="street" cssclass="error"></form:errors></td>
                <td><label for="zipInput">PSČ: </label>
                <form:input path="zip" id="zipInput" />
                <form:errors path="zip" cssclass="error"></form:errors></td>
            </tr>


        </table>
        <br/>
        <br/>

        <input type="submit" value="Submit" />
</form:form>
</body>
</html>