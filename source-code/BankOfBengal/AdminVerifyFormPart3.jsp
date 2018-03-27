<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Verify Form Part3</title>
<link rel="stylesheet" href="css/AdminTableStyle.css">
<link rel="stylesheet" href="css/SmallButtonStyleCSS.css">
</head>
<body onload="loadFunctions()">
<script>
function loadFunctions()
{
	var c=window.opener.document.getElementById("cidSession").value;
	document.getElementById("cidSessionForm3").value=c;
	xmlhttpPost("AdminVerifyFormPart3Ajax.jsp");
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
	var k=document.getElementById("cidSessionForm3").value;
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
		
		document.getElementById("poilabel").value=x[2];
		document.getElementById("poino").value=x[3];
		document.getElementById("poiplace").value=x[4];
		document.getElementById("poidate").value=x[5];
	
		document.getElementById("poalabel").value=x[6];
		document.getElementById("poano").value=x[7];
		document.getElementById("poaplace").value=x[8];
		document.getElementById("poadate").value=x[9];
		var noofaccount=x[10];
		
		var xx=x[11];
		var bb=xx.split(";");
		if(noofaccount>0)
		{
			var v=bb[0].split("=");
			document.getElementById("bank1").value=v[0];
			document.getElementById("branch1").value=v[1];
			document.getElementById("accounttype1").value=v[2];
			document.getElementById("accountno1").value=v[3];
			noofaccount=noofaccount-1;
			
		}
		if(noofaccount>0)
		{
			var v=bb[1].split("=");
			document.getElementById("bank2").value=v[0];
			document.getElementById("branch2").value=v[1];
			document.getElementById("accounttype2").value=v[2];
			document.getElementById("accountno2").value=v[3];
			noofaccount=noofaccount-1;
			
		}
		if(noofaccount>0)
		{
			var v=bb[2].split("=");
			document.getElementById("bank3").value=v[0];
			document.getElementById("branch3").value=v[1];
			document.getElementById("accounttype3").value=v[2];
			document.getElementById("accountno3").value=v[3];
			noofaccount=noofaccount-1;
			
		}
		if(noofaccount>0)
		{
			var v=bb[3].split("=");
			document.getElementById("bank4").value=v[0];
			document.getElementById("branch4").value=v[1];
			document.getElementById("accounttype4").value=v[2];
			document.getElementById("accountno4").value=v[3];
			noofaccount=noofaccount-1;
			
		}
		if(noofaccount>0)
		{
			var v=bb[4].split("=");
			document.getElementById("bank5").value=v[0];
			document.getElementById("branch5").value=v[1];
			document.getElementById("accounttype5").value=v[2];
			document.getElementById("accountno5").value=v[3];
			noofaccount=noofaccount-1;
			
		}
		
		
		
		
	}
	
}


</script>
<form name="form3"  method="post">
<table border="1" align="center" class="CSSFormAdmin">
<tr bgcolor=#888888>
	<th colspan="2">Verify Identification Details</th>
</tr>
<tr bgcolor=#ffffff>
	<td>
	Application No. &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="text" name="applicationno" id="applicationno" readonly="readonly" >
	</td>
	<td>
	Customer ID &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="text" name="cid" id="cid" readonly="readonly">
	<input type="hidden" name="cidSessionForm3" id="cidSessionForm3">
	</td>
</tr>
<tr bgcolor=#d8d8d8>
	<th>Proof Of Identity*
	</th>
	<th>Proof Of Address (Of Correspondence Address)*
</tr>
<tr bgcolor=#ffffff>
	<td>
	<pre><font face="Gregoria"><b>
		
	<select name="poilabel" id="poilabel">
	<option value="0">--Select--</option>
	<option value="passport">Passport</option>
	<option value="voteridcard">Voter Id Card</option>
	<option value="pancard">PAN Card</option>
	<option value="drivinglicense">Driving License</option>
	<option value="aadhaarcard">Aadhaar Card</option>
	</select>
	
	Number		<input type="text" name="poino" id="poino">
	
	Issued At	<input type="text" name="poiplace" id="poiplace">
	
	Issue Date	<input type="text" name="poidate" id="poidate"> (dd-mm-yyyy)
	</b></font>
	</pre>
	</td>
	<td>
	<pre><font face="Gregoria"><b>
		
	<select name="poalabel" id="poalabel">
	<option value="0">--Select--</option>
	<option value="electricitybill">Electricity Bill</option>
	<option value="telephonebill">Telephone Bill</option>
	<option value="rationcard">Ration Card</option>
	<option value="bankaccountstatement">Bank Account Statement</option>
	<option value="salaryslip">Salary Slip</option>
	</select>
	
	Number		<input type="text" name="poano" id="poano">
	
	Issued At	<input type="text" name="poaplace" id="poaplace">
	
	Issue Date	<input type="text" name="poadate" id="poadate"> (dd-mm-yyyy)
	</b></font>
	</pre>
	</td>
</tr>
<tr bgcolor=#d8d8d8>
	<th colspan="2" align="left">Other Account Details
	</th>
</tr>
<tr>
	<td colspan="2">
	Please give your details of your accounts in our*/other Bank.
	</td>
</tr>
<tr>
	<td colspan="2">
	<br>
	<table border="1" align="center">
	<tr bgcolor=#d8d8d8>
		<th>Bank</th>
		<th>Branch</th>
		<th>Type Of Account</th>
		<th>Account Number</th>
	</tr>
	<tr>
		<td>
		<input type="text" name="bank1" id="bank1">
		</td>
		<td>
		<input type="text" name="branch1" id="branch1">
		</td>
		<td>
		<input type="text" name="accounttype1" id="accounttype1">
		</td>
		<td>
		<input type="text" name="accountno1" id="accountno1">
		</td>
	</tr>
	<tr>
		<td>
		<input type="text" name="bank2" id="bank2">
		</td>
		<td>
		<input type="text" name="branch2" id="branch2">
		</td>
		<td>
		<input type="text" name="accounttype2" id="accounttype2">
		</td>
		<td>
		<input type="text" name="accountno2" id="accountno2">
		</td>
	</tr>
	<tr>
		<td>
		<input type="text" name="bank3" id="bank3">
		</td>
		<td>
		<input type="text" name="branch3" id="branch3">
		</td>
		<td>
		<input type="text" name="accounttype3" id="accounttype3">
		</td>
		<td>
		<input type="text" name="accountno3" id="accountno3">
		</td>
	</tr>
	<tr>
		<td>
		<input type="text" name="bank4" id="bank4">
		</td>
		<td>
		<input type="text" name="branch4" id="branch4">
		</td>
		<td>
		<input type="text" name="accounttype4" id="accounttype4">
		</td>
		<td>
		<input type="text" name="accountno4" id="accountno4">
		</td>
	</tr>
	<tr>
		<td>
		<input type="text" name="bank5" id="bank5">
		</td>
		<td>
		<input type="text" name="branch5" id="branch5">
		</td>
		<td>
		<input type="text" name="accounttype5" id="accounttype5">
		</td>
		<td>
		<input type="text" name="accountno5" id="accountno5">
		</td>
	</tr>
	</table>
	<br>
	</td>
</tr>
<tr>
	<td colspan="2" align="center">
	<a href="AdminVerifyFormPart2.jsp" class="smallbuttons">Prev</a>
	&nbsp;&nbsp;
	<a href="AdminVerifyFinalStage.jsp" class="smallbuttons">Next</a>
	</td>
</tr>
</table>
</form>	
</body>
</html>