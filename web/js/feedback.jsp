<%-- 
    Document   : feedback
    Created on : Aug 20, 2014, 11:51:39 PM
    Author     : Sanjay
--%>

<%@page import="database.DBConnection"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body>
        <table>
            <th>Date</th>
            <th>Feedback</th>
        <% 
           DBConnection db = new DBConnection();
           PreparedStatement pstmt=db.con.prepareStatement("select * from feedback");
           ResultSet rs;
           int i=1;
           rs=pstmt.executeQuery();
           while(rs.next())
           {
               out.write("<td>");
                out.write(i);
                i++;
                out.write("</td>");
                out.write("<td>");
                rs.getString(1);
                out.write("</td>");
                out.write("<td>");
                rs.getString(2);
                out.write("</td>");
           }%>
        </table>
    </body>
</html>
