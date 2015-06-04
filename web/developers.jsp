<%-- 
    Document   : develpoers
    Created on : Aug 23, 2014, 4:19:55 PM
    Author     : Sanjay
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Developers</title>
         <link href="css/proj.css" rel="stylesheet" />
         <link rel="icon" 
      type="image/png" 
      href="images/calogo2.png"/>
<link href="css/ces.css" rel="stylesheet" />
<script src="js/jquery.min.1.3.2.js"></script>
<style>
    .m_des
    {
        height:300px;
    }
    .des
    { 
        width:300px;
        padding:5px;
        display:block;
/*        background-color: white;*/
    }
    .imag
    {
        width:200px;
        height:200px;
        border-radius: 200px;
        padding:25px;
    }
   .imag:hover
   {
       width:250px;
       height:250px;
       border-radius: 250px;
       padding:0px;
   }
    
    .desimg
    {
        display:inline-block;
    }
    .naming
    {
        font-size: 20px;
        font-family: arial;
        padding:5px;
    }
    .naming:hover
    {
        font-size: 23px;
        font-family: arial;
        color:darkblue;
    }
    #dmain
{
position:relative;
	//width:1000px;
	margin:auto;
	height:450px;
}
</style>
    </head>
    <body>
        <div class="navbar navbar-style">
        <div class="container">
            <div><img src="images/calogo2.png"/></div><div class="logo"><h1><a href="listrooms.jsp" style="text-decoration: none; color: white;">Online Class Network</a></h1></div>
        </div><!--end of container div-->
    </div>
    
        <div id="dmain">
            <div class="control-btn"><div class="des"><center>
                <div class="desimg"><img class="imag" alt="Hari Dahal" src="images/hari.png"/></div>
                <div class="naming">Hari Dahal</div>
                <div><a href="https://www.facebook.com/haridahalhd" target="_blank" alt="Hari's Facebook"><div class="control-btn"><img style="border-radius: 200px;width:50px; height:50px;" alt="Hari Dahal" src="images/fb.png"/></div></a></div>
<!--                <div><a href="https://about.me/haridahalhd">About.me</a></div>-->
                </center>
                </div></div>
               
              <div class="control-btn"><div class="des">
                <center>
                <div class="desimg"><img class="imag" alt="Partha Chudal" src="images/partha.png"/></div>
                <div class="naming">Partha Chudal</div>
                <div><a href="https://www.facebook.com/chudal.partha" target="_blank" alt="Partha's Facebook"><div class="control-btn"><img style="border-radius: 200px;width:50px; height:50px;" alt="Hari Dahal" src="images/fb.png"/></div></a></div>
<!--                <div><a href="https://about.me/parthachudal">About.me</a></div>-->
                </center>
              </div></div>

            <div class="control-btn"><div class="des">
                <center>
                <div class="desimg"><img class="imag" alt="Neha Shakya" src="images/neha.png"/></div>
                <div class="naming">Neha Shakya</div>
                <div><a href="https://www.facebook.com/neha.shakya.9" target="_blank" alt="Partha's Facebook"><div class="control-btn"><img style="border-radius: 200px;width:50px; height:50px;" alt="Hari Dahal" src="images/fb.png"/></div></a></div>
<!--                <div><a href="https://about.me/parthachudal">About.me</a></div>-->
                </center>
              </div></div>

            
            <div class="control-btn"><div class="des">
                <center>
                <div class="desimg"><img class="imag" alt="Sanjay Maharjan" src="images/sanjay.png"/></div>
                <div class="naming">Sanjay Maharjan</div>
                <div><a href="https://www.facebook.com/sanjay.maharjan.7" alt="Sanjay's Facebook" target="_blank"><div class="control-btn"><img style="border-radius: 200px;width:50px; height:50px;" alt="Hari Dahal" src="images/fb.png"/></div></a></div>
<!--                <div><a href="https://about.me/snjmhj">About.me</a></div>-->
                </center>
              </div></div>
        </div>
    <%@include file="foote.html" %>
    </body>
</html>
