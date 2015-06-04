<%@page import="database.Login"%>
<%@page import="java.util.HashMap"%>
<%@ page contentType="text/html" language="java" errorPage="error.jsp" import="partha.chat.*"%>

<HTML>
<HEAD>
<TITLE>Find Someone</TITLE>
 <LINK rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/ces.css">
<LINK rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/proj.css">
<link rel="icon" 
      type="image/png" 
      href="images/calogo2.png"/>
</HEAD>
<BODY>
<%
	String userName=(String)session.getAttribute("username");
        if(userName!=null)
        {
            String searchid = request.getParameter("searchid");
            String roomName = null;
		if (searchid != null && searchid.length() > 0)
		{
                        HashMap profiledata=new HashMap();
                        profiledata=Login.getProfile(searchid);
                        if(!profiledata.isEmpty())
                        {
                            String name = (String)profiledata.get("fname")+" "+(String)profiledata.get("lname");
                            try
                            {
            			ChatRoomList roomList = (ChatRoomList)application.getAttribute("chatroomlist");
				ChatRoom chatRoom = roomList.getRoomOfChatter(searchid);
				if (chatRoom != null)
				{
					roomName = chatRoom.getName();
				}
				if (roomName == null || roomName.equalsIgnoreCase("startup"))
				{
                                    
					out.write("<div class=\"contain\"><h3><i><font color=\"green\">" + name + " ("+searchid+")" +"</font></i> not found in any class</h3></div>");
				}
				else
				{
                                    
					out.write("<div class=\"contain\"><h3><i><font color=\"green\">" + name +" ("+searchid+")" +"</font></i> is in class <font color=\"brown\"> "+ roomName + "</font></h2></div>");
				}

                            }
                            catch (Exception e)
                            {
                    		out.write("<div class=\"contain\"><h1>Some problem with server</h1></div>");
                            }
                            
                        }
			else
                        {
                            out.write("<div class=\"contain\"><h4 class=\"error\">Please enter a valid roll number/ID.</h4></div>");
                        }
                 }
            
		else
		{
			out.write("<div class=\"contain\"><h4 class=\"error\">Please enter roll number/ID of the student you want to find below</h4></div>");
		}

        
        }
	else
        {
            response.sendRedirect("error.jsp");
        }
%>

<FORM action="find.jsp" method="post" name="find" id="find">
    <br><STRONG>Roll number/ID </STRONG>
		<INPUT name="searchid" type="text" id="searchid">
		<input type="submit" class="btn btn-sm btn-success" value="Find">
</FORM>
</BODY>
</HTML>
