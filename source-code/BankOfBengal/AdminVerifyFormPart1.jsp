<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Verify Form Part1</title>
<link rel="stylesheet" href="css/AdminTableStyle.css">
<link rel="stylesheet" href="css/SmallButtonStyleCSS.css">
<script>

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
	var k=document.getElementById("cidSessionForm1").value;
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
		
		document.getElementById("branchcode").value=x[2];
	
		if(x[3]=="public")
		document.getElementById("ctype1").checked=true;
		else
		document.getElementById("ctype2").checked=true;
	
		if(x[4]=="senior")
		document.getElementById("senior").checked=true;
		if(x[4]=="minor")
		document.getElementById("minor").checked=true;
	
		document.getElementById("salutation").value=x[5];
		document.getElementById("fname").value=x[6];
		document.getElementById("mname1").value=x[7];
		document.getElementById("lname").value=x[8];
		document.getElementById("guardian").value=x[9];
		document.getElementById("gsalutation").value=x[10];
		document.getElementById("gname").value=x[11];
	
		document.getElementById("dob").value=x[12];
	
	    if(x[13]=="male")
		document.getElementById("gender1").checked=true;
	    else
	    document.getElementById("gender2").checked=true;
	
		document.getElementById("nationality").value=x[14];
		document.getElementById("maiden").value=x[15];
		document.getElementById("marital").value=x[16];
	
		if(x[17]=="applicant")
		document.getElementById("uidno1").value=x[18];
		else
		document.getElementById("uidno2").value=x[18];
	
		document.getElementById("homeno").value=x[19];
		document.getElementById("street").value=x[20];
		document.getElementById("landmark").value=x[21];
		document.getElementById("district").value=x[22];
		
						
		document.getElementById("state").value=x[24];
		document.getElementById("pincode").value=x[25];
		document.getElementById("addsame").value=x[26];
		document.getElementById("xhomeno").value=x[27];
		document.getElementById("xstreet").value=x[28];
		document.getElementById("xlandmark").value=x[29];
		document.getElementById("xdistrict").value=x[30];
		document.getElementById("xstate").value=x[31];
		
		document.getElementById("xpincode").value=x[33];
		
		document.getElementById("mcode").value=x[34];
		document.getElementById("mobile").value=x[35];
		document.getElementById("lcode").value=x[36];
		document.getElementById("landline").value=x[37];
		document.getElementById("eid").value=x[38];
		document.getElementById("edomain").value=x[39];
		document.getElementById("email").value=x[40];
		
		document.getElementById("branchname").value=x[41];
		document.getElementById("branchaddress").value=x[42];
		
		document.getElementById("city").value=x[23];
		document.getElementById("xcity").value=x[32];
		
		document.getElementById("dor").value=x[43];
		
		if(x[26]=="yes")
		{
			document.getElementById("xhomeno").disabled=true;
			document.getElementById("xstreet").disabled=true;
			document.getElementById("xlandmark").disabled=true;
			document.getElementById("xdistrict").disabled=true;
			document.getElementById("xcity").disabled=true;
			document.getElementById("xstate").disabled=true;
			document.getElementById("xpincode").disabled=true;			
		}
		
		
	}

}

function loadFunctions()
{
	var c=window.opener.document.getElementById("cidSession").value;
	document.getElementById("cidSessionForm1").value=c;
	xmlhttpPost("AdminVerifyFormPart1Ajax.jsp");
}

</script>

</head>
<body onload="loadFunctions()">
<form name="form1"  method="post">
<table class="CSSFormAdmin" align="center">
<tr >
	<th colspan="3">Verify Personal Details</th>
</tr>
<tr>
	<td>
	Date Of Registration
	</td>
	<td>
	<input type="text" id="dor" name="dor">
	</td>
	<td rowspan="2">
	Customer ID &nbsp;&nbsp;
	<input type="hidden" name="cidSessionForm1" id="cidSessionForm1">
	<input type="text" name="cid" id="cid" readonly="readonly">
	</td>
