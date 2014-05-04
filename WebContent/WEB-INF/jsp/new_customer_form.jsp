<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
     <div align="right">
        <a href="${pageContext.request.contextPath}/j_spring_security_logout"/><img src="${pageContext.request.contextPath}/pic/logout.jpg" alt="logout"/></a><br/>
      <a href="/RoprProjekt/customer/menu"><img src="${pageContext.request.contextPath}/pic/zpet.jpg"></a>
    </div>
        <h3 align="center">Vyplňte, prosím, své osobní údaje:</h3>
            <form:form method="POST" modelattribute="user" commandName="new">
                Jméno:
                <spring:bind path="Name">
                    <input type="text" name="${status.expression}" value="${status.value}">
                </spring:bind>
                     <br/>
                Login:
                <spring:bind path="Login">
                    <input type="text" name="${status.expression}" value="${status.value}">
                </spring:bind>
                     <br/>
                Password:
                <spring:bind path="Password">
                    <input type="password" name="${status.expression}" value="${status.value}">
                </spring:bind>
                <input type="submit" value="OK">
            </form:form>
      </body>
</html>