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
        <a href="menu"><img src="${pageContext.request.contextPath}/menu.png" alt="menu"/></a> 
        </div>
        <br /> <br /><br /><br /> 
        <div align="center">
            
        <a href="list"><img src="${pageContext.request.contextPath}/vypis.png" alt="vypis"/></a> 
        <a href="new"><img src="${pageContext.request.contextPath}/novy.png" alt="novy"/></a> 
        <br /><br />
        <a href="list"><img src="${pageContext.request.contextPath}/vypis_objednavek.png" alt="vypis" /></a> 
        <a href="new"><img src="${pageContext.request.contextPath}/nova_objednavka.png" alt="novy"/></a> 
        </div>
    </body>
</html>
