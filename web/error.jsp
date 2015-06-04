<%@ page isErrorPage="true" import="java.io.PrintWriter" %>
<HTML>
<HEAD>
<TITLE>Error Occurred</TITLE>
<LINK rel="stylesheet" href="<%=request.getContextPath()%>/css/chat.css" type="text/css">
<link rel="icon" 
      type="image/png" 
      href="images/calogo2.png"/><link rel="icon" 
      type="image/png" 
      href="images/calogo2.png"/>
</HEAD>
<BODY bgcolor="#FFFFFF">
<h2>Some error occurred</h2>

<%
if (exception != null)
{
	//System.out.println("Exception: " +exception.getMessage());
	out.write("<span class=\"error\"><b>Exception: " +exception.getMessage() + "</b></span><br/>");
	exception.printStackTrace( new PrintWriter(out));
        out.write("<br/><p>Report to");
        String admin = null;
        if ( ( admin = application.getInitParameter("adminEmail") ) != null )
        {
            out.write("<a href=\"#\">" + admin + "</a>");
        }

        else
        {
            out.write("administrator of this web site");
        }
        out.write("</p>");
}
else if((String)request.getParameter("username")==null)
{
    	out.write("<span class=\"error\"><b>Login to view this page.</b></span></br>");
}
else if(((String)request.getParameter("username")).contains("stu")&& request.getParameter("auth").equalsIgnoreCase("no"))
{
        out.write("<span class=\"error\"><b>You do not have permission to view this page.</b></span></br>");
}
else
{
            out.write("<span class=\"error\"><b>Unknown Error. Please try again later.</b></span></br>");
            out.write("<br/><p>Report to");
        String admin = null;
        if ( ( admin = application.getInitParameter("adminEmail") ) != null )
        {
            out.write("<a href=\"#\">" + admin + "</a>");
        }

        else
        {
            out.write("administrator of this web site");
        }
        out.write("</p>");
}
%>


</BODY>
</HTML>