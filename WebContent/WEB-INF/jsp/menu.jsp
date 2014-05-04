<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="description" >
        <title>Menu</title>
       <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/style.css" />
</head>

    <body>
        <br />
        <div align="right">
               <a href="${pageContext.request.contextPath}/j_spring_security_logout"/><img src="${pageContext.request.contextPath}/pic/logout.jpg" alt="logout"/></a>
        </div>
        <br /> <br /> <br /> <br /> <br /> 
        <div align="center">
        <a href="menu"><img src="${pageContext.request.contextPath}/pic/menu.jpg" alt="menu"/></a> 
        </div>
        <br /> <br /><br /><br /> 
        <div align="center">
            
         <table>
                <tr>
                    <td> <a href="list"><img src="${pageContext.request.contextPath}/pic/vypuz.jpg" alt="vypis"/></a></td>
                    <td> <a href="new"><img src="${pageContext.request.contextPath}/pic/novy.jpg" alt="novy"/></a> </td>
                </tr>
                <tr>
                    <td><a href="list"><img src="${pageContext.request.contextPath}/pic/vypis.jpg" alt="vypis" /></a> </td>
                    <td><a href="new"><img src="${pageContext.request.contextPath}/pic/nova.jpg" alt="novy"/></a></td>
                </tr>
             </table>
           
        <br />
 
        </div>
        
        
    </body>
</html>

