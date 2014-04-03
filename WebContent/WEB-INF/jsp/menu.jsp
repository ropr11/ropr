<%-- 
    Document   : menu
    Created on : 5.3.2014, 10:50:40
    Author     : Gahybook
--%>

<%@page contentType="text/html" pageEncoding="windows-1250"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="description" >
        <title>Menu</title>
       <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/style.css" />
</head>

    <body>
        <br /> <br /> 
        <div align="center">
        <a href="menu"><img src="${pageContext.request.contextPath}/pic/menu.jpg" alt="menu"/></a> 
        </div>
        <br /> <br /><br /><br /> 
        <div align="center">
            
        <a href="list"><img src="${pageContext.request.contextPath}/pic/vypuz.jpg" alt="vypis"/></a> 
        <a href="new"><img src="${pageContext.request.contextPath}/pic/novy.jpg" alt="novy"/></a> 
        <br /><br />
        <a href="list"><img src="${pageContext.request.contextPath}/pic/vypis.jpg" alt="vypis" /></a> 
        <a href="new"><img src="${pageContext.request.contextPath}/pic/nova.jpg" alt="novy"/></a> 
        <br />
        <a href="${pageContext.request.contextPath}/j_spring_security_logout"/><img src="${pageContext.request.contextPath}/pic/logout.jpg" alt="logout"/></a>
        </div>
        
        
    </body>
</html>
