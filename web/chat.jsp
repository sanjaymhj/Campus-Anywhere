<%@ page isErrorPage="false" errorPage="error.jsp" import="java.util.Set,java.util.Iterator,java.util.Map,java.util.Date,java.text.DateFormat,partha.chat.*"%>
<%
	String roomName = null;
	String username = (String)session.getAttribute("username");
	ChatRoomList roomList = null;
	ChatRoom chatRoom = null;
	Chatter chatter = null;
	Message[] messages = null;
    String msg=null;
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
					out.write("<b>Room " + roomName + " not found</b>");
					out.close();
				}
			}
		}
		catch(Exception e)
		{
			System.out.println("Exception: "+ e.getMessage());
			throw new ServletException("Unable to get handle to ServletContext");
		}	
	
%>
<HTML>
<HEAD>
    <META content="no-cache"/>
    <TITLE>Online Class Network</TITLE>
    <LINK rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/ces.css">
        <LINK rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/proj.css">
        <link rel="icon" 
      type="image/png" 
      href="images/calogo2.png"/>
        <script src="js/jquery.min.1.3.2.js"></script>
<LINK rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/fortest.css">
<%
	int refreshAfter = 10000; // 10 seconds
	String t = application.getInitParameter("refreshAfter"); // gets seconds
	if (t != null)
	{
		try
		{
                    refreshAfter = Integer.parseInt(t);
                    refreshAfter = refreshAfter * 1000; // convert to mili seconds
		}
		catch (NumberFormatException nfe)
		{	
                    nfe.printStackTrace();
		}
	}
%>
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<SCRIPT type="text/javascript">


function winopen(path)
{
	chatterinfo = window.open(path,"chatterwin","scrollbars=yes,resizable=yes, width=400, height=300, location=no, toolbar=no, status=no");
	chatterinfo.focus();
}

function showmsg()
{ 
    $.get("showmessage.jsp", function (data) 
    {
//    do operation using the data
            $("#mess").html(data); 
         
    });
}

function sendMessage()
{
    var a= $("#messagebox").val();
    $.get("sendmessage.jsp?msg="+a+"&usr=<%=username%>", function (data) 
    {
        $("#messagebox").val("");
    });
    
}
$(document).ready(function (){
    $("#messagebox").keypress(function(event){
          if ( event.which == 13 ) {
             event.preventDefault();
             sendMessage();
          }        
    });
});
function KickedOutAction()
{
    
        $.get("iskickedout.jsp?rn=<%=roomName%>",function (data){
        $("#kick").html(data);
        var a=document.getElementById('kick').textContent.trim();
        //alert(a);
        if(a==='kicked')
            window.location.replace("listrooms.jsp?see=yes&kick=yes");
            
    });
    
}  
function kickout (a)
{
    
    $.get("kickout.jsp?name="+a,function (data){
               
    });
}
function listchatters()
{
   
    $.get("listchatters.jsp",function(data){
        $("#ch_list").html(data);
    });
}

function listNotice()
{
    $.get("listnotices.jsp?rn=<%=roomName%>",function(data){
        $("#noticeboard").html(data);
       
    });
}

function professorAvailability()
{
    <%
        String prof=chatRoom.getProfessorId();
          
%>
    $.get("professoravailability.jsp?prof=<%=prof%>&rn=<%=roomName%>",function(data){
        $("#profon").html(data);
    });
    
}

function profileVisibility()
{
     $.get("profilevisibility.jsp?",function(data){
         var old=$("#lblprofile").text();
         if(old==="Turn profile visibility on")
         {
             $("#lblprofile").html("<font color=\"red\">Turn profile visibility off</font>");
         }
         else
         {
             $("#lblprofile").html("<font color=\"green\">Turn profile visibility on</font>");
         }
       
    });
}

setInterval('showmsg()', '10');
setInterval('listchatters()', '500');
setInterval('professorAvailability()','10');
setInterval('listNotice()', '1000');
setInterval('KickedOutAction()', '2000');

         
        
    
</script>


