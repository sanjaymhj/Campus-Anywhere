<%-- 
    Document   : getprofname
    Created on : Aug 23, 2014, 7:58:48 AM
    Author     : Admin
--%>

<%@page import="partha.chat.ChatRoomList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String username = (String)session.getAttribute("username");
    if(username!=null)
    {
        
        String prof=((ChatRoomList)application.getAttribute("chatroomlist")).getRoomOfChatter(username).getProfessorId();
        %>
        <%=prof%>
<%
    }
    else
    {
        response.sendRedirect("index.jsp");
    }
%>
