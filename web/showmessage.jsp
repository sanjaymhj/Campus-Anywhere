<%-- 
    Document   : showmessage
    Created on : Jul 28, 2014, 12:36:40 PM
    Author     : partha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isErrorPage="false" errorPage="error.jsp" import="java.util.Set,java.util.Iterator,java.util.Map,java.util.Date,java.text.DateFormat,partha.chat.*"%>
<html><head> <LINK rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/ces.css">
<LINK rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/proj.css">
</head>
<body>
<%
        String roomName = null;
        String username = (String)session.getAttribute("username");
        ChatRoomList roomList = null;
	ChatRoom chatRoom = null;
	Chatter chatter = null;
	Message[] messages = null;
        String msg="";

        if (username != null)
	{
		try
		{
                    
			roomList = (ChatRoomList) application.getAttribute("chatroomlist");
                        
			roomName = roomList.getRoomOfChatter(username).getName();
                        
			if (roomName != null && roomName != "")
			{
                            
				chatRoom = roomList.getRoom(roomName);
				chatter = chatRoom.getChatter(username);
				if (chatRoom != null)
				{
					//long enteredAt = chatter.getEnteredInRoomAt();
					//if (enteredAt != -1)
					//{
					//	messages = chatRoom.getMessages(enteredAt);					
					//}
					//else
					//{
						messages = chatRoom.getMessages(chatter.getLoginTime());
				//	}

				}
				else
				{
//					out.write("<b>Room " + roomName + " not found</b>");
//					out.close();
				}
			}
		}
		catch(Exception e)
		{
			System.out.println("Exception: "+ e.getMessage());
			throw new ServletException("Unable to get handle to ServletContext");
		}	
	if(messages != null && messages.length > 0)
	{       
                for(int i=0;i<messages.length;i++)
                {
                    Message message = messages[i];
                    String chatterName = message.getChatterName();
                    String strmsg = message.getMessage();
                    long time = message.getTimeStamp();
                    String timenew=Long.toString(time);
                
                    Date date = new Date(time);
                    msg="<font face=\"Arial\" color=\"blue\" size=\"2\"><b>"+chatterName + " ("+ DateFormat.getTimeInstance().format(date)+ ")&gt;</b></font> " + strmsg + "<br>\n";
                %>
<%=msg%>                    
<%
                }
                                       
    	}
	else
        {
            %>
            <%="<font color=\"red\" face=\"Arial\" size=\"2\">There are currently no messages in this room</font>"%>
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