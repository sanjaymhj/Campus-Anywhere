<%-- 
    Document   : postnotice
    Created on : Aug 1, 2014, 6:31:43 PM
    Author     : partha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String username=(String)session.getAttribute("username");
    if(username==null || username.contains("stu"))
    {
        response.sendRedirect("error.jsp?username="+username+"auth=no");
    }
        
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <LINK rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/ces.css">
<LINK rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/proj.css">
<link rel="icon" 
      type="image/png" 
      href="images/calogo2.png"/>
    </head>
    <body>
    <center>
        <form  action="<%=request.getContextPath()%>/servlet/notice?username=<%=session.getAttribute("username")%>" method="post">
          
            <label>Topic: </label><br/><input type="text" name="title" required="required"/><br/>
            <label>Description: </label><br/><textarea style="height:100px" name="notice" required="required"></textarea><br/>
            <input class="btn btn-sm btn-success" type="submit" onclick="window.close()"/>
        </form>
    </center>
    </body>
</html>
