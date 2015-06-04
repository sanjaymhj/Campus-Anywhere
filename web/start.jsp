
<%@ page errorPage="error.jsp" import="java.util.Set,java.util.Iterator,java.util.Map,partha.chat.*"%>
<%
	String roomname = request.getParameter("rn");
	String username = (String)session.getAttribute("username");
	ChatRoomList roomlist = (ChatRoomList) application.getAttribute("chatroomlist");
	if (username == null)
	{
		response.sendRedirect("index.jsp");
	}
	else if (roomname == null)
	{
		response.sendRedirect("listrooms.jsp?see=yes");
	}
	else
	{
		ChatRoom chatRoom = roomlist.getRoom(roomname);
		if (chatRoom == null)
		{
			out.write("<font color=\"red\" size=\"1\">Room " + roomname + " not found</font>");
			out.close();
			return;
		}
		ChatRoom chatRoomOld = roomlist.getRoomOfChatter(username);
		if (chatRoomOld != null && chatRoom != null)
		{
			Chatter chatter = chatRoomOld.getChatter(username);
			
			if (!chatRoomOld.getName().equals(chatRoom.getName())&&!chatRoom.isKickedOut(username))
			{
				chatRoomOld.removeChatter(username);
				chatRoom.addChatter(chatter);
				
				chatter.setEnteredInRoomAt(new java.util.Date().getTime());

			}
                        else if(chatRoom.isKickedOut(username))
                        {
                            response.sendRedirect("listrooms.jsp?see=yes&kick=yes");
                        }
			if (session.getAttribute("username") == null)
			{
				session.setAttribute("username", username);
			}
			response.sendRedirect("chat.jsp");
		}
		else
		{
			out.write("<span class=\"error\">Some error occured");
		}
	}	
%>