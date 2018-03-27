<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Online Account Open Form Part2</title>
<link rel="stylesheet" href="css/AdminTableStyle.css">
<link rel="stylesheet" href="css/SmallButtonStyleCSS.css">
</head>
<body onload="loadFunctions()">
<script>
function loadFunctions()
{
	var c=window.opener.document.getElementById("cidSession").value;
	document.getElementById("cidSessionForm2").value=c;
	xmlhttpPost("AdminVerifyFormPart2Ajax.jsp");
}

function showForm60()
{
	window.open("AdminViewForm60Window.jsp");
	var form60Window=window.open("AdminViewForm60Window.jsp","getBranchWindow","width=800,height=550");
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
	var k=document.getElementById("cidSessionForm2").value;
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
		
		if(x[2]!="0")
		document.getElementById("religion").value=x[2];
		
		if(x[3]!="0")
		document.getElementById("category").value=x[3];
		
		document.getElementById("education").value=x[4];
		document.getElementById("occupation").value=x[5];
		document.getElementById("organization").value=x[6];
		document.getElementById("designation").value=x[7];
		document.getElementById("income").value=x[8];
		document.getElementById("term").value=x[9];
		document.getElementById("assetvalue").value="Rs. "+x[10];
		
		document.getElementById("vehicle").value=x[11];
		
		document.getElementById("lifeinsurancevalue").value="Rs. "+x[12];
		
		document.getElementById("lifeinsurance").value=x[13];
		
		document.getElementById("loan").value=x[14];
		
		
		var element=x[15];
		document.getElementById(element).checked=true;
	
		document.getElementById("mutualfund").value=x[16];
		document.getElementById("creditcard").value=x[17];
		
		
		if(x[18]=="pan")
		{
			
			document.getElementById("it").value="I.T. PAN No.";
		}
		else
		{
			document.getElementById("it").value="Form 60 Application No.";
		}
		
		document.getElementById("itno").value=x[19];
				
	}

}

</script>

<form name="form2" method="post">
<table class="CSSFormAdmin" align="center">
<tr >
	<th colspan="4">Verify Additional Details</th>
</tr>
<tr bgcolor=#d8d8d8>
	<td>
	Application No. 
	</td>
	<td>
	<input type="text" name="applicationno" id="applicationno" readonly="readonly" >
	</td>
	<td>
	Customer ID
	</td>
	<td>
	<input type="hidden" name="cidSessionForm2" id="cidSessionForm2">
	<input type="text" name="cid" id="cid" readonly="readonly">
	</td>
</tr>
<tr bgcolor=#ffffff>
	<td>
	Religion
	</td>
	<td>
	<select name="religion" id="religion">
	<option value="0">--Select--</option>
	<option value="hindu">Hindu</option>
	<option value="muslim">Muslim</option>
	<option value="christian">Christian</option>
	<option value="sikh">Sikh</option>
	<option value="others">Others</option> 
	</select>
	</td>
	<td>
	Educational Qualification*
	</td>
	<td>
	<select name="education" id="education">
	<option value="0">--Select--</option>
	<option value="non graduate">Non Graduate</option>
	<option value="graduate">Graduate</option>
	<option value="post gratuate">Post Graduate</option>
	<option value="others">Others</option>
	</select>
</tr>
<tr bgcolor=#d8d8d8>
	<td>
	Category
	</td>
	<td>
	<select name="category" id="category">
	<option value="0">--Select--</option>
	<option value="general">General</option>
	<option value="obc">OBC</option>
	<option value="sc">SC</option>
	<option value="st">ST</option>
	<option value="others">Others</option>
	</select>
	</td>
	<td>
	Occupation Type*
	</td>
	<td>
	<select name="occupation" id="occupation">
	<option value="0">--Select--</option>
	<option value="artist">Artist</option>
	<option value="business in service sector">Business In Service Sector</option>
	<option value="business in trade sector">Business In Trade Sector</option>
	<option value="central govt services">Central Govt Services</option>
	<option value="state govt serices">State Govt Services</option>
	<option value="industrialist">Industrialist</option>
	<option value="journalist">Journalist</option>
	<option value="student">Student</option>
	<option value="housewives">HouseWives</option>
	<option value="retired">Retired</option>
	<option value="others">Others</option>
	</select>	
	</td>
</tr>
<tr bgcolor=#ffffff>
	<td>
	Organization Name
	</td>
	<td>
	<input type="text" name="organization" id="organization">
	</td>
	<td>
	Designation/Profession
	</td>
	<td>
	<input type="text" name="designation" id="designation">
	</td>
</tr>
<tr bgcolor=#d8d8d8>
	<td colspan="4">
	<hr>
	</td>
</tr>
<tr bgcolor=#ffffff>
	<td>
	Income*
	</td>
	<td colspan="3">
	Rs.
	<select name="income" id="income">
	<option value="0">--Select--</option>
	<option value="Upto INR 20,000">Upto INR 20,000</option>
	<option value="INR 20,001 to 50,000">INR 20,001 to 50,000</option>
	<option value="INR 50,001 to 1,00,000">INR 50,001 to 1,00,000</option>
	<option value="INR 1,00,001 to 5,00,001">INR 1,00,001 to 5,00,001</option>
	<option value="INR 5,00,001 to 10,00,001">INR 5,00,001 to 10,00,001</option>
	<option value="Above 10,00,000">Above 10,00,000</option>
	</select>
	<select name="term" id="term">
	<option value="Annually">Annually</option>
	<option value="Monthly">Monthly</option>
	</select>
	</td>
</tr>
<tr bgcolor=#d8d8d8>
	<td>
	Assets (Approximate Value)
	</td>
	<td colspan="3">
	<input type="text" name="assetvalue" id="assetvalue">
	</td>
</tr>
<tr bgcolor=#ffffff>
	<td>
	Vehicle
	</td>
	<td colspan="3">
	<input type="text"  name="vehicle" id="vehicle">
	</td>
</tr>
<tr bgcolor=#d8d8d8>
	<td>
	Life Insurance Value
	</td>
	<td colspan="3">
	<input type="text" name="lifeinsurancevalue" id="lifeinsurancevalue">
	</td> 
</tr>
<tr bgcolor=#ffffff>
	<td>
	Life Insurance
	</td>
	<td colspan="3">
	<input type="text" name="lifeinsurance" id="lifeinsurance">
	</td>
</tr>
<tr bgcolor=#d8d8d8>
	<td>
	Existing Loans
	</td>
	<td colspan="3">
	<input type="text" name="loan" id="loan">
	</td>
</tr>
<tr bgcolor=#ffffff>
	<td>
	House
	</td>
	<td colspan="3">
	<input type="radio" name="house" id="ancestral" value="ancestral">Ancestral
	<input type="radio" name="house" id="owned" value="owned">Owned
	<input type="radio" name="house" id="rented" value="rented">Rented
	<input type="radio" name="house" id="others" value="others" checked="checked">Others
	</td>
</tr>
<tr bgcolor=#d8d8d8>
	<td>
	Mutual Fund
	</td>
	<td colspan="3">
	<input type="text" name="mutualfund" id="mutualfund">
	</td>
</tr>
<tr bgcolor=#ffffff>
	<td>
	Credit Card
	</td>
	<td colspan="3">
	<input type="text" name="creditcard" id="creditcard">
	</td>
</tr>
<tr bgcolor=#888888>
	<th colspan="4">
	IT PAN No. OR Fill Form 60 Details
	</th>
</tr>
<tr bgcolor=#ffffff>
	<td colspan="2">
	<br>
	<input type="text" name="it" id="it" readonly="readonly">&nbsp;:&nbsp;&nbsp;
	<input type="text" name="itno" id="itno">
	<br>
	&nbsp;
	</td>
	<td colspan="2">
	<br>
	<a href="AdminViewForm60Window.jsp" class="smallbuttons">Show Form60 Window</a>
	<br>
	&nbsp;
	</td>
</tr>
<tr>
	<td colspan="4" style="text-align: center">
	<a href="AdminVerifyFormPart1.jsp" class="smallbuttons">Prev</a>
	&nbsp;&nbsp;
	<a href="AdminVerifyFormPart3.jsp" class="smallbuttons">Next</a>	</td>
</tr>
</table>
</form>
</body>
</html>