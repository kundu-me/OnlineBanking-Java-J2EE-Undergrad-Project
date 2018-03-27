<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Fixed Deposit||Bank Of Bengal</title>
<link rel="stylesheet" href="css/CustomerInputStyle.css">
 <link rel="stylesheet" href="css/CustomerFormStyle.css">
 
</head>
<body onload='xmlhttpPost("OnlineFDPart2Ajax.jsp")'>
<script type="text/javascript">
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
	var k="fixeddeposit";
	var word = k;
	qstr = 'w=' + escape(word); // NOTE: no '?' before querystring
	return qstr;
}

function updatepage(str)
{
	var x = str.split("|");
	var ctype=x[0];
	var cage=x[1];
	var dob=x[2];
	var nationality=x[3];
	var uidlabel=x[4];
	var uidno=x[5];
	var caddress=x[6];
	var paddress=x[7];
	var mobile=x[8];
	var landline=x[9];
	var email=x[10];
	var it=x[11];
	var itno=x[12];
	var name=x[13];
	
	document.getElementById("ctype").value=ctype;
	document.getElementById("cage").value=cage;
	document.getElementById("dob").value=dob;
	document.getElementById("nationality").value=nationality;
	document.getElementById("uidlabel").value=uidlabel;
	document.getElementById("uidno").value=uidno;
	document.getElementById("caddress").value=caddress;
	document.getElementById("paddress").value=paddress;
	document.getElementById("mobile").value=mobile;
	document.getElementById("landline").value=landline;
	document.getElementById("email").value=email;
	document.getElementById("it").value=it;
	document.getElementById("itno").value=itno;
	document.getElementById("name").value=name;
}
</script>
<form name="FDform" action="OnlineFDPart2Servlet" method="post">
<center>
<table class="CSSFormCustomer" align="center">
<tr bgcolor=#888888>
	<th colspan="2">Verify Account Details</th>
</tr>
<tr bgcolor=#ffffff>
	<td>
	Account No.
	</td>
	<td colspan="1">
	<input type="text" name="accountno" readonly="readonly" value=<%=(String)session.getAttribute("FDaccountnoSession") %>>
	</td>
</tr>
<tr bgcolor=#d8d8d8>
	<td>
	Branch Code 
	</td>
	<td>
	<input name="branchcode" id="branchcode" readonly="readonly" value=<%=(String)session.getAttribute("FDbranchcodeSession") %>>
	</td>
</tr>

<tr bgcolor=#ffffff>
	<td colspan="2" align="center">
	Customer Type &nbsp;<input type="text" id="ctype" name="ctype">
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
</tr>
<tr bgcolor=#d8d8d8>
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
</tr>
<tr bgcolor=#ffffff>
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
</tr>
<tr bgcolor=#ffffff>
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
</tr>
<tr bgcolor=#d8d8d8>
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
</tr>
<tr bgcolor=#d8d8d8>
	<td>
	PAN / Form60 No. &nbsp;
	<label id="it"></label>
	</td>
	<td>
	<input type="text" name="itno" id="itno">
	</td>
</tr>
<tr>
	<td colspan="2" id="proceedandsubmit" align="center" style="text-align: center">
	<input type="submit" value="Submit">
	</td>
</tr>
</table>
</center>
</form>

</body>
</html>