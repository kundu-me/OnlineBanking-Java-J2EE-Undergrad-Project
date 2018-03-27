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
	xmlhttpPost("AdminVerifyMoneyTransferWindowAjax.jsp");
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
		var tid=x[0];
		var branchcode=x[1];
		var sender=x[2];
		var bank=x[3];
		var receiver=x[4];
		var amount=x[5];
		var bankcharges=x[6];
		var totalamount=x[7];
		var time=x[8];
		var email=x[9];
		document.getElementById("tid").value=tid;
		document.getElementById("branchcode").value=branchcode;
		document.getElementById("sender_accountno").value=sender;
		document.getElementById("receiver_bank").value=bank;
		document.getElementById("receiver_accountno").value=receiver;
		document.getElementById("amount").value=amount;
		document.getElementById("bankcharges").value=bankcharges;
		document.getElementById("totalamount").value=totalamount;
		document.getElementById("time").value=time;
		document.getElementById("email").value=email;
	}
	else
	{
		alert("Error !!!");
		closeTheWindow();
	}
	
}
function verifyReceiverAccount()
{
	xmlhttpPostVerifyAccount("AdminVerifyAccountAjax.jsp");
}

function xmlhttpPostVerifyAccount(strURL)
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
				updatepageVerifyAccount(self.xmlHttpReq.responseText);
			}
		};
		self.xmlHttpReq.send(getquerystringVerifyAccount());
	
}

function getquerystringVerifyAccount()
{
	var k=document.getElementById("receiver_accountno").value;
	var word = k;
	qstr = 'w=' + escape(word); // NOTE: no '?' before querystring
	return qstr;
}

function updatepageVerifyAccount(str)
{
	var details=str.split("|");
	var check=details[0];
	var check1="true";
	document.getElementById("msgL").innerHTML="Status";
	document.getElementById("msg").innerHTML=details[1];
	removeButton("verifyButton");
	addButtonReject();
	addButtonAccept();
	document.getElementById("verifyAccount2Status").value=details[0];

	if(check1!=check)
	{
		document.getElementById("acceptButton").disabled=false;
	}
	else
	{
		document.getElementById("acceptButton").disabled=true;
	}


}

function removeButton(button)
{
	var cell1=document.getElementById("verification");
	var x=document.getElementById(button);
    cell1.removeChild(x);
}

function addButtonAccept()
{
	var cell1=document.getElementById("verification");

	var element1 = document.createElement("input");
    element1.setAttribute("type", "button");
    element1.setAttribute("value", "Accept Transaction");
    element1.setAttribute("name", "Accept Transaction");
    element1.setAttribute("id", "acceptButton");
    element1.addEventListener("click",function acceptTransaction()
    {
    	xmlhttpPostAccept("AdminMoneyTransferAcceptAjax.jsp");
    	
    },false);
    cell1.appendChild(element1);
	
}
function addButtonReject()
{
	var cell1=document.getElementById("verification");

	var element1 = document.createElement("input");
    element1.setAttribute("type", "button");
    element1.setAttribute("value", "Reject Transaction");
    element1.setAttribute("name", "Reject Transaction");
    element1.setAttribute("id", "rejectButton");
    element1.addEventListener("click",function rejectTransaction()
    {
    	xmlhttpPostReject("AdminMoneyTransferRejectAjax.jsp");
    	
    },false);
    cell1.appendChild(element1);
	
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
	var branchcode=document.getElementById("branchcode").value;
	var sender_accountno=document.getElementById("sender_accountno").value;
	var receiver_accountno=document.getElementById("receiver_accountno").value;
	var amount=document.getElementById("amount").value;
	var bankcharges=document.getElementById("bankcharges").value;
	var totalamount=document.getElementById("totalamount").value;
	var bank=document.getElementById("receiver_bank").value;
	
	var word = tid+","+branchcode+","+sender_accountno+","+receiver_accountno+","+amount+","+bankcharges+","+totalamount+","+bank;
	qstr = 'w=' + escape(word); // NOTE: no '?' before querystring
	return qstr;
}

function updatepageReject(str)
{
	removeButton("rejectButton");
	removeButton("acceptButton");
	addButtonClose();
		
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
	var branchcode=document.getElementById("branchcode").value;
	var sender_accountno=document.getElementById("sender_accountno").value;
	var receiver_accountno=document.getElementById("receiver_accountno").value;
	var amount=document.getElementById("amount").value;
	
	var word = tid+","+branchcode+","+sender_accountno+","+receiver_accountno+","+amount;
	qstr = 'w=' + escape(word); // NOTE: no '?' before querystring
	return qstr;
}

function updatepageAccept(str)
{
	removeButton("rejectButton");
	removeButton("acceptButton");
	addButtonClose();

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
	Money Transfer Verification Window
	</th>
</tr>
<tr>
	<td>
	Transaction ID
	</td>
	<td>
	<input type="text" id="tid" name="tid">
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
	Sender Account No.
	</td>
	<td>
	<input type="text" id="sender_accountno" name="sender_accountno">
	</td>
</tr>
<tr>
	<td>
	Receiver Bank
	</td>
	<td>
	<input type="text" id="receiver_bank" name="receiver_bank">
	</td>
</tr>
<tr>
	<td>
	Receiver Account No.
	</td>
	<td>
	<input type="text" id="receiver_accountno" name="receiver_accountno">
	</td>
</tr>
<tr>
	<td>
	Transaction Amount
	</td>
	<td>
	<input type="text" id="amount" name="amount">
	</td>
</tr>
<tr>
	<td>
	Bank Charges
	</td>
	<td>
	<input type="text" id="bankcharges" name="bankcharges">
	</td>
</tr>
<tr>
	<td>
	Total Amount
	</td>
	<td>
	<input type="text" id="totalamount" name="totalamount">
	</td>
</tr>
<tr>
	<td>
	Transaction Time
	</td>
	<td>
	<input type="text" id="time" name="time">
	</td>
</tr>
<tr>
	<td>
	Sender Email
	</td>
	<td>
	<input type="text" id="email" name="email">
	</td>
</tr>
<tr>
	<td>
	<label id="msgL"></label>
	</td>
	<td>
	<label id="msg"></label>
	</td>
</tr>
<tr>
	<td colspan="2" id="verification" align="center" style="text-align: center">
	<button type="button" id="verifyButton" onclick="verifyReceiverAccount()" name="verifyButton" >Verify Receiver Account</button>
	<input type="hidden" id="verifyAccount2Status" name="verifyAccount2Status">
	</td>
</tr>
</table>
</form>
</body>
</html>