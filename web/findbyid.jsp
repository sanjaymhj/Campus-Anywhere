<%-- 
    Document   : findbyid
    Created on : Aug 11, 2014, 4:43:10 PM
    Author     : Sanjay
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Find By ID</title>
        <LINK rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/ces.css">
<LINK rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/proj.css">
        <script src="js/jquery.min.1.3.2.js"></script>
<link rel="icon" 
      type="image/png" 
      href="images/calogo2.png"/>
    </head>
    <body>
        
        <h1>Find the Student.</h1>
        <table>
            <tr><td>
              <label for="findid">Enter the ID : </label><input type="text" id="findid" class="input-lg"/>
<!--              <input type="submit" id="subm" class="btn btn-sm btn-success" /></td></tr>-->
<button id="subm" class="btn btn-sm btn-success" onclick="submitID()">Submit</button>
        </table>
        <div id="ab"></div>
        <script><%
        String username1 = (String)session.getAttribute("username");
        %>
//           $("#subm").click(function () {
//               
//               var a=document.getElementById("findid").value;
//               var va="viewinfo.jsp?chatterName="+a;
//               var sa='<iframe width="500" height="400" src='+va+'></iframe>';
//               document.getElementById("ab").innerHTML=sa;
//                        $("#id_cont").slideDown("fast");
//                         });
            
            function submitID()
            {
               var a=document.getElementById("findid").value;
               var va="viewinfo.jsp?chatterName="+a;
                $.get(va, function(data){
                
                     $("#id_cont").slideDown("fast");
                      $("#ab").html(data);
                });
             
            }
               
            
                    
            
            
        </script>
       
    </body>
</html>
