<%-- 
    Document   : professoravailability
    Created on : Jul 31, 2014, 7:26:07 PM
    Author     : partha
--%>

<%@page import="partha.chat.Chatter"%>
<%@page import="partha.chat.ChatRoom"%>
<%@page import="partha.chat.ChatRoomList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
   
    ChatRoomList roomList=null;
    String roomName=null;
    ChatRoom chatRoom=null;
   
    String profName=request.getParameter("prof");
    roomName = request.getParameter("rn");
    roomList = (ChatRoomList) application.getAttribute("chatroomlist");
    
    chatRoom = roomList.getRoom(roomName);
   
    if(chatRoom.chatterExists(profName))
    {
        %>
        <font size="20px" color="green">&bull;</font>
        
        <%
    }
    else
    {
        %>
        <font size="20px" color="maroon">&bull;</font>
        <%
    }
%>