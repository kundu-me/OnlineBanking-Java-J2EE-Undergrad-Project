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
	var t=window.opener.document.getElementById("tidSession").value;
	document.getElementById("tid").value=t;
	xmlhttpPost("AdminVerifyFDWindowAjax.jsp");
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
	var k=document.getElementById("tid").value;
	var word = k;
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
		document.getElementById("fid").value=x[i++];
		document.getElementById("amount").value=x[i++];
		document.getElementById("interest").value=x[i++];
		document.getElementById("term").value=x[i++];
		document.getElementById("branchcode").value=x[i++];
		document.getElementById("time").value=x[i++];
		document.getElementById("ctype").value=x[i++];
		document.getElementById("cage").value=x[i++];
		document.getElementById("name").value=x[i++];
		document.getElementById("dob").value=x[i++];
		document.getElementById("nationality").value=x[i++];
		document.getElementById("uidlabel").value=x[i++];
		document.getElementById("uidno").value=x[i++];
		document.getElementById("caddress").value=x[i++];
		document.getElementById("paddress").value=x[i++];
		document.getElementById("mobile").value=x[i++];
		document.getElementById("landline").value=x[i++];
		document.getElementById("email").value=x[i++];
		document.getElementById("it").value=x[i++];
		document.getElementById("itno").value=x[i++];
		document.getElementById("accountno").value=x[i++];
		document.getElementById("matAmt").value=x[i++];
	}
	else
	{
		alert("Error !!!");
		closeTheWindow();
	}
	
}

function acceptedFunction()
{
	xmlhttpPostAccept("AdminFDAcceptAjax.jsp");
}
function rejectedFunction()
{
	xmlhttpPostReject("AdminFDRejectAjax.jsp");
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
	var tid=document.getElementById("tid").value;
	var fid=document.getElementById("fid").value;
	var word = tid+","+fid;
	qstr = 'w=' + escape(word); // NOTE: no '?' before querystring
	return qstr;
}

function updatepageAccept(str)
{
	var str1="failure";
	if(str!=str1)
	{
		document.getElementById("msgL").innerHTML="Status";
		document.getElementById("msg").innerHTML="e-Fixed Deposit Accepted";
		removeButton("acceptButton");
		removeButton("rejectButton");
		addButtonClose();		
	}
	else
	{
		alert("Error !!!");
		closeTheWindow();
	}

}

function xmlhttpPostReject(strURL)
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
				updatepageReject(self.xmlHttpReq.responseText);
			}
		};
		self.xmlHttpReq.send(getquerystringReject());
	
}

function getquerystringReject()
{
	var tid=document.getElementById("tid").value;
	var fid=document.getElementById("fid").value;
	var accountno=document.getElementById("accountno").value;
	var amount=document.getElementById("amount").value;
	var branchcode=document.getElementById("branchcode").value;
	var word = tid+","+fid+","+accountno+","+amount+","+branchcode;
	qstr = 'w=' + escape(word); // NOTE: no '?' before querystring
	return qstr;
}

function updatepageReject(str)
{
	var str1="failure";
	if(str!=str1)
	{
		document.getElementById("msgL").innerHTML="Status";
		document.getElementById("msg").innerHTML="e-Fixed Deposit Rejected";
		removeButton("acceptButton");
		removeButton("rejectButton");
		addButtonClose();
	}
	else
	{
		alert("Error !!!");
		closeTheWindow();	
	}

}

function removeButton(button)
{
	var cell1=document.getElementById("verification");
	var x=document.getElementById(button);
    cell1.removeChild(x);
}
function addButtonClose()
{
	var cell1=document.getElementById("verification");
    var element1 = document.createElement("input");
    element1.setAttribute("type", "button");
    element1.setAttribute("value", "Close");
    element1.setAttribute("name", "Close");
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
	e-Fixed Deposit Verification Window
	</th>
</tr>
<tr>
	<td>
	e-Fixed Deposit ID
	</td>
	<td>
	<input type="text" id="fid" name="fid">
	</td>
	<td>
	Transaction ID
	</td>
	<td>
	<input type="text" id="tid" name="tid">
	</td>
</tr>
<tr>
	<td>
	Accountno
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
	e-FD Amount
	</td>
	<td>
	<input type="text" id="amount" name="amount">
	</td>
	<td>
	Interest
	</td>
	<td>
	<input type="text" id="interest" name="interest">
	</td>
</tr>
<tr>
	<td>
	Term
	</td>
	<td>
	<input type="text" id="term" name="term">
	</td>
	<td>
	Maturity Amount
	</td>
	<td>
	<input type="text" id="matAmt" name="matAmt">
	</td>
</tr>
<tr bgcolor=#ffffff>
	<td>
	Customer Type
	</td>
	<td>
	<input type="text" id="ctype" name="ctype">
	</td>
	<td>
	Customer Age 
	</td>
	<td>
	<input type="text" id="cage" name="cage" >
	</td>
</tr>
<tr bgcolor=#d8d8d8>
	<td>
	Full Name
	</td>
	<td>
	<input type="text" name="name" id="name" >
	</td>
	<td>
	Date Of Birth
	</td>
	<td>
	<input type="text" name="dob" id="dob">
	</td>
</tr>

<tr bgcolor=#ffffff>
	<td>
	Nationality
	</td>
	<td>
	<input type="text" name="nationality" id="nationality">
	</td>
	<td>
	UID of &nbsp;<label id="uidlabel"></label>
	</td>
	<td>
	<input type="text" name="uidno" id="uidno">
	</td>
</tr>
<tr bgcolor=#ffffff>
	<td>
	Correspondence Address
	</td>
	<td>
	<textarea rows="3" cols="40" name="caddress" id="caddress" readonly="readonly"></textarea>
	</td>
	<td>
	Permanant Address
	</td>
	<td>
	<textarea rows="3" cols="40" name="paddress" id="paddress" readonly="readonly"></textarea>
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

<tr>
	<td>
	Transaction Time
	</td>
	<td>
	<input type="text" id="time" name="time">
	</td>
	<td>
	<label id="msgL"></label>
	</td>
	<td>
	<label id="msg"></label>
	</td>
</tr>
<tr>
	<td colspan="4" id="verification" style="text-align: center">
	<button type="button" id="rejectButton" onclick="rejectedFunction()" name="rejected">Application Rejected</button>
	<button type="button" id="acceptButton" onclick="acceptedFunction()" name="accepted">Application Accepted</button>
	</td>
</tr>
</table>
</form>
</body>
</html>