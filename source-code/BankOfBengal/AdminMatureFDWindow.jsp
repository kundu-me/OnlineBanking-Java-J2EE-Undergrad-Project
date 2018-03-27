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
	var f=window.opener.document.getElementById("fidSession").value;
	document.getElementById("fid").value=f;
	xmlhttpPost("AdminMatureFDWindowAjax.jsp");
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
	var k=document.getElementById("fid").value;
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
		document.getElementById("tid").value=x[i++];
		document.getElementById("fid").value=x[i++];
		document.getElementById("amount").value=x[i++];
		document.getElementById("interest").value=x[i++];
		document.getElementById("penalty").value=x[i++];
		document.getElementById("term").value=x[i++];
		document.getElementById("start").value=x[i++];
		document.getElementById("end").value=x[i++];
		document.getElementById("interestAmount").value=x[i++];
		document.getElementById("penaltyAmount").value=x[i++];
		document.getElementById("totalAmount").value=x[i++];
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
	}
	else
	{
		alert("Error !!!");
		closeTheWindow();
	}
	
}

</script>

<form name="finalstage" method="post" action="AdminMatureFDServlet">
<table class="CSSFormAdmin" align="center" width="500">
<tr>
	<th colspan="4" align="center">
	e-Fixed Deposit Maturity Window
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
	Account NO
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
	Term
	</td>
	<td>
	<input type="text" id="term" name="term">
	</td>
	
</tr>
<tr>
<td>
	Interest
	</td>
	<td>
	<input type="text" id="interest" name="interest">
	</td>
	<td>
	Pre Mature Penalty
	</td>
	<td>
	<input type="text" id="penalty" name="penalty">
	</td>
</tr>
<tr>
	<td>
	Start Date
	</td>
	<td>
	<input type="text" id="start" name="start">
	</td>
	<td>
	Maturity Date
	</td>
	<td>
	<input type="text" id="end" name="end">
	</td>
</tr>
<tr>
	<td>
	Interest Earned
	</td>
	<td>
	<input type="text" id="interestAmount" name="interestAmount">
	</td>
		<td>
	Penalty Charges
	</td>
	<td>
	<input type="text" id="penaltyAmount" name="penaltyAmount">
	</td>
</tr>
<tr>
	<td colspan="4" style="text-align: center">
	Total Amount
	<input type="text" id="totalAmount" name="totalAmount">
	</td>
</tr>
<tr>
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
	<input type="text" id="cage" name="cage">
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
	<td colspan="4" id="verification" align="center" style="text-align: center">
		<input type="submit" value="Mature FD" name="submit">
	</td>
</tr>
</table>
</form>
</body>
</html>