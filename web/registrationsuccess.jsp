<%-- 
    Document   : registrationsuccess
    Created on : Aug 22, 2014, 1:16:24 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String username =  (String)session.getAttribute("username");
    if(username!=null)
    {
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Success</title>
        <link href="css/proj.css" rel="stylesheet" />
<link href="css/ces.css" rel="stylesheet" />
<link rel="icon" 
      type="image/png" 
      href="images/calogo2.png"/>
<script src="js/jquery.min.1.3.2.js"></script>
    </head>
    <body>
        <div class="navbar navbar-style">
        <div class="container">
          <div><img src="images/calogo2.png"</div><div class="logo"><h1>Campus Anywhere</h1></div>
          </div>
      </div><!--end of container div-->
    </div>
        <div id="main"><div id="navl"><h1>Please check you email for your login detail. <a href="index.jsp">Click here</a> to login.</h1></div></div>
        <%@include file="foote.html" %>
    </body>
</html>
<%
    }
    else
    {
        response.sendRedirect("index.jsp");
    }
%>