<%-- 
    Document   : profilevisibility
    Created on : Aug 3, 2014, 8:59:16 PM
    Author     : partha
--%>

<%@page import="partha.chat.ChatRoom"%>
<%@page import="partha.chat.ChatRoomList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String username=(String)session.getAttribute("username");
    if(username!=null)
    {
        ChatRoomList roomList=(ChatRoomList)application.getAttribute("chatroomlist");
        ChatRoom chatRoom =roomList.getRoomOfChatter(username);
        chatRoom.getChatter(username).changeProfileVisibility();
        
    }
    else
    {
        response.sendRedirect("index.jsp");
    }
%>