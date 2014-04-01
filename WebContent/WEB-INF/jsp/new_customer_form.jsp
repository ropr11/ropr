<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title>Nový uživatel</title>
       <meta name="description" >
       <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/style.css" />
</head>
    <body>
        <h3 align="center">Vyplňte, prosím, své osobní údaje:</h3>
            <form method="POST" action="#" >
                Jméno:
                    <input type="text" name="jmeno">
                     <br/>
                Login:
                    <input type="text" name="login">
                     <br/>
                Password:
                <select multiple>
                 <c:forEach items="${userRoles}" var="userRole">
                
                    <option>  <c:out value="${userRole.role}" /></option>
                  </c:forEach> 
                 </select>  
                    <input type="password" name="password">
                <input type="submit" value="OK">
                
                
                <table align="center" border="1" cellpadding="5" cellspacing="4" >
                
                    
                
           
            </form>
       <p align="center">
       <a href="${pageContext.request.contextPath}/menu"><img src="/pic/zpet.jpg" alt="zpět"/></a>
       
       
       </p>
    </body>
</html>