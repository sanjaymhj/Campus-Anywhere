<%-- 
    Document   : kickedout
    Created on : Aug 23, 2014, 11:40:15 AM
    Author     : Admin
--%>

<%@page import="partha.chat.ChatRoomList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    </head>
    <body>
        <%
            String username=(String)session.getAttribute("username");
            String rn=(String)request.getParameter("rn");
            if(username!=null)
            {
            if(((ChatRoomList)application.getAttribute("chatroomlist")).getRoom(rn).isKickedOut(username))
            {
               
        %>
        kicked
        <%
            }
            else
            {
                
                %>
        not_kicked
        <%
            }
            }
            else
            {
                response.sendRedirect("index.jsp");
            }
        %>
    </body>
</html>
