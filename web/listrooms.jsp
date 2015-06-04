
<%@ page session="true" errorPage="error.jsp" import="java.util.Set,java.util.Iterator,java.util.Map,partha.chat.*"%>
<HTML>
<HEAD>
<TITLE>Campus Anywhere Class Rooms</TITLE>
<LINK rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/ces.css">
<LINK rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/proj.css">
        <script src="js/jquery.min.1.3.2.js"></script>
<link rel="icon" 
      type="image/png" 
      href="images/calogo2.png"/>

</HEAD>

<BODY>
<script src="js/cajs.js"></script>
<%

String username = (String) session.getAttribute("username");
if (username == null || username == "")
{
	response.sendRedirect("index.jsp");
	//System.out.println("Redirecting");
}
else
{
	String roomname = null;	
%>
<%@ include file="/heade.html" %>
<div class="main" style="height: 300px;">
    <div class="wrapper">
        <div class="con-main">   
            <%
                String name= ((ChatRoomList)application.getAttribute("chatroomlist")).getRoomOfChatter(username).getChatter(username).getFirstName();
            
            %>
<BR><div class="navl"><h3>Welcome <span class="chattername"><%=name%></span></h3></div>

<div>
    <div class="control-btn">
        <input type="button" value="Show Classes" class="btn btn-sm btn-primary" id="showclass" name="jpt1"/></div>
 <%
        ChatRoomList roomlist = (ChatRoomList)application.getAttribute("chatroomlist");
	ChatRoom[] chatrooms = roomlist.getRoomListArray();	
                        if(username.startsWith("prof"))
                        {
                            Chatter chatter = roomlist.getRoomOfChatter(username).getChatter(username);
                            String rname=chatter.getFirstName()+"_"+chatter.getLastName()+"_("+username+")";
        %>
     <div class="control-btn"><FORM action="start.jsp?rn=<%=rname%>" method="post">
            <input type="Submit" value="Start Lecture" class="btn btn-sm btn-primary" />
        </FORM></div>
      
    <div class="control-btn"><input type="button" value="View Student" class="btn btn-sm btn-primary" id="view_s" /></div>

        <%}else{%>
  
<%}%> 

  <div class="control-btn"><input type="button" value="My Info" class="btn btn-sm btn-primary" id="my_in" /></div>
  
</div></div>
  <%if(username.startsWith("prof"))
                        {
                            Chatter chatter = roomlist.getRoomOfChatter(username).getChatter(username);
                            String rname=chatter.getFirstName()+"_"+chatter.getLastName()+"_("+username+")";
        %>
            <div id="pb_n" class="dyn_cont"><p>Publish Notice</p></div> 
            <div id="view_stu" class="dyn_cont"><p><iframe width="900" height="500" src="findbyid.jsp?ch"></iframe></p></div>
            <div id="my_info" class="dyn_cont">
              
            <iframe height="400px" width="900px" src="viewinfo.jsp?chatterName=<%=username%>" > </iframe></DIV>
            <%}else{%>
            
                        <div id="my_info" class="dyn_cont"><p><iframe height="200px" width="500px" src="viewinfo.jsp?chatterName=<%=username%>" > </iframe></p></div> 
<%}%>
              
        

 <script>
     function winopen(path)
{
	chatterinfo = window.open(path,"chatterwin","scrollbars=yes,resizable=yes, width=400, height=300, location=no, toolbar=no, status=no");
	chatterinfo.focus();
}
     
     
     $("#showclass").click(function () {
                         $("#classlist").slideDown("slow");
                         $("#pb_n").slideUp("fast");
                         $("#view_stu").slideUp("fast");
                          $("#v_n").slideUp("fast");
                          $("#my_info").slideUp("fast");
                         });
        $("#publish_n").click(function () {
                         $("#classlist").slideUp("fast");
                         $("#pb_n").slideDown("slow");
                         $("#view_stu").slideUp("fast");
                         $("#v_n").slideUp("fast");
                         $("#my_info").slideUp("fast");
                         });
         $("#view_s").click(function () {
                         $("#classlist").slideUp("fast");
                         $("#pb_n").slideUp("fast");
                         $("#view_stu").slideDown("slow");
                         $("#v_n").slideUp("fast");
                         $("#my_info").slideUp("fast");                     
    });
         $("#view_n").click(function () {
                         $("#classlist").slideUp("fast");
                         $("#pb_n").slideUp("fast");
                         $("#view_stu").slideUp("fast");
                         $("#v_n").slideDown("slow");
                         $("#my_info").slideUp("fast");
                         });
        $("#my_in").click(function () {
                         $("#classlist").slideUp("fast");
                         $("#pb_n").slideUp("fast");
                         $("#view_stu").slideUp("fast");
                         $("#v_n").slideUp("fast");
                         $("#my_info").slideDown("slow");
                         
                         });
      </script>

<div id="classlist" class="dyn_cont">
    <table>
         <%		
        int p=0;
        try
        {%>
        <thead><tr><th id="numth">#</th>
                <th>Professor</th>
               </tr><hr /></thead><tbody>
                <%
             roomname = roomlist.getRoomOfChatter(username).getName();
             roomname = roomname.trim();
	%>
        <form name="chatrooms" action="<%=request.getContextPath()%>/start.jsp" method="post">                    
	<%              
            for (int i = 0,a=1; i < chatrooms.length; i++)
            {
		if (chatrooms[i].getName().equalsIgnoreCase("StartUp") || chatrooms[i].getName().contains(username))
                    continue;
                %>
                <tr>
                <td><%=a++%><INPUT type="radio" name="rn" value="<%=chatrooms[i].getName()%>" />
                        <%if (chatrooms[i].getName().equals(roomname))
                            p=1;
                        
               %>
                <td><a href="javascript:winopen('viewinfo.jsp?chatterName=<%=chatrooms[i].getProfessorId()%>')" style="text-decoration: none;"><%=chatrooms[i].getName()%></A></td>
               <td><%=chatrooms[i].getDescription()%></td></tr><hr/>
                <%}    
            }
	catch(Exception e)
	{
            System.out.println("Unable to get handle to Servlet Context: " + e.getMessage());
            e.printStackTrace();
        }
%>
    <% //if(p==1){%>
                <tr cols="2"><div class="div-bt">
    <INPUT type="Submit" value="Enter Class Room" class="btn btn-sm btn-primary"><BR/>
    <%
        if(request.getParameter("kick")!=null)
        {
    %>
    <FONT color="red">You are kicked out of this class by the Professor.</Font><br/>
    <%
        }
    %>       </div></tr>
                <%//}
    //else{%><!--<FONT color="red">No such class found.</Font><br/>--><%//}%>
        </form></tbody></table>
            </div><!--end of div classlist -->
              
</div><!--end div of con-main-->
    <%}%>
   

<%@ include file="/foote.html"%>
<!--end div of main-->
</BODY>
</HTML>