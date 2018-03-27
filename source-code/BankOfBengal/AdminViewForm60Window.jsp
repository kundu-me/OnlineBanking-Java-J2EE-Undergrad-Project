<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Form 60</title>
<link rel="stylesheet" href="css/AdminTableStyle.css">
<link rel="stylesheet" href="css/SmallButtonStyleCSS.css">
</head>
<body onload="loadFunctions()">
<script type="text/javascript">
function closeTheWindow()
{
	window.open('', '_self', ''); 
	window.close(); 
}
function loadFunctions()
{
	var cid=window.opener.document.getElementById("cidSession").value;
	document.getElementById("cid").value=cid;
	xmlhttpPost("AdminViewForm60Ajax.jsp",cid);
}
function xmlhttpPost(strURL,cid)
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
		self.xmlHttpReq.send(getquerystring(cid));
	
}

function getquerystring(cid)
{
	
	var word = cid;
	qstr = 'w=' + escape(word); // NOTE: no '?' before querystring
	return qstr;
}

function updatepage(str)
{
	str1="error";
	if(str!=str1)
	{
		var x = str.split("|");
		
		document.getElementById("form60no").value=x[0];
		document.getElementById("cid").value=x[1];
		document.getElementById("fullname").value=x[2];
		document.getElementById("address").value=x[3];
		document.getElementById("openingof").value=x[4];
		document.getElementById("issueof").value=x[5];
		document.getElementById("tamount").value=x[6];
		
		var element=x[7];
		document.getElementById(element).checked=true;
		
		document.getElementById("document").value=x[8];
				
	}
	else
	{
		alert("Error: No Form 60/61 For This Customer !!!");
		document.getElementById("form60no").value="";
		document.getElementById("cid").value="";
		document.getElementById("fullname").value="";
		document.getElementById("address").value="";
		document.getElementById("openingof").value="";
		document.getElementById("issueof").value="";
		document.getElementById("tamount").value="";
		document.getElementById("document").value="";
		
		
	}
	
}

</script>
<form>
<table class="CSSFormAdmin" align="center">
<tr>
	<th colspan="4"> Form 60/61
</tr>
<tr bgcolor=#ffffff>
	<td colspan="4">
<pre><b>
  Form 60/61 No.	<input type="text" name="form60no" id="form60no" readonly="readonly">	Customer ID : 	<input type="text" name="cid" id="cid"></b>
  
  Form of declaration filled by a person who does not have either a Permanent Account Number
  or General Index Registration Number and who makes payment in cash in respect of transaction
  specified in clause (a) to (h) of rule 114B
	
  Full Name of Declarant*	<input type="text" name="fullname" id="fullname" readonly="readonly">
	
  Address of Declarant*	<textarea rows="3" cols="30" name="address" id="address" readonly="readonly"></textarea>
	
  Particulars of Transaction - (a) Opening of	<input type="text" name="openingof" id="openingof" readonly="readonly"> account(s)*
	
                               (b) Issue of Debit Card	<input type="text" name="issueof" id="issueof" readonly="readonly">
								 
  Amount of Transaction*	<input type="text" name="tamount" id="tamount" readonly="readonly">
	
  Are you assessed to tax?*	<input type="radio" name="tax" value="yes" id="yes" disabled="disabled">Yes <input type="radio" name="tax" value="no" id="no" checked="checked" disabled="disabled">No
	
  Details of documents being produced in support of address	<input type="text" name="document" id="document" readonly="readonly">
	
</pre>
	</td>
</tr>
<tr>
	<td colspan="4" style="text-align: center">
	<a href="AdminVerifyFormPart2.jsp" class="smallbuttons">Back</a>
	</td>
</tr>
</table>
</form>
</body>
</html>