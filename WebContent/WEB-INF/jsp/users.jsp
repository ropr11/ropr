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
    <a href="customer/nenu">Menu</a> 
    </p>
    <h3 align="center">Výpis uživatelů</h3>
    
        <br/>
        <table align="center" border="1" cellpadding="5" cellspacing="4" >
            <tr>
                <th>ID</th>
                <th>Username</th>
                <th>Heslo</th>
                <th>Jméno</th>
                <th>Příjmení</th>
                
            </tr>
            <c:forEach items="${users}" var="user">
                <tr>
                    <td><c:out value="${user.idUser}.toString()"></c:out></td>
                    <td><c:out value="${user.username}"></c:out></td>
                    <td><c:out value="${user.password}"></c:out></td>
                    <td><c:out value="${user.name}"></c:out></td>
                    <td><c:out value="${user.surname}"></c:out></td>
                    
                </tr>
            </c:forEach>
            </table>
        <p align="center">
        <a href="custome/menu">Zpět</a>
        <br />	
	<a href="<c:url value="j_spring_security_logout"/>">Logout</a>

        </p>
    </body>
</html>
