<%-- 
    Document   : fullnotice
    Created on : Aug 3, 2014, 11:52:47 AM
    Author     : partha
--%>

<%@page import="database.NoticeBoard"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Full Notice</title>
        <link rel="icon" 
      type="image/png" 
      href="images/calogo2.png"/>
        <style>
            .contain
            {
                background:#ddd;
                border-radius: 4px;
                padding:8px;
                margin:5px;
                
            }
            </style>
    </head>
    <body>
        <%
            String username=(String)session.getAttribute("username");
            if(username!=null)
            {
                String noticeid=request.getParameter("id");
                String title=request.getParameter("ti");
                String date=request.getParameter("d");
                String notice=NoticeBoard.getNotice(noticeid);
        %>
        <div align="center">
            
                <div class="contain"><h2><%=title%></h2></div>
                <div class="contain"><p><b><%=noticeid%></b><br/><font size="2"><%=date%></font></p></div>
                <div class="contain"><p><%=notice%></p></div>
            
        </div>
        
        <%

            }
            else
            {
                response.sendRedirect("error.jsp?username=");
            }
        %>
    </body>
</html>
