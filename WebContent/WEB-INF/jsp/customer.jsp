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
<body >
  
    <h3 align="center">Výpis uživatelů</h3>
    <div align="right">
        <a href="${pageContext.request.contextPath}/j_spring_security_logout"/><img src="${pageContext.request.contextPath}/pic/logout.jpg" alt="logout"/></a><br/>
      <a href="${pageContext.request.contextPath}/customer/menu.htm"><img src="${pageContext.request.contextPath}/pic/zpet.jpg"></a>
    </div>
        <br/>
        
        <table>
            <tr>
                <th>ID</th>
                <th>Jméno</th>
                <th>Login</th>
                <th>Heslo</th>
                <th>Upravit</th>
                <th>Smazat</th>
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
        
    </body>
</html>


