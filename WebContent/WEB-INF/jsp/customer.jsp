<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
   <head>
       <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title>Výpis uživatelů</title>
       <meta name="description" >
       <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/style.css" />
</head>
<body>
    <p align="center">    
    <a href="menu.htm">Menu</a> 
    </p>
    <h3 align="center">Výpis uživatelů</h3>
    
        <br/>
        <table align="center" border="1" cellpadding="5" cellspacing="4" >
            <tr>
                <th>ID</th>
                <th>Jméno</th>
                <th>Login</th>
                <th>Heslo</th>
            </tr>
            <c:forEach items="${customer}" var="customer">
                <tr>
                    <td><c:out value="${customer.customer_ID}"></c:out></td>
                    <td><c:out value="${customer.name}"></c:out></td>
                    <td><c:out value="${customer.login}"></c:out></td>
                    <td><c:out value="${customer.password}"></c:out></td>
                </tr>
            </c:forEach>
            </table>
        <p align="center">
        <a href="${pageContext.request.contextPath}/index.htm">Zpět</a>
        <br />	
	<a href="{pageContext.request.contextPath}/j_spring_security_logout"/>Logout</a>

        </p>
    </body>
</html>