</tr>
<tr bgcolor=#ffffff>
	<td>
	Application No.
	</td>
	<td colspan="1">
	<input type="text" name="applicationno" id="applicationno" readonly="readonly">
	</td>
</tr>
<tr bgcolor=#d8d8d8>
	<td>
	Branch*  
	</td>
	<td>
	Branch Code &nbsp;<input type="text" name="branchcode" id="branchcode" readonly="readonly" >
	<br>
	Branch Name <input type="text" name="branchname" id="branchname" readonly="readonly" >
	</td>
	<td>
	<textarea rows="3" cols="40" name="branchaddress" id="branchaddress" readonly="readonly"  ></textarea>
	</td>
</tr>

<tr bgcolor=#ffffff>
	<td>
	Customer Type*
	</td>
	<td>
	<input type="radio" name="ctype" id="ctype1" value="public" checked="checked">Public
	<input type="radio" name="ctype" id="ctype2" value="staff">Staff
	</td>
	<td>
	<input type="radio" name="cage1" value="senior" id="senior" onclick="enableSenior()" ondblclick="disableSenior()">Senior Citizen
	<input type="radio" name="cage1" value="minor" id="minor" onclick="enableMinor()" ondblclick="disableMinor()">Minor
	<input type="hidden" name="cage" value="general">
	</td>
	
</tr>
<tr bgcolor=#d8d8d8>
	<td>
	Name*
	</td>
	<td colspan="2">
	<select name="salutation" id="salutation">
	<option value="Mr.">Mr.</option>
	<option value="Mrs.">Mrs.</option>
	<option value="Others">Others</option>
	</select>
	<input type="text" name="fname" id="fname">
	<input type="text" name="mname1" id="mname1">
	<input type="hidden" name="mname" id="mname">
	<input type="text" name="lname" id="lname">
	</td>
</tr>
<tr bgcolor=#ffffff>
	<td>
	Name Of Guardian*
	<select name="guardian" id="guardian">
	<option value="father">Father</option>
	<option value="husband">Husband</option>
	<option value="mother">Mother</option>
	</select>	  
	</td>
	<td colspan="2">
	<select name="gsalutation" id="gsalutation">
	<option value="Mr.">Mr.</option>
	<option value="Mrs.">Mrs.</option>
	<option value="Others">Others</option>
	</select>
	<input type="text" name="gname" id="gname">
	</td>
</tr>
<tr bgcolor=#d8d8d8>
	<td>
	Date Of Birth*
	</td>
	<td>
	<input type="text" id="dob" name="dob">
	</td>
	<td>
	Gender*
	<input type="radio" name="gender" id="gender1" value="male" checked="checked">Male
	<input type="radio" name="gender" id="gender2" value="female">Female
	</td>
</tr>
<tr bgcolor=#ffffff>
	<td>
	Nationality*
	</td>
	<td colspan="2">
	<select name="nationality" id="nationality">
	<option value="indian">INDIAN</option>
	<option value="others">Others</option>
	</select> 
	</td>
</tr>
<tr bgcolor=#d8d8d8>
	<td>
	Mother's Maiden Name*
	</td>
	<td>
	<input type="text" name="maiden" id="maiden">
	</td>
	<td>
	Applicant's Marital Status*
	<select name="marital" id="marital">
	<option value="0">--Select--</option>
	<option value="single">Single</option>
	<option value="married">Married</option>
	<option value="others">Others</option>
	</select>
</tr>
<tr bgcolor=#ffffff>
	<td>
	UID of Applicant
	</td>
	<td colspan="2">
	<input type="text" name="uidno1" id="uidno1">
	OR UID of Father/Mother (in case Applicant is minor)
	<input type="text" name="uidno2" id="uidno2" disabled="disabled">
	</td>
</tr>
<tr bgcolor=#888888>
	<th colspan="3" align="left">Correspondence Address (Current Residential/Office)
	</th>
</tr>
<tr bgcolor=#ffffff>
	<td>
	Home No./Flat No.
	</td>
	<td colspan="2">
	<input type="text" name="homeno" id="homeno">
	</td>
