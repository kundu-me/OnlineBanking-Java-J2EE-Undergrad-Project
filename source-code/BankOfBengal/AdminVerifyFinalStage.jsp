<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Final Verification</title>
<link rel="stylesheet" href="css/AdminTableStyle.css">
<link rel="stylesheet" href="css/SmallButtonStyleCSS.css">
</head>
<body onload="loadFunctions()">
<script type="text/javascript">
function loadFunctions()
{
	var c=window.opener.document.getElementById("cidSession").value;
	document.getElementById("cidSessionFinal").value=c;
	xmlhttpPost("AdminVerifyFinalStageAjax.jsp");
}
function changeButton()
{
	var cell1=document.getElementById("verification");
	var x=document.getElementById("accepted");
    cell1.removeChild(x);
    var y=document.getElementById("rejected");
    cell1.removeChild(y);
    
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
function acceptedFunction()
{
	document.getElementById("accountno").disabled=false;
	xmlhttpPostAccept("AdminVerifyFinalAcceptAjax.jsp");
}
function rejectedFunction()
{
	xmlhttpPostReject("AdminVerifyFinalRejectAjax.jsp");
	
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
	var k=document.getElementById("cidSessionFinal").value;
	var word = k;
	qstr = 'w=' + escape(word); // NOTE: no '?' before querystring
	return qstr;
}

function updatepage(str)
{
	str1="error";
	if(str!=str1)
	{
		var x = str.split("|");
		
		document.getElementById("applicationno").value=x[0];
		document.getElementById("cid").value=x[1];
		document.getElementById("email").value=x[2];
		document.getElementById("branchcode").value=x[3];
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
	var cid=document.getElementById("cid").value;
	var remarks=document.getElementById("remarks").value;
	if(remarks==null||remarks=="")
	{
		remarks="";
	}
	remarks="Account No. Cannot Be Alloted. "+remarks;
	var word = cid+","+remarks;
	qstr = 'w=' + escape(word); // NOTE: no '?' before querystring
	return qstr;
}

function updatepageReject(str)
{
	alert(str);
	str1="error";
	if(str!=str1)
	{
		document.getElementById("remarks").value=str;
	}
	else
	{
		alert("Error !!!");
		closeTheWindow();
	}
	changeButton();
	
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
	var accountno1="ACC";
	var bb="";
	var cid1=document.getElementById("cid").value;
	var branchcode1=document.getElementById("branchcode").value;
	var email1=document.getElementById("email").value;
	var remarks=document.getElementById("remarks").value;
	var balance=document.getElementById("balance").value;
	if(remarks==""||remarks==null)
	{
		remarks="";
	}
	remarks="Account No Alloted. "+remarks;
	if(branchcode1.length==1)
	{
		bb="000"+branchcode1;
	}
	if(branchcode1.length==2)
	{
		bb="00"+branchcode1;
	}
	if(branchcode1.length==3)
	{
		bb="0"+branchcode1;
	}
	if(branchcode1.length==4)
	{
		bb=branchcode1;
	}
	if(branchcode1.length>=4)
	{
		bb=branchcode1;
	}
	
	accountno1+=bb;
	
	var word = accountno1+","+cid1+","+branchcode1+","+email1+","+remarks+","+balance;
	qstr = 'w=' + escape(word); // NOTE: no '?' before querystring
	return qstr;
}

function updatepageAccept(str)
{
	alert(str);
	str1="error";
	if(str!=str1)
	{
		var x = str.split("|");
		
		document.getElementById("accountno").value=x[0];
		document.getElementById("remarks").value=x[1];
				
	}
	else
	{
		alert("Error !!!");
		closeTheWindow();
	}
	changeButton();
}

function closeTheWindow()
{
	window.open('', '_self', ''); 
	window.close(); 
}
</script>

<form name="finalstage" method="post">
<table class="CSSFormAdmin" align="center" width="400">
<tr>
	<th colspan="2" align="center">
	Application Verification Final Stage
	</th>
</tr>
<tr>
	<td>
	Application No
	</td>
	<td>
	<input type="text" id="applicationno" name="applicationno">
	</td>
</tr>
<tr>
	<td>
	Customer ID
	</td>
	<td>
	<input type="text" id="cid" name="cid">
	<input type="hidden" name="cidSessionFinal" id="cidSessionFinal">
	<input type="hidden" name="email" id="email">
	</td>
</tr>
<tr>
	<td>
	Branch Code
	</td>
	<td>
	<input type="text" id="branchcode" name="branchcode">
	</td>
</tr>
<tr>
	<td>
	Remarks
	</td>
	<td>
	<textarea id="remarks" name="remarks" rows="3" cols="30"></textarea>
	</td>
</tr>
<tr>
<td>
	Initial Deposit
</td>
<td>
<input type="text" name="balance" id="balance">INR.
</td>
</tr>
<tr>
	<td id="accountL">
	Account No. Alloted
	</td>
	<td id="accountN">
	<input type="text" name="accountno" id="accountno" readonly="readonly" disabled="disabled" value="Not Applicable">
	</td>
</tr>
<tr>
	<td colspan="2" id="verification" align="center" style="text-align: center">
	<br>
	<button class="smallbuttons" type="button" id="rejected" onclick="rejectedFunction()" name="rejected" >Application Rejected</button>
	<button class="smallbuttons" type="button" id="accepted" onclick="acceptedFunction()" name="accepted" >Application Accepted</button>
	<br>&nbsp;
	</td>
</tr>

</table>
</form>
</body>
</html>