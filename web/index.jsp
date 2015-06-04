<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Online Class Network - Break Physical barrier to learn online with us.</title>
<link rel="icon" 
      type="image/png" 
      href="images/calogo2.png"/>

<link href="css/proj.css" rel="stylesheet" />
<link href="css/ces.css" rel="stylesheet" />
<script src="js/jquery.min.1.3.2.js"></script>
<script>
     function validateForm()
       {
           var p=validatePass();
           var a=validateterms();
           if(p && a)
           {
               return true;
               
           }
           else
           {
               return false;
           }
       }
       function validatePass()
       {
           var p=document.getElementById("pass").value;
            var rp=document.getElementById("repass").value;
        if(p==rp)
        {
            return true;
        }
        else
        {
            alert("Password Mismatch");
            return false;
        }
       }
       function validateterms()
       {
          if(!terms.checked)
           {
               alert("You missed the terms and condition.");
               return false;
           }
           else
           {
               return true;
           }
       }
        function winopen(path)
        {
	chatterinfo = window.open(path,"chatterwin","scrollbars=yes,resizable=yes, width=400, height=300, location=no, toolbar=no, status=no");
	chatterinfo.focus();
        }
        function validateRepass()
       { 
          if(document.getElementById("pass").value!=document.getElementById("repass").value)
           {
               document.getElementById("repasser").style.color="red";
               document.getElementById("repasser").innerHTML="&#x2717";
           }
           else
           {
               document.getElementById("repasser").style.color="green";
               document.getElementById("repasser").innerHTML="&#10003";
           }
       }

</script>
</head>

<body>
      <div class="navbar navbar-style">
        <div class="container">
          <div><img src="images/calogo2.png"</div><div class="logo"><h1>Online Class Network</h1></div>
          <div id="navbtn">
              <div id="navbtns1" style=" display: none">
                  <input type="button" value="Login" id="navlogin" class="btn btn-sm btn-success"/>
                </div>
          <div id="navbtns2">
              <input type="button" id="navregister" class="btn btn-sm btn-danger" value="Register"/>
          </div>
          </div>
      </div><!--end of container div-->
    </div>        
</div>
      <div id="main">      
       <div id="navl">
              <h1>Break the physical barrier to learn</br> online with Online Class Network</h1>
               <div id="login">
          	<form action="<%=request.getContextPath()%>/servlet/login" method="POST">
                    <table>
                        <tr><td><input class="input-lg" type="text" name="username" value="" size="20" placeholder="Login ID"/></td></tr>
                        <tr><td><input class="input-lg" type="password" name="txtpass" value="" size="20" placeholder="Password"/><p><a href="javascript:winopen('getpassword.jsp')" id="forgot">Forgot Password?</a></p></td></tr>
                        <tr><td><input type="submit" value="Login" name="btnlogin" id="btnlog" class="btn btn-sm btn-primary"/></td></tr>			 
                     </table>
                    </form>
          </div> 
		</div><!--end of div navl-->
        
		 
                <div id="navr" style="display: none">
                    <div class="regf">
                       <form action="register.jsp" method="POST" onsubmit="return validateForm()">
                        <h1>Register</h1><br/>
                       <input type="text" name="fname" value="" size="20" required="required" placeholder="First Name" class="input-sm"/>
                            <input type="text" name="lname" value="" size="20" required="required" placeholder="Last Name" class="input-sm"/>
                            <label id="errorName"></label>
                            <br/>
                            <input type="date" name="dob" value="" class="input-lg"/>
                            <br/>
                        <label class="lblmain">Gender: </label>
                            <input type="radio" name="gen" value="M" checked="checked" />
                            <label>Male</label>
                                <input type="radio" name="gen" value="F" />
                            <label>Female</label>
                                <input type="radio" name="gen" value="O" />
                            <label>Other</label>
                            <br/><br/>
                            <input type="email" name="email" value="" size="20" required="required" placeholder="Email" class="input-lg" />
                            <br/>
                            <select name="cat" required="required" class="input-lgm">
                                <option disabled="disabled" selected="selected" id="uned">Register As</option>
                                <option>Professor</option>
                                <option>Student</option>
                            </select>
                        <br/>
                        <input onkeyup="validateRepass()" class="input-lg" id="pass" type="password" name="pass" value="" size="20"  required="required" placeholder="Password"/>
                        <br/>
                        <input class="input-lg" onkeyup="validateRepass()" id="repass" type="password" name="conpass" value="" size="20" required="required" placeholder="Confirm Password"/>
                        <div class="control-btn"><div id="repasser"></div></div>
                        <br/>
                        &nbsp;&nbsp;<input id="terms" type="checkbox" name="accept" value="ON" class="lblmain"/><label>I accept the <a href="#">terms and conditions</a> of Online Class Network.</label>
                        <br/><br/>
                        <input type="submit" value="Register" name="btnreg" class="btn btn-sm btn-primary"/>
                        
                    </form>
                    </div>
                </div><!--end of div navr-->
                <div id="navrr">
                    <center>
                        <br/><br/>
                        <h1>Learn Online</h1><br/>
                    <h1>Teach Online</h1><br/>
                    <h1>Discuss Online</h1><br/>
                    <h1>For these Register Online</h1>
                    </center>
                </div>
		</div><!--end of div main-->
               <%@ include file="/foote.html"%>
               <script src="js/cajs.js"></script>
             

</body>
</html>
