<%-- 
    Document   : getpassword
    Created on : Aug 22, 2014, 3:58:14 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <LINK rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/ces.css">
        <LINK rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/proj.css">
        <title></title>
    </head>
    <body>
    <center>
        <form method="post" action="<%=request.getContextPath()%>/servlet/sendMail">
            <br/><br/><br/>
            <input placeholder="Your Login ID" type="text" size="25" name="loginid"/><br/><br/>
            <input type="submit" class="btn btn-sm btn-success"/>
        </form>
            </center>
    </body>
</html>
