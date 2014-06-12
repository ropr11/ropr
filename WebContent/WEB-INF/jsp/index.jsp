<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
             
        <br /><br />
        
        <br />
        <a href="${pageContext.request.contextPath}/j_spring_security_logout"/><img src="${pageContext.request.contextPath}/pic/logout.jpg" alt="logout"/></a>
        </div>
        
        
    </body>
</html>
                
                
        <%-- <form name='f' action='/login.htm' method='POST'>--%> 
        <form name='f' action='j_spring_security_check' method='POST'>
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
            </table>  
        </form>  
    </body>
</html>
