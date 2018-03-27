<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


<title>Welcome To Bank Of Bengal</title>
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />
<link href="css/ButtonStyleCSS.css" rel="stylesheet" type="text/css" />
<style TYPE="text/css"><!--
    A:link {text-decoration: none; color: #ffffff}
    a:visited {text-decoration: none; color: #fffff}
    a:active {text-decoration: none; color: #ffffff}
    a:hover{color: #ffffff}
--></style>
</head>
<%
String checkSessionValue=(String)session.getAttribute("usernameSession");
if(checkSessionValue==null)
{
	response.sendRedirect("CustomerLogin.jsp");
}
%>
<body style="background-color: white; " onload="ref()">
<script type="text/javascript">
function ref()
{
	var x=document.getElementById("Rcheck").value;
	if(x!=null && x.length>1)
	{
		document.getElementById("Rcheck").value="";
	}
	else
	{
		window.location.reload(true);
	}
}
function changeMousePointer(elementID)
{
	document.getElementById(elementID).style.cursor="pointer";
}
function getComplainWindow()
{
	var applicationStatusWindow=window.open("ComplainRegister.jsp","getBranchWindow","width=650,height=650");
}
function getStatusWindow()
{
	var applicationStatusWindow=window.open("ApplicationStatus.jsp","getBranchWindow","width=650,height=650");
}
</script>
<%
String name=(String)session.getAttribute("nameSession");
String ip=request.getRemoteHost();
%>
<div id="templatemo_container">
<table width="630">
<tr>
<td colspan="2" style="background-color:#00ccff;" width="630" height="100">

 <div id="templatemo_header" style="text-align: center;">
    	<div id="templatemo_logo" style="text-align: center;">
        	<img src="images/logo.gif" alt="Logo" />
            <div id="templatemo_sitetitle" style="font-family: Gregoria; color: #ffffff; text-align: center;">Bank Of Bengal
            </div>
            </div>
            <marquee style="color:blue; font-family: Gregoria;font-size: 15px;"> Welcome To The Online Portal Of Bank Of Bengal !</marquee>
            </div>
<h3 style="font-family: Gregoria; color:blue;text-align: right;">Welcome, <%=(String)name %></h3>
<input type="hidden" id="Rcheck" value=<%=name %>>
<div id="templatemo_menu">
		 	<ul>
			<li><a href="CustomerHome.jsp"  class="current">Home</a></li>
			<li><a href="#">Services</a>
            <ul>
            	<li>
            	<a href="http://www.google.com" target="f1">Bank Services</a>
            	</li>
            </ul>
            </li>
            <li><a href="#">Complain</a>
            <ul>
            	<li>
            	<a id="reg1" onclick="getComplainWindow()" onmouseover="changeMousePointer(this.id)" >Register A Complain</a>
            	</li>
            </ul>
            </li>  
            
            <li><a href="#">Online Application</a>
            <ul>
            	<li>
            	<a href="OnlineAccOpenFormPart1.jsp" target="_blank">SB Account Open Form</a>
            	<a onclick="getStatusWindow()" id="statusW" onmouseover="changeMousePointer(this.id)">SB Application Status</a>
            	</li>
            </ul>
            </li>
            <li><a href="#">Details</a>
            <ul>
            	<li>
            	<a href="CustomerLoginDetails.jsp" target="f1">Last 5 Login</a>
            	<a href="CustomerAccountSelectTD.jsp" target="f1">Last 3 Transaction</a>
            	<a href="CustomerAccountSelectTS.jsp" target="_blank">Account Statement</a>
            	</li>
            </ul>
            </li>
              
            <li><a href="#" class="lastmenu">Settings</a>
            <ul>
            	<li>
            	<a href="CustomerLogout.jsp">Log Out</a>
            	<a href="CustomerChangePassword.jsp" target="f1">Change Password</a>
            	<a href="CustomerAccountClose.jsp" target="f1">Account Close Request</a>
            	</li>
            </ul>
            </li> 
	               
        </ul>  
    
    </div>
</td>
</tr>
<tr>
<td style="background-color:#00ccff;" width="100">
<a href="CustomerAccountDetails.jsp" class="buttons" target="f1" style="color: #ffffff">Balance Details</a><br>
<br>
<a href="CustomerAccountSelectMT.jsp" class="buttons" target="f1" style="color: #ffffff">Transfer Money</a><br>
<a href="OnlineFDPart1.jsp" class="buttons" target="f1" style="color: #ffffff">e-Fixed Deposit</a><br>
<br>
<a href="CustomerAccountSelectTD.jsp" class="buttons" target="f1" style="color: #ffffff">Last 3 Transactions</a><br>
<a href="CustomerAccountSelectTS.jsp" class="buttons" target="_blank" style="color: #ffffff">Account Statement</a><br>
<br>
<a href="AddCustomerAccount.jsp" class="buttons" target="f1" style="color: #ffffff">Add An Account</a><br>
<a href="CustomerAccountClose.jsp" class="buttons" target="f1" style="color: #ffffff">Close An Account</a><br>
<br>
<a href="CustomerLoginDetails.jsp" class="buttons" target="f1" style="color: #ffffff">Last 5 Login</a><br>
<button type="button" class="buttons"  id="reg12" onclick="getComplainWindow()" onmouseover="changeMousePointer(this.id)">Register Complain</button><br>

</td>
<td style="background-color:#0ca3d2;"height="600" width="530" align="center">

<iframe name="f1" src="CustomerWelcome.jsp" width="750" height="560" style="border-width: 0px" seamless>
</iframe>

</td>
</tr>

<tr>
<td colspan="2" style="background-color:#00ccff;text-align:center;">
Copyright © Bank Of Bengal</td>
</tr>
</table>
</div>
</body>
</html>