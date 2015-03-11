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
        <style>table { 
                width: 100%; 
                border-collapse: collapse; 
            }
            /* Zebra striping */
            tr:nth-of-type(odd) { 
                background: #eee; 
            }
            th { 
                background: #333; 
                color: white; 
                font-weight: bold; 
            }
            td, th { 
                padding: 6px; 
                border: 1px solid #ccc; 
                text-align: left; 
            }</style> 
    </head>
    <body>
        <div align="right">
            <a href="${pageContext.request.contextPath}/j_spring_security_logout"/><img src="${pageContext.request.contextPath}/pic/logout.jpg" alt="logout"/></a><br/>
        <a href="/RoprProjekt/customer/menu"><img src="${pageContext.request.contextPath}/pic/zpet.jpg"></a>
    </div>

    <h3 align="center">Výpis uživatelů</h3>

    <br/>
    <table align="center" border="10" cellpadding="5" cellspacing="4" >
        <tr>
            <th>Username</th>
            <th>Heslo</th>
            <th>Jméno</th>
            <th>Příjmení</th>
            <th>Upravit</th>
            <th>Smazat</th>
        </tr>
        <c:forEach items="${users}" var="user">
            <c:url var="editUrl" value="edit?id=${user.idUser}" />
            <c:url var="deleteUrl" value="delete?id=${user.idUser}" />
            <tr>
                <td><c:out value="${user.username}"></c:out></td>
                <td><c:out value="${user.password}"></c:out></td>
                <td><c:out value="${user.name}"></c:out></td>
                <td><c:out value="${user.surname}"></c:out></td>
                <td><a href="${editUrl}"><img src="${pageContext.request.contextPath}/pic/upravit.jpg"></a></td>
                <td><a href="${deleteUrl}"><img src="${pageContext.request.contextPath}/pic/smazat.jpg"></a></td>

            </tr>
        </c:forEach>
    </table>

</body>
</html>