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
     <div align="right">
        <a href="${pageContext.request.contextPath}/j_spring_security_logout"/><img src="${pageContext.request.contextPath}/pic/logout.jpg" alt="logout"/></a><br/>
      <a href="/index.htm"><img src="${pageContext.request.contextPath}/pic/zpet.jpg"></a>
    </div>
    
    <h3 align="center">Výpis objednávek</h3>
    
        <br/>
        <form name='find' action='find' method='POST'>
            <table width="380">  
                <tr >  
                    <td>Jméno zákazníka:</td>  
                    <td>Příjmení zákazníka:  </td>
                </tr>
                <tr>
                     <td><input type='text' name='name' ></td>   
                     <td><input type='text' name='surname'></td>  
                  
                    <td colspan='2'>
                     	<input name="submit" type="submit" value="Zobraz objednávky" />
                    </td>  
                </tr> 
        
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
                 <th>Status objednávky</th>
                
                </tr>
                
                <tr>
                    <td><c:out value="${order.date}"></c:out></td>
                    <td><c:out value="${order.cityFrom}"></c:out></td>
                    <td><c:out value="${order.streetFrom}"></c:out></td>
                    <td><c:out value="${order.cityTo}"></c:out></td>
                    <td><c:out value="${order.streetTo}"></c:out></td>
                    <td><c:out value="${order.countOfKm}"></c:out></td>
                    <td><c:out value="${order.status}"></c:out></td>
                    <td><a href="${editUrl}">Edit</a></td>
   					<td><a href="${deleteUrl}">Delete</a></td>
  					
                </tr>
            </c:forEach>
            </table>
        
    </body>
</html>