</tr>
<tr bgcolor=#d8d8d8>
	<td>
	Street Address*
	</td>
	<td colspan="2">
	<input type="text" name="street" id="street">
	</td>
</tr>
<tr bgcolor=#ffffff>
	<td>
	Landmark
	</td>
	<td>
	<input type="text" name="landmark" id="landmark">
	</td>
	<td>
	District*
	<input type="text" name="district" id="district">
	</td>
</tr>
<tr bgcolor=#d8d8d8>
	<td>
	State*
	</td>
	<td>
	<input type="text" name="state" id="state" readonly="readonly">
	</td>
	<td>
	City*
	<input type="text" name="city" id="city" readonly="readonly">
	</td>
</tr>
<tr bgcolor=#ffffff>
	<td>
	PINCODE*
	</td>
	<td colspan="2">
	<input type="text" name="pincode" id="pincode">
	</td>
</tr>
<tr bgcolor=#888888>
	<th colspan="3" align="left">Permanent Address
	</th>
</tr>
<tr bgcolor=#ffffff>
	<td colspan="3">
	<center>
	<i>
	<b>
	Same as Correspondence
	</b>
	</i>
	<select name="addsame" id="addsame" >
	<option value="no">NO</option>
	<option value="yes">YES</option>
	</select>
	</center>
	</td>
	
</tr>
<tr bgcolor=#d8d8d8>
	<td>
	Home No./Flat No.
	</td>
	<td colspan="2">
	<input type="text" name="xhomeno" id="xhomeno">
	</td>
</tr>
<tr bgcolor=#ffffff>
	<td>
	Street Address*
	</td>
	<td colspan="2">
	<input type="text" name="xstreet" id="xstreet">
	</td>
</tr>
<tr bgcolor=#d8d8d8>
	<td>
	Landmark
	</td>
	<td>
	<input type="text" name="xlandmark" id="xlandmark">
	</td>
	<td>
	District*
	<input type="text" name="xdistrict" id="xdistrict">
	</td>
</tr>
<tr bgcolor=#ffffff>
	<td>
	State*
	</td>
	<td>
	<input type="text" name="xstate" id="xstate" readonly="readonly">
	</td>
	<td>
	City*
	<input type="text" name="xcity" id="xcity" readonly="readonly">
	</td>
</tr>
<tr bgcolor=#d8d8d8>
	<td>
	PINCODE*
	</td>
	<td colspan="2">
	<input type="text" name="xpincode" id="xpincode">
	</td>
</tr>
<tr bgcolor=#888888>
	<th colspan="3" align="left">Contacts
	</th>
</tr>

<tr bgcolor=#ffffff>
	<td>
	Mobile No.*
	</td>
	<td colspan="2">
	<select name="mcode" id="mcode">
	<option value="0">Country Code</option>
	<option value="+91">+91</option>
	</select>
	<input type="text" name="mobile" id="mobile">
	</td>
</tr>
<tr bgcolor=#d8d8d8>
	<td>
	Telephone No. (With STD Code)*
	</td>
	<td colspan="2">
	<input type="text" name="lcode" id="lcode">
	<input type="text" name="landline" id="landline">
	</td>
</tr>
<tr bgcolor=#ffffff>
	<td>
	Email ID*
	</td>
	<td colspan="2">
	<input type="text" name="eid" id="eid">
	@
	<select name="edomain" id="edomain">
	<option value="0">Select Domain</option>
	<option value="gmail.com">gmail.com</option>
	<option value="yahoo.com">yahoo.com</option>
	</select>
	</td>
</tr>
<tr bgcolor=#d8d8d8>
	<td>
	Re-Enter Email ID*
	</td>
	<td colspan="2">
	<input type="text" name="email" id="email">
	</td>
</tr>
<tr>
	<td colspan="3" style="text-align: center">
	<a href="AdminVerifyFormPart2.jsp" class="smallbuttons">Next</a>
	</td>
</tr>
</table>
</form>
</body>
</html>