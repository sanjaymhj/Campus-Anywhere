<%
   
    String username=(String)session.getAttribute("username");
    if(username!=null)
    {
        if(username.startsWith("prof"))
        {
%>
<%=username%>
<%
        }
        else
        {
%>
hide
<%
        }
    }
    else
    {
        response.sendRedirect("index.jsp");
    }
%>