</HEAD>
<BODY onLoad="window.location.hash='#current'" >
<%@ include file="/heade.html"%>
<div id="main">
    <DIV id="kick" hidden="hidden"></DIV>
    <br><div style="display: inline-block;">
            
            <%
            
           String profName;
           profName= chatRoom.getProfessor();
        
           if(!roomName.contains(username))
             {                       
                 %>
             <h><i><%=chatter.getFirstName()+" "+chatter.getLastName()%></i> you are in class of Professor 
                 <b><a href="javascript:winopen('viewinfo.jsp?chatterName=<%=roomName.substring(roomName.indexOf('(')+1,roomName.indexOf(')'))%>')"><%=profName%></A></b></H3>
             <%
                    }
                    else
                    {
                %>
             <h3> Professor <i><%=chatter.getFirstName()+" "+chatter.getLastName()%></i> </H3>
                <%
                    }
           %></div>
           <DIV id="profon" style="border: none; display: inline-block;"></DIV>
    <div id="camcon"><iframe width="600px" height="395px" src="newhtml.html"></iframe></div>
          
        <div id="right-con">
            <div style="border-bottom:1px solid grey; height:100px;">
                <div class="control-btn" >
                <input type="button" value="Discussion" class="btn btn-sm btn-primary" id="cht" />
            </div>
            <div class="control-btn">
                <input type="button" value="Notice" class="btn btn-sm btn-primary" id="ntc" />
            </div>
               
		<div class="control-btn">
                	<FORM name="changeRoom" method="post" action="listrooms.jsp?see=yes">
                            <div> <INPUT type="hidden" name="n" class="btn btn-sm btn-primary" value="<%=username%>"></div>
                            <div><INPUT name="ChangeRoom" class="btn btn-sm btn-primary" id="anoterlec" type="submit" value="Attend Another Lecture"></div>
						
                        </FORM>
                </div>
               <div class="control-btn">
                 <INPUT type="button" class="btn btn-sm btn-primary" value="Find" onClick='winopen("find.jsp")'>
               </div>       
                            
                       <div class="control-btn">
                <input type="button" value="Students Here" class="btn btn-sm btn-primary" id="std_here" />
                </div>  
                    
                            <div class="control-btn">
                <input type="button" value="Video Request" class="btn btn-sm btn-primary" id="video_conf" />
                </div>  
                            
            </div>
            
    
    <%
            if(username.startsWith("stu"))
            {
    %>
    <DIV id="profile" style="border: none">
        <INPUT type="checkbox" id="profrd" onChange="javascript:profileVisibility()"/>
        <LABEL id="lblprofile"><FONT color="green">Turn profile visibility on</font></LABEL>
    
    </DIV>
    
    <%
            }
    %>
    
    
    <div id="ch_list" class="dyn_cont" style=" overflow-y: auto; height: 275px;" ></div><!--end of div ch_list-->
    <div id="noticeboard" class="dyn_cont" style=" overflow-y: auto; height: 275px;" ></div><!--end of div noticeboard-->
     <div id="video_req" class="dyn_cont" style=" overflow-y: auto; height: 275px;" ><iframe width="600px" height="395px" src="newhtml_1.html"></iframe><</div><!--end of div video_req-->
    <DIV id="snd" class="dyn_cont">
        
    <DIV id="mess" style="overflow-y: auto; height:275px; border: none; background:white;"></DIV><!--end of div mess-->
    <HR/>
    <SCRIPT>
     $("#cht").click(function () {
                         $("#snd").slideDown("slow");
                         $("#noticeboard").slideUp("fast");
                         $("#ch_list").slideUp("fast");
                         $("#video_req").slideUp("fast");
                        });
          $("#ntc").click(function () {
                         $("#snd").slideUp("fast");
                         $("#noticeboard").slideDown("slow");
                        $("#ch_list").slideUp("fast");
                        $("#video_req").slideUp("fast");
                        });
          $("#std_here").click(function () {
                         $("#snd").slideUp("fast");
                        $("#noticeboard").slideUp("fast");
                        $("#video_req").slideUp("fast");
                        $("#ch_list").slideDown("slow");
                        });
            $("#video_conf").click(function () {
                         $("#snd").slideUp("fast");
                        $("#noticeboard").slideUp("fast");
                        $("#ch_list").slideUp("fast");
                        $("#video_req").slideDown("slow");
                    });
</script>
    <DIV id="sendmsg" style="border: none; backgound:red;">
            <% 
	if (username != null && username.length() > 0)
	{
		 roomList = (ChatRoomList)application.getAttribute("chatroomlist");
		 chatRoom = roomList.getRoomOfChatter(username);
		if ( chatRoom != null)
		{
			 msg = request.getParameter("messagebox");
			
			if ( msg != null && msg.length() > 0)
			{
				msg = msg.trim();
				chatRoom.addMessage(new Message(username, msg, new java.util.Date().getTime()));
			}
%>		
				
<INPUT type="text"  name="messagebox" id="messagebox" maxlength="300" size="35">		
<BUTTON id="send" class="btn btn-sm btn-success" onclick="sendMessage()">Send</BUTTON>
                   
			
        </DIV><!--end of div sendmsg-->
    </DIV>
    </div><!--end of div right-con-->
    
        
         


<%

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
        }
else
{
	response.sendRedirect("index.jsp");
}
%>
</div><!--end div of main-->

<%@include file="/foote.html" %>
</BODY>
</HTML>
