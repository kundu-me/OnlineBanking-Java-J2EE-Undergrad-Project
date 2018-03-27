<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Application Status</title>
<link rel="stylesheet" href="css/CustomerInputStyle.css">
<link rel="stylesheet" href="css/CustomerFormStyle.css">

<script>
function closeTheWindow()
{
	window.open('', '_self', ''); 
	window.close(); 	
}
function resetFunction()
{
	document.getElementById("cid").value="";
	document.getElementById("email").value="";
	document.getElementById("statusmsg").innerHTML="";
	document.getElementById("remarksmsg").innerHTML="";
}
function validation()
{
	var cid1=document.getElementById("cid").value;
	var email1=document.getElementById("email").value;
	if(cid1=="" || cid1==null )
	{
		alert("Enter Customer ID !");
		document.getElementById("statusmsg").innerHTML="Enter Customer ID !";
		return false;
	}
	if(email1=="" || email1==null )
	{
		alert("Enter Customer Email !");
		document.getElementById("statusmsg").innerHTML="Enter Customer Email !";
		return false;
	}
	var atpos=email1.indexOf("@");
	var dotpos=email1.lastIndexOf(".");
	if (atpos<1 || dotpos<atpos+2 || dotpos+2>=email1.length)
	{
	  	alert("Not a valid e-mail address");
	  	document.getElementById("statusmsg").innerHTML="Enter Valid Email !";
	    return false;
	}
	
	xmlhttpPost("ApplicationStatusAjax.jsp");	
}
function xmlhttpPost(strURL)
{
		var xmlHttpReq = false;
		var self = this;
	
		// Mozilla/Safari
		if (window.XMLHttpRequest)
		{
			self.xmlHttpReq = new XMLHttpRequest();
		}
	
		// IE
		else if (window.ActiveXObject) 
		{
			self.xmlHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
		}
	
		self.xmlHttpReq.open('POST', strURL, true);
		self.xmlHttpReq.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		self.xmlHttpReq.onreadystatechange = function()
		{
			if (self.xmlHttpReq.readyState == 4) 
			{
				updatepage(self.xmlHttpReq.responseText);
			}
		};
		self.xmlHttpReq.send(getquerystring());
	
}

function getquerystring()
{
	var cid=document.getElementById("cid").value;
	var email=document.getElementById("email").value;
	var word = cid+","+email;
	qstr = 'w=' + escape(word); // NOTE: no '?' before querystring
	return qstr;
}

function updatepage(str)
{
	var vString = str.split("|");
	var status1=vString[0];
	var remarks1=vString[1];
	
	var statusElement=document.getElementById("statusmsg");
	statusElement.innerHTML=status1;
	
	var remarksElement=document.getElementById("remarksmsg");
	remarksElement.innerHTML=remarks1;
	
	statusElement.style.color="black";
	remarksElement.style.color="black";
}
</script>
</head>
<body>
<form name="applicationstatus">
<center>
<table class="CSSFormCustomer" align="center" width="400">
<tr >
	<th colspan="2" align="center">
	Customer Application Status
	</th>
</tr>
<tr>
	<td>
<pre><font face="Gregoria"><b>

   Customer ID        : <input type="text" id="cid" name="cid"> &nbsp;&nbsp;&nbsp;

   Registered Email : <input type="text" id="email" name="email"> &nbsp;&nbsp;&nbsp;
	</b></font></pre>
<center>
<p id="statusmsg"><b></b></p>
<p id="remarksmsg"><b></b></p>
</center>
	<center>
	<br>
<button type="button" onclick='closeTheWindow()'>Close</button>
&nbsp;
<button type="button" onclick='resetFunction()'>Reset</button>
&nbsp;
<button type="button" onclick='return validation()'>Show Status</button>
	</center>
	<br>
	</td>
</tr>
</table>
</center>
</form>
</body>
</html>