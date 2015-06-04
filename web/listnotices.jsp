<%-- 
    Document   : publishnotice
    Created on : Aug 1, 2014, 9:51:59 PM
    Author     : partha
--%>

<%@page import="java.util.*"%>
<%@page import="partha.chat.ChatRoomList"%>
<%@page import="database.NoticeBoard"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <LINK rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/ces.css">
<LINK rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/proj.css">
<link rel="icon" 
      type="image/png" 
      href="images/calogo2.png"/>
    </head>
    <body>
     
        <%
    String username=(String)session.getAttribute("username");
                            String roomName=request.getParameter("rn");
                            if(roomName.contains(username))
                            {
                        %>
                         <div >
                            <BUTTON class="btn btn-sm btn-success" onclick="javascript:winopen('postnotice.jsp')" >Publish Notice</BUTTON>
                         </div>
                        <%
                            }
                           
                        
    if(username==null)
    {
        response.sendRedirect("index.jsp");
    }
    
    else
    {
        if(((ChatRoomList)application.getAttribute("chatroomlist")).getRoomOfChatter(username).getName().equals("StartUp"))
        {
            response.sendRedirect("listrooms.jsp?see=yes");
        }
        List<String[]> notices = new ArrayList<String[]>();
        notices=NoticeBoard.publishNotice((((ChatRoomList)application.getAttribute("chatroomlist")).getRoomOfChatter(username)).getProfessorId());;
        if(notices!=null)
        {
            %>
            <b>Notices</b>
            <table> 
                
                <thead>
        <tr>
               <th class="thead"> Notice ID</th>
            <th>Title</th>
        <th class="thead">Date</th>
        </tr>
    </thead>
   
    <tbody>
            <%        
            for(int i=notices.size()-1;i>=0;i--)
            {
                String notice[]=notices.get(i);
                %>
                <tr>
                    <td><%=notice[0]%></td>
                    <td><a href="javascript:winopen('fullnotice.jsp?id=<%=notice[0]%>&ti=<%=notice[1]%>&d=<%=notice[2]%>')"><%=notice[1]%></a></td>
                    <td><%=notice[2]%></td>
                </tr>
    
                
                <%
                
            }
        }

    }
%>
                </tbody>
            </table>
    </body>
</html>
