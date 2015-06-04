<%-- 
    Document   : kickout
    Created on : Aug 22, 2014, 11:11:21 PM
    Author     : Admin
--%>

<%@page import="partha.chat.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    System.out.println("at kickout.jsp");
    String username=(String) session.getAttribute("username");
    if(username!=null)
    {
       String name = (String)request.getParameter("name");
       ChatRoom chatroom=((ChatRoomList)application.getAttribute("chatroomlist")).getRoomOfChatter(name); 
       Chatter chatter=chatroom.getChatter(name);
       chatroom.KickOut(name,chatter);
       ((ChatRoomList)application.getAttribute("chatroomlist")).getRoom("StartUp").addChatter(chatter);
    }
    else
    {
       response.sendRedirect("index.jsp");
    }
%>