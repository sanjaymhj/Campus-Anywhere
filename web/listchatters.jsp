<%-- 
    Document   : listchatters
    Created on : Jul 29, 2014, 6:37:45 PM
    Author     : partha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isErrorPage="false" errorPage="error.jsp" import="java.util.Set,java.util.Iterator,java.util.Map,java.util.Date,java.text.DateFormat,partha.chat.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
        <script type="text/javascript">
            
        </script>
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
                        }
		}
		catch(Exception e)
		{
			System.out.println("Exception: "+ e.getMessage());
			throw new ServletException("Unable to get handle to ServletContext");
		}	
	
      }
        else
        {
            response.sendRedirect("index.jsp");
        }
    
        %>
         <%
        int depr=0;
        if(chatRoom.chatterExists(roomName.substring(roomName.indexOf('(')+1, roomName.indexOf(')'))))
            depr=1;
    %>
        <font color="blue"><%=chatRoom.getNoOfChatters()-depr%> student(s) in this class</font><br><hr/>
	<%
	Chatter[] chatters = chatRoom.getChattersArray();
	for(int i = 0; i < chatters.length; i++)
	{
              if(roomName.contains(chatters[i].getName()))
                continue;
		if (chatters[i].getName().equals(session.getAttribute("username")) || !chatters[i].getProfileVisibility() && !roomName.contains(username))
		{
	%>
	<font face="Arial" size="2" color="blue"><%=chatters[i].getFirstName()+" "+chatters[i].getLastName() + " (" +chatters[i].getName() +")"%><br></font>
	<%
		}
                else if(!roomName.contains(username))
                      
                {%>    
                        <font face="Arial" size="2" color="blue">
                            <a href="javascript:winopen('viewinfo.jsp?chatterName=<%=chatters[i].getName()%>')" title="View information about <%=chatters[i].getFirstName()+" "+chatters[i].getLastName()%>"><%=chatters[i].getFirstName()+" "+chatters[i].getLastName()%></A>
                        (<%=chatters[i].getName()%>)
                        </font><br>
                <%}
                else
                {
                %>
                 <font face="Arial" size="2" color="blue">
                            <a href="javascript:winopen('viewinfo.jsp?chatterName=<%=chatters[i].getName()%>')" title="View information about <%=chatters[i].getFirstName()+" "+chatters[i].getLastName()%>"><%=chatters[i].getFirstName()+" "+chatters[i].getLastName()%></A>
                            (<%=chatters[i].getName()%>) &nbsp;&nbsp;&nbsp;&nbsp;
                 </font>
               
<!--                 <input type="checkbox" onclick="javascript:kickout(<%//=chatters[i].getName()%>)" />&nbsp;&nbsp;-->
                <a href="javascript:kickout('<%=chatters[i].getName()%>')">Click to kickout</a>
                 <%
                    }
                 %>       
                 <br>
                <%
                }
                
	


%>
    </body>
</html>
