<%-- 
    Document   : register
    Created on : Jul 25, 2014, 11:25:54 AM
    Author     : partha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
        <link href="css/proj.css" rel="stylesheet" />
<link href="css/ces.css" rel="stylesheet" />
<link rel="icon" 
      type="image/png" 
      href="images/calogo2.png"/>
        <script src="js/jquery.min.1.3.2.js"></script>
    </head>
    <body>
        <%
            
                String fname=request.getParameter("fname");
                String lname=request.getParameter("lname");
                String email=request.getParameter("email");
                String dob=request.getParameter("dob");
                String gen=request.getParameter("gen");
                String cat=request.getParameter("cat");
                String pass=request.getParameter("pass");
        %>
        <div class="navbar navbar-style">
        <div class="container">
          <div><img src="images/calogo2.png"</div><div class="logo"><h1>Online Class Network</h1></div>
         
          </div>
                    
         
      </div><!--end of container div-->
    </div>
    <div id="main">
        <div id="navr">
        <form action="<%=request.getContextPath()%>/servlet/manageChat" method="POST">
            <h1> Just Few Details Required</h1>
            <input type="hidden" name="rpass" value="<%=pass%>" class="input-lg" />
            <input type="hidden" name="rfname" value="<%=fname%>"  class="input-lg"/>
            <input type="hidden" name="rlname" value="<%=lname%>"  class="input-lg"/>
            <input type="hidden" name="rdob" value="<%=dob%>"  class="input-lg"/>
            <input type="hidden" name="rgen" value="<%=gen%>"  class="input-lg"/>
            <input type="hidden" name="remail" value="<%=email%>"  class="input-lg"/>
            <input type="hidden" name="rcat" value="<%=cat%>"  class="input-lg"/>
                        <br/>
                         <select name="edu" class="input-lgm">
                             <option disabled="disabled" selected="selected" placeholder="Your Education Level"><--Your Education Level--></option>
                             <option>High School</option>
                             <option>Bachelor Degree</option>
                             <option>Masters Degree</option>
                             <option>PhD</option>
                         </select> 
                            <br/>
                            <!--<div style="width:150px;display:inline-block"><label >School</label></div>-->
                            <input type="text" name="school" value="" size="30"  class="input-lg" placeholder="School"/>
                        <br/>
<!--                        <div class="reg"><label >Country</label></div>-->
                            <select name="country" class="input-lgm" placeholder="Country">
                                <option selected="selected" disabled="disabled" ><--Select Your Country--></option>
                             <option>Nepal</option>
                             <option>China</option>
                             <option>Canada</option>
                             <option>Australia</option>
                         </select> 
                            <br/>
<!--                            <div class="reg"><label >City</label></div>-->
<input type="text" name="city" value="" size="20"  class="input-lg" placeholder="City"/>
                        <br/>
<!--                        <div style="width:150px;display:inline-block"><label >Mobile</label></div>-->

<input type="text" name="mobile" value="" size="20"  class="input-lg" placeholder="Mobile no."/>
                        <br/>
<!--                        <div style="width:157px;display:inline-block"></div>-->
                        <input type="submit" value="Register" name="btnreg" class="btn btn-sm btn-primary"/>
                    </form>
        </div>
    </div>
            <%@include file="foote.html" %>
    </body>
</html>
