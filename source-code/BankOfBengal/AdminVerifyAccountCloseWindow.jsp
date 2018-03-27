<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Verification Window</title>
<link rel="stylesheet" href="css/AdminTableStyle.css">
</head>
<body onload="loadFunctions()">
<script>
function loadFunctions()
{
	var c=window.opener.document.getElementById("cidSession").value;
	var a=window.opener.document.getElementById("accountnoSession").value;
	document.getElementById("cid").value=c;
	document.getElementById("accountno").value=a;
	xmlhttpPost("AdminVerifyAccountCloseWindowAjax.jsp");
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
	var k1=document.getElementById("cid").value;
	var k2=document.getElementById("accountno").value;
	var word = k1+","+k2;
	qstr = 'w=' + escape(word); // NOTE: no '?' before querystring
	return qstr;
}

function updatepage(str)
{
	
	var str1="error";
	if(str!=str1)
	{
		var x = str.split("|");
		var i=0;
		document.getElementById("cid").value=x[i++];
		document.getElementById("accountno").value=x[i++];
		document.getElementById("branchcode").value=x[i++];
		document.getElementById("email").value=x[i++];
		document.getElementById("balance").value=x[i++];
		
		document.getElementById("name").value=x[i++];
		document.getElementById("mobile").value=x[i++];
		document.getElementById("landline").value=x[i++];
		
		document.getElementById("it").value=x[i++];
		document.getElementById("itno").value=x[i++];
	}
	else
	{
		alert("Error !!!");
		closeTheWindow();
	}
	
}

function acceptedFunction()
{
	xmlhttpPostAccept("AdminAccountCloseAcceptAjax.jsp");
}
function xmlhttpPostAccept(strURL)
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
				updatepageAccept(self.xmlHttpReq.responseText);
			}
		};
		self.xmlHttpReq.send(getquerystringAccept());
	
}

function getquerystringAccept()
{
	var c=document.getElementById("cid").value;
	var a=document.getElementById("accountno").value;
	var bl=document.getElementById("balance").value;
	var br=document.getElementById("branchcode").value;
	var word = c+","+a+","+bl+","+br;
	qstr = 'w=' + escape(word); // NOTE: no '?' before querystring
	return qstr;
}

function updatepageAccept(str)
{
	var str1="failure";
	if(str!=str1)
	{
		document.getElementById("msgL").innerHTML="Status : ";
		document.getElementById("msg").innerHTML="Account Closed";
		document.getElementById("acceptButton").disabled=true;
		addButtonClose();		
	}
	else
	{
		alert("Error !!!");
		closeTheWindow();
	}

}


function addButtonClose()
{
	var cell1=document.getElementById("verification");
    var element1 = document.createElement("input");
    element1.setAttribute("type", "button");
    element1.setAttribute("value", "Close");
    element1.setAttribute("name", "Close");
    element1.setAttribute("id", "Close");
    element1.addEventListener("click",function closeTheWindow1()
    {
  		window.open('', '_self', ''); 
    	window.close();
    },false);
    cell1.appendChild(element1);

}

function closeTheWindow()
{
	window.open('', '_self', ''); 
	window.close(); 
}



</script>

<form name="finalstage" method="post">
<table class="CSSFormAdmin" align="center" width="500">
<tr>
	<th colspan="4" align="center">
	Account Close Verification Window
	</th>
</tr>
<tr>
	<td>
	Account No
	</td>
	<td>
	<input type="text" id="accountno" name="accountno">
	</td>
	
	<td>
	Branch Code
	</td>
	<td>
	<input type="text" id="branchcode" name="branchcode">
	</td>
	
</tr>
<tr>
	<td>
	Customer ID
	</td>
	<td>
	<input type="text" id="cid" name="cid">
	</td>
	<td>
	Full Name
	</td>
	<td>
	<input type="text" name="name" id="name" >
	</td>
</tr>
<tr bgcolor=#ffffff>
	<td>
	Email ID
	</td>
	<td>
	<input type="text" name="email" id="email">
	<td>
	PAN / Form60 No. &nbsp;
	<label id="it"></label>
	</td>
	<td>
	<input type="text" name="itno" id="itno">
	</td>
</tr>
<tr bgcolor=#ffffff>
	<td>
	Mobile No.
	</td>
	<td>
	<input type="text" name="mobile" id="mobile">
	</td>
	<td>
	Telephone No.
	</td>
	<td>
	<input type="text" name="landline" id="landline">
	</td>
</tr>
<tr bgcolor=#ffffff>
	<td colspan="4" style="text-align: center;">
	Account Balance &nbsp;&nbsp;
	<input type="text" name="balance" id="balance" readonly="readonly"> INR.
	</td>
</tr>
<tr bgcolor=#ffffff>
	<td colspan="4" style="text-align: center;">
	<label id="msgL"></label>
	<label id="msg"></label>
	</td>
</tr>

<tr>
	<td colspan="4" id="verification" style="text-align: center">
	<button type="button" id="acceptButton" onclick="acceptedFunction()" name="accepted">Clear Account Balance And Close Account</button>
	</td>
</tr>
</table>
</form>
</body>
</html>