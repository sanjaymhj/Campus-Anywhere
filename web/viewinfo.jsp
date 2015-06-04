
<%@page import="database.Login"%>
<%@page import="java.util.HashMap"%>
<%@ page errorPage="error.jsp" import="java.util.Set,java.util.Iterator,java.util.Map,partha.chat.*"%>
<%
String username = request.getParameter("chatterName");
String userName=(String)session.getAttribute("username");
%>

<HTML>
<HEAD>

<TITLE><%=username%>'s information</TITLE>
<LINK rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/ces.css">
        <LINK rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/proj.css">
        <script src="js/jquery.min.1.3.2.js"></script>
<LINK rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/fortest.css">
<link rel="icon" 
      type="image/png" 
      href="images/calogo2.png"/>
</HEAD>

<BODY >
<%

if(userName!=null)
{
                if (username != null)
{
	ChatRoomList roomList = (ChatRoomList)application.getAttribute("chatroomlist");
ChatRoom chatRoom = roomList.getRoomOfChatter(username);
if (chatRoom != null)
{
Chatter chatter = chatRoom.getChatter(username);
    if(chatter.getFirstName()!=null)
    {
%>
<div style="line-height:25px; font-size: 20px;">

    <%
        String lblid = "ID ";
        if(username.startsWith("prof"))
        {
            lblid="Professor ID";
        }
        %><p><table>
            <tr><td>
                    <label><%=lblid%>: </label></td><td><b><%=username%></b></td></tr>
            <tr><td><label>Name: </label></td><td><%=chatter.getFirstName()+" "+chatter.getLastName()%></td></tr>
            <tr><td><label>Sex: </label></td><td><%=chatter.getSex()%></td></tr>
            <tr><td><label>Date of Birth: </label></td><td><%=chatter.getDOB()%></td></tr>
            <tr><td><label>Email: </label></td><td><%=chatter.getEmail()%></td></tr>
<tr><td><label>Education: </label></td><td><%=chatter.getEduLevel()%></td></tr>
<tr><td><label>School: </label></td><td><%=chatter.getSchool()%></td></tr>
<tr><td><label>Country: </label></td><td><%=chatter.getCountry()%></td></tr>
<tr><td><label>City: </label></td><td><%=chatter.getCity()%></td></tr>
<tr><td><label>Contact: </label></td><td><%=chatter.getMobile()%></td></tr>
        </table>
</p>

</div>

<%
    }
    else
    {
        %><div><p style="color:red;">Sorry No registration for ID : <%=username%></p></div><%
    }
}
else
{
   

%>
<div>

    <%
        String lblid = "ID ";
        if(username.startsWith("prof"))
        {
            lblid="Professor ID";
        }
        HashMap profiledata=new HashMap();
        profiledata=Login.getProfile(username);
        if((String)profiledata.get("fname")!=null)
        {
    %>
    <p>
    <table>
        
        <tr><td><label><%=lblid%>: </label></td><td><%=username%></td></tr>
<tr><td><label>Name: </label></td><td><%=(String)profiledata.get("fname")+profiledata.get("lname")%></td></tr>
<tr><td><label>Sex: </label></td><td><%=(String)profiledata.get("sex")%></td></tr>
<tr><td><label>Date of Birth: </label></td><td><%=(String)profiledata.get("dob")%></td></tr>
<tr><td><label>Email: </label></td><td><%=(String)profiledata.get("email")%></td></tr>
<tr><td><label>Education: </label></td><td><%=(String)profiledata.get("edu_level")%></td></tr>
<tr><td><label>School: </label></td><td><%=(String)profiledata.get("school")%></td></tr>
<tr><td><label>Country: </label></td><td><%=(String)profiledata.get("country")%></td></tr>
<tr><td><label>City: </label></td><td><%=(String)profiledata.get("city")%></td></tr>
<tr><td><label>Contact: </label></td><td><%=(String)profiledata.get("mobile")%></td></tr>
    </table></p>

</div>
<%
        }
        else//else for the data of student
        {
            %><div><p style="color:red;">Sorry No registration for ID : <%=username%></p></div><%
        }
}
}
else
{
%>
<div align="center">

<span class="error">No username provided.</span>

</div>
<%
}
}
else
{
    response.sendRedirect("error.jsp?username="+userName);
}
%>
</BODY>
</HTML>