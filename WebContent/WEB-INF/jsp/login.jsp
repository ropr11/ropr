<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title>Hlavní strana</title>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/style.css" /> 
</head>
    <body>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
       
        <p align="center">
        Dnes je: <%= (new java.util.Date()).toLocaleString()%>
         <br/>
          <c:set  var="error" scope="request" value="${sessionScope['SPRING_SECURITY_LAST_EXCEPTION'].message}" />
          <c:if test="${error =='Bad credentials'}">
            <div style="color:red" align="center">
                Příhlášení se nezdařilo !!<br /> 
                Nesprávné jméno nebo heslo
            </div>
        </c:if>
        </p>
        
            <br/>
                <br/>
        <%-- <form name='f' action='/login.htm' method='POST'>--%> 
        <form name='f' action='/RoprProjekt/j_spring_security_check' method='POST'>
            <table>  
                <tr>  
                    <td>User:</td>  
                    <td><input type='text' name='j_username' >  
                    </td>  
                </tr>  
                <tr>  
                    <td>Password:</td>  
                    <td><input type='password' name='j_password' />  
                    </td>  
                </tr>  
                <tr>  
                    <td colspan='2'><input name="submit" type="submit"  
                                           value="submit" />  
                    </td>  
                </tr>  
                <tr>  
                    <td colspan='2'><input name="reset" type="reset" />  
                    </td>  
                </tr>
                <tr>
                <td><a href="remind">Zapomenuté heslo</a></td>
                </tr>  
            </table>  
        </form>  
    </body>
</html>
