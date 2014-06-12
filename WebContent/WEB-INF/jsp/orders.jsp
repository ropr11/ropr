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
                 </tr>
                 <tr>
                     <td colspan='2' align="center">
                     	<input name="submit" type="submit" value="Zobraz objednávky" />
                    </td>  
                </tr> 
            </table>
        </form>
                        
        <table  >
           
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
                 <th>Upravit</th>
                 <th>Smazat</th>
                
                </tr>
                
                <tr>
                    <td><c:out value="${order.date}"></c:out></td>
                    <td><c:out value="${order.cityFrom}"></c:out></td>
                    <td><c:out value="${order.streetFrom}"></c:out></td>
                    <td><c:out value="${order.cityTo}"></c:out></td>
                    <td><c:out value="${order.streetTo}"></c:out></td>
                    <td><c:out value="${order.countOfKm}"></c:out></td>
                    <td><c:out value="${order.status}"></c:out></td>
                    <td><a href="${editUrl}"><img src="${pageContext.request.contextPath}/pic/upravit.jpg"></a></td>
                <td><a href="${deleteUrl}"><img src="${pageContext.request.contextPath}/pic/smazat.jpg"></a></td>
  					
                </tr>
            </c:forEach>
            </table>
        
    </body>
</html>
