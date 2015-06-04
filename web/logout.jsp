
<%@ page import="partha.chat.*" errorPage="error.jsp" %>
<HTML>
<HEAD>
<TITLE>You have logged out</TITLE>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/chat.css">
</HEAD>

<BODY>
<div align="center">
<center>

<%
	String username = (String)session.getAttribute("username");
	if (username != null && username.length() > 0)
	{
		ChatRoomList roomlist = (ChatRoomList) application.getAttribute("chatroomlist");
		ChatRoom chatRoom = roomlist.getRoomOfChatter(username);
		if ( chatRoom != null)
		{
			chatRoom.removeChatter(username);
			session.invalidate();
			response.sendRedirect("index.jsp");
		}
	}
	else
	{
		response.sendRedirect("index.jsp");
	}
	%>
</center>
</div>
</BODY>
</HTML>