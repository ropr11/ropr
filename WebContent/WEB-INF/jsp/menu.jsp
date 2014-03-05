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
       <style type="text/css">
       * {
              margin: 0px;
              padding: 0px;outline: none;
       }
       body {
              background: #CCCCCC;
       }
       form {
              border: 1px solid #270644;
              width: 250px;
              text-align: center; 
              -moz-border-radius: 20px;
              -webkit-border-radius: 20px;
              background: #D3D3D3;
              margin:50px auto;
              padding: 10px;
              -moz-box-shadow:0px -5px 300px #270644;
              -webkit-box-shadow:0px -5px 300px #270644;
       }
       label {
              font-size: 12px;
              font-family: arial, sans-serif;
              list-style-type: none;
              color: #FFE1FF;
              text-shadow: #000 1px 1px;
              margin-bottom: 10px;
              font-weight: bold;
              letter-spacing: 1px;
              text-transform: uppercase;
              display: block;
       }
       input {
         -webkit-transition-property: -webkit-box-shadow, background;
         -webkit-transition-duration: 0.25s;
              padding: 6px;
              border-bottom: 0px;
              border-left: 0px;
              border-right: 0px;
              border-top: 1px solid #ad64e0;
              -moz-box-shadow: 0px 0px 2px #000;
              -webkit-box-shadow: 0px 0px 2px #000;
              margin-bottom: 10px;
              background: #FFE1FF;
              width: 170px;
       }
       input.submit {
         -webkit-transition-property: -webkit-box-shadow, background;
         -webkit-transition-duration: 0.25s;
              width: 100px;
              background: -webkit-gradient(linear, 0% 0%, 0% 100%, from(#66FFFF), to(#781bb9)); 
              background:  -moz-linear-gradient(19% 75% 90deg,#781bb9, #66FFFF);
              color: #fff;
              text-transform: uppercase;
              text-shadow: #000 1px 1px;
              border-top: 1px solid #ad64e0;
              margin-top: 10px;
       }
       input.submit:hover {
              -webkit-box-shadow: 0px 0px 2px #000;
              background: -webkit-gradient(linear, 0% 0%, 0% 100%, from(#66FFFF), to(#781bb9));
              background:  -moz-linear-gradient(19% 75% 90deg,#781bb9, #66FFFF);
       } 
       input.submit:active {
              background: -webkit-gradient(linear, 0% 0%, 0% 100%, from(#781bb9), to(#66FFFF));
              background:  -moz-linear-gradient(19% 75% 90deg,#66FFFF, #781bb9);
       }
       input:hover {
              -webkit-box-shadow: 0px 0px 4px #000;
              background: #F5F5F5;
       }
       </style>
</head>

    <body>
        <a href="customer.htm">Výpis uživatelù</a> 
        <a href="new_customer_form.htm">Nový uživatel</a> 
        
    </body>
</html>
