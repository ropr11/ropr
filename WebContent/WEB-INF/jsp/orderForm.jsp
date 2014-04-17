<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Objednávka</title>
</head>
<body>
<h1>Objednávka služby</h1>
<br>
<form:form action="new" modelAttribute="order" method="POST">
    <label for="dateInput">Datum: </label>
    <form:input path="date" id="dateInput"></form:input>
    <form:errors path="date" cssclass="error"></form:errors>
    <br />
     <table>
     <tr>
     <th>Odvoz z</th>
     </tr>
     <tr>
	     <td>
	    	 <label for="cityFromInput">Město: </label>
	   		 <form:input path="cityFrom" id="cityFrom"></form:input>
	    	 <form:errors path="cityFrom" cssclass="error"></form:errors>
	     </td>
     </tr>
      <tr>
	     <td>
	    	 <label for="streetFromInput">Ulice: </label>
	   		 <form:input path="streetFrom" id="streetFrom"></form:input>
	    	 <form:errors path="streetFrom" cssclass="error"></form:errors>
	     </td>
     </tr>
     </table>
    
    <br />
    
      <table>
     <tr>
     <th>Odvoz do</th>
     </tr>
     <tr>
	     <td>
	    	 <label for="cityToInput">Město: </label>
	   		 <form:input path="cityTo" id="cityTo"></form:input>
	    	 <form:errors path="cityTo" cssclass="error"></form:errors>
	     </td>
     </tr>
      <tr>
	     <td>
	    	 <label for="streetToInput">Ulice: </label>
	   		 <form:input path="streetTo" id="streetTo"></form:input>
	    	 <form:errors path="streetTo" cssclass="error"></form:errors>
	     </td>
     </tr>
     </table>
     
    <form:input path="orderId" id="orderId" type="hidden"></form:input>
    <br />
     
    <label for="kilometersInput">Počet kilometrů: </label>
    <form:input path="countOfKm" id="countOfKm" disabled="${isCustomer}"></form:input>
    <form:errors path="countOfKm" cssclass="error"></form:errors>
    <br /><br />
    <input type="submit" value="Submit" />
</form:form>
</body>
</html>