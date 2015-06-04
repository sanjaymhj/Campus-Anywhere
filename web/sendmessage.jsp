<%-- 
    Document   : sendMessage
    Created on : Aug 4, 2014, 9:39:16 PM
    Author     : partha
--%>

<%@page import="partha.chat.Message"%>
<%@page import="partha.chat.Chatter"%>
<%@page import="partha.chat.ChatRoom"%>
<%@page import="partha.chat.ChatRoomList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
    </head>
    <body>
        
       <% 
           System.out.println("At sendmessage.jsp");
	
           
	String username = (String)session.getAttribute("username");
        if(username!=null)
        {
            ChatRoomList roomList = null;
	ChatRoom chatRoom = null;
	
	
        String msg=null;
	String userName=null; 
           roomList = (ChatRoomList)application.getAttribute("chatroomlist");
		 chatRoom = roomList.getRoomOfChatter(username);
		if ( chatRoom != null)
		{
			 msg = request.getParameter("msg");
                         userName=request.getParameter("usr");
                         System.out.println(msg);
                         System.out.println(userName);
                         if ( msg != null && msg.length() > 0)
			{
				msg = msg.trim();
				chatRoom.addMessage(new Message(userName, msg, new java.util.Date().getTime()));
		
                        }
                 }
		else
		{
			out.write("<h2 class=\"error\">Your room couldn't be found. You can't send message</h2>");
		}
        }
        else
        {
            response.sendRedirect("index.jsp");
        }
	
	
        %>
        
    </body>
</html>
