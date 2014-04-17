<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
   <head>
       <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title>Výpis Objednávek</title>
       <meta name="description" >
       <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/style.css" />
</head>
<body>
    <p align="center">    
     <a href="${pageContext.request.contextPath}/customer/menu">Menu</a>
    </p>
    <h3 align="center">Výpis objednávek</h3>
    
        <br/>
        <table align="center" border="1" cellpadding="5" cellspacing="4" >
           
            <c:forEach items="${orders}" var="order">
            <c:url var="editUrl" value="edit?id=${order.orderId}" />
   			<c:url var="deleteUrl" value="delete?id=${order.orderId}" />
                <tr>
                <th>Objednáno dne</th>>
                <th>Z města</th>
                <th>Ulice</th>>
                <th>Do města</th>
                <th>Ulice</th>
                <th>Počet kilometrů</th>
                
                </tr>
                
                <tr>
                    <td><c:out value="${order.date}"></c:out></td>
                    <td><c:out value="${order.cityFrom}"></c:out></td>
                    <td><c:out value="${order.streetFrom}"></c:out></td>
                    <td><c:out value="${order.cityTo}"></c:out></td>
                    <td><c:out value="${order.streetTo}"></c:out></td>
                    <td><c:out value="${order.countOfKm}"></c:out></td>
                    <td><a href="${editUrl}">Edit</a></td>
   					<td><a href="${deleteUrl}">Delete</a></td>
  					
                </tr>
            </c:forEach>
            </table>
        <p align="center">
       
        <br />	
	<a href="<c:url value="/j_spring_security_logout"/>">Logout</a>

        </p>
    </body>
</html>
