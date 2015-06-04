<%-- 
    Document   : getclass
    Created on : Feb 26, 2015, 3:36:03 AM
    Author     : partha
--%>

<%@page import="partha.chat.ChatRoomList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String username = (String)session.getAttribute("username");
    if(username!=null)
    {
        String stu=(String) request.getParameter("stu");
        System.out.println(stu);
        String prof=((ChatRoomList)application.getAttribute("chatroomlist")).getRoomOfChatter(stu).getProfessorId();
                System.out.println(prof);
        %>
        <%=prof%>
<%
    }
    else
    {
        response.sendRedirect("index.jsp");
    }
%>


