<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Objednávka</title>
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
    <h1 align="center">Objednávka služby</h1>
        <br>
        <form:form action="new" modelAttribute="order" method="POST" >
            <label for="Zákazník"></label>
            <c:out value="${user}">${user}</c:out>
            <label for="dateInput">Datum: </label>
            <form:input path="date" id="dateInput" disabled="${isDisabled}"></form:input>
            <form:errors path="date" cssclass="error"></form:errors>
                <br />
                <table border="3" cellspacing="4" cellpadding="2" frame="box">
                    <tr >
                        <td colspan="2">Odvoz z</td>
                    </tr>
                    <tr>
                        <td>
                            <label for="cityFromInput">Město: </label>
                        <form:input path="cityFrom" id="cityFrom" disabled="${isDisabled}"></form:input>
                        <form:errors path="cityFrom" cssclass="error"></form:errors>
                        </td>
                   
                        <td>
                            <label for="streetFromInput">Ulice: </label>
                        <form:input path="streetFrom" id="streetFrom" disabled="${isDisabled}"></form:input>
                        <form:errors path="streetFrom" cssclass="error"></form:errors>
                        </td>
                    </tr>
                
                    <tr>
                        <td colspan="2">Odvoz do</td>
                    </tr>
                    <tr>
                        <td>
                            <label for="cityToInput">Město: </label>
                        <form:input path="cityTo" id="cityTo" disabled="${isDisabled}"></form:input>
                        <form:errors path="cityTo" cssclass="error"></form:errors>
                        </td>
                   
                        <td>
                            <label for="streetToInput">Ulice: </label>
                        <form:input path="streetTo" id="streetTo" disabled="${isDisabled}"></form:input>
                        <form:errors path="streetTo" cssclass="error"></form:errors>
                        </td>
                    </tr>
                </table>

            <form:input path="orderId" id="orderId" type="hidden" disabled="${isDisabled}"></form:input>
            <form:input path="status" id="status" type="hidden"></form:input>
                <br />
               
           <security:authorize access="hasAnyRole('ADMIN', 'USER')">
                
                <label for="kilometersInput">Počet kilometrů: </label>
            <form:input path="countOfKm" id="countOfKm" disabled="${isCustomer}"></form:input>
            <form:errors path="countOfKm" cssclass="error"></form:errors>
          	
              <br />
            
              <label for="drivers">Řidiči: </label>
              <select name = "driver">
                    <c:forEach items="${drivers}" var="driver">
                        <option value="${driver.idUser}">${driver.name}</option>
                    </c:forEach>
               </select>
            </security:authorize>         
                <br /><br />
                <input type="submit" value="Submit" />
        </form:form>
    </body>
</html>