<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Form Part1</title>
<link rel="stylesheet" href="css/AdminTableStyle.css">
<script>
function changeCity1()
{
	var CityWindow=window.open("CityChooserWindow.jsp","getBranchWindow","width=500,height=300");
}
function changeCity2()
{
	var CityWindow=window.open("XCityChooserWindow.jsp","getBranchWindow","width=500,height=300");
}

function disableAllField(x)
{
	document.getElementById("branchcode").disabled=x;
	document.getElementById("branchname").disabled=x;
	document.getElementById("branchaddress").disabled=x;
	document.getElementById("ctype1").disabled=x;
	document.getElementById("ctype2").disabled=x;
	document.getElementById("senior").disabled=x;
	document.getElementById("minor").disabled=x;
	document.getElementById("salutation").disabled=x;
	document.getElementById("fname").disabled=x;
	document.getElementById("mname1").disabled=x;
	document.getElementById("lname").disabled=x;
	document.getElementById("guardian").disabled=x;
	document.getElementById("gsalutation").disabled=x;
	document.getElementById("gname").disabled=x;
	document.getElementById("dd").disabled=x;
	document.getElementById("mm").disabled=x;
	document.getElementById("yyyy").disabled=x;
	document.getElementById("gender1").disabled=x;
	document.getElementById("gender2").disabled=x;
	document.getElementById("nationality").disabled=x;
	document.getElementById("maiden").disabled=x;
	document.getElementById("marital").disabled=x;
	document.getElementById("uidno1").disabled=x;
	document.getElementById("uidno2").disabled=x;
	document.getElementById("homeno").disabled=x;
	document.getElementById("street").disabled=x;
	document.getElementById("landmark").disabled=x;
	document.getElementById("district").disabled=x;
	document.getElementById("city").disabled=x;
	document.getElementById("state").disabled=x;
	document.getElementById("pincode").disabled=x;
	document.getElementById("addsame").disabled=x;
	document.getElementById("xhomeno").disabled=x;
	document.getElementById("xstreet").disabled=x;
	document.getElementById("xlandmark").disabled=x;
	document.getElementById("xdistrict").disabled=x;
	document.getElementById("xcity").disabled=x;
	document.getElementById("xstate").disabled=x;
	document.getElementById("xpincode").disabled=x;
	document.getElementById("mcode").disabled=x;
	document.getElementById("mobile").disabled=x;
	document.getElementById("lcode").disabled=x;
	document.getElementById("landline").disabled=x;
	document.getElementById("eid").disabled=x;
	document.getElementById("edomain").disabled=x;
	document.getElementById("email").disabled=x;
	document.getElementById("change1").disabled=x;
}


function form1Validation()
{
	
	var mname=document.getElementById("mname1");
	if(mname.value==null||mname.value=="")
	{
		document.getElementById("mname").value="n/a";
	}
	else
	{
		document.getElementById("mname").value=mname.value;
	}
	var homeno=document.forms["form1"]["homeno"].value;
	var landmark=document.forms["form1"]["landmark"].value;
	if(homeno==null|| homeno=="")
	{
		document.forms["form1"]["homeno"].value="n/a";
	}
	if(landmark==null|| landmark=="")
	{
		document.forms["form1"]["landmark"].value="n/a";
	}
	//After VAlidation
	confirm();
				
}


function loadPermanentAddress()
{
	var q=document.getElementById("addsame");
	var q1=q.options[q.selectedIndex].text;
	if(q1=="YES" || q1=="yes")
	{
		var homeno=document.forms["form1"]["homeno"].value;
		var street=document.forms["form1"]["street"].value;
		var landmark=document.forms["form1"]["landmark"].value;
		var district=document.forms["form1"]["district"].value;
		var pincode=document.forms["form1"]["pincode"].value;
		
		var state=document.forms["form1"].state.value;
		var city=document.forms["form1"].city.value;
		
		document.forms["form1"]["xhomeno"].value=homeno;
		document.forms["form1"]["xstreet"].value=street;
		document.forms["form1"]["xlandmark"].value=landmark;
		document.forms["form1"]["xdistrict"].value=district;
		document.forms["form1"]["xpincode"].value=pincode;
		
		document.getElementById("xstate").value=state;
		
		document.getElementById("xcity").value=city;
		
		document.forms["form1"]["xhomeno"].disabled=true;
		document.forms["form1"]["xstreet"].disabled=true;
		document.forms["form1"]["xlandmark"].disabled=true;
		document.forms["form1"]["xdistrict"].disabled=true;
		document.forms["form1"]["xpincode"].disabled=true;
		
		document.getElementById("xstate").disabled=true;
		document.getElementById("xcity").disabled=true;
		
		
		
	}
	if(q1=="NO" || q1=="no")
	{
		document.forms["form1"]["xhomeno"].value="";
		document.forms["form1"]["xstreet"].value="";
		document.forms["form1"]["xlandmark"].value="";
		document.forms["form1"]["xdistrict"].value="";
		document.forms["form1"]["xpincode"].value="";
		document.forms["form1"]["xstate"].value="";
		document.forms["form1"]["xcity"].value="";
				
		
		document.forms["form1"]["xhomeno"].disabled=false;
		document.forms["form1"]["xstreet"].disabled=false;
		document.forms["form1"]["xlandmark"].disabled=false;
		document.forms["form1"]["xdistrict"].disabled=false;
		document.forms["form1"]["xpincode"].disabled=false;
		
		document.getElementById("xstate").disabled=false;
		document.getElementById("xcity").disabled=false;
		
	}
}

function enableMinor()
{
	document.getElementById("uidno2").disabled=false;
	document.forms["form1"]["cage"].value="minor";
}
function disableMinor()
{
	document.getElementById("uidno2").disabled=true;
	document.getElementById("minor").checked=false;
	document.forms["form1"]["cage"].value="general";
}

function enableSenior()
{
	document.getElementById("uidno2").disabled=true;
	document.forms["form1"]["cage"].value="senior";
}
function disableSenior()
{
	document.getElementById("uidno2").disabled=true;
	document.getElementById("senior").checked=false;
	document.forms["form1"]["cage"].value="general";
}

function getYears()
{
	var d = new Date();
	var y = d.getFullYear();
	var element=document.getElementById("yyyy");
	while (element.length>1)
	{
		element.remove(x.length-1);
	}
	for(var i=y;i>=1930;i--)
	{
		element.options[element.options.length]=new Option(i,i);
	}
}

function getDays()
{
	var element=document.getElementById("dd");
	while (element.length>1)
	{
		element.remove(x.length-1);
	}
	for(var d=1;d<=31;d++)
	{
		if(d<=9)
		{
			x="0"+d;
			element.options[element.options.length]=new Option(x,x);
		}
		else
		{
			element.options[element.options.length]=new Option(d,d);
		}
	}
}

function loadFunctions()
{	
	getDays();
	getYears();
	disableAllField(true);	
}
function confirm()
{
	var cell1=document.getElementById("proceedandsubmit");
	
	var x=document.getElementById("proceed");
    cell1.removeChild(x);
    
	var element1 = document.createElement("input");
    element1.setAttribute("type", "Submit");
    element1.setAttribute("value", "Update And Proceed");
    element1.setAttribute("name", "Submit");
    cell1.appendChild(element1);
    
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
	var k=document.getElementById("cid").value;
	var word = k;
	qstr = 'w=' + escape(word); // NOTE: no '?' before querystring
	return qstr;
}

function updatepage(str)
{
	str1="error";
	if(str!=str1)
	{
		disableAllField(false);
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
	
		var ddmmyyyy=x[12];
		var y=ddmmyyyy.split("-");
		document.getElementById("dd").value=y[0];
	    document.getElementById("mm").value=y[1];
	    document.getElementById("yyyy").value=y[2];
	
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

</script>

</head>
<body onload="loadFunctions()">
<%@	page import="java.sql.Connection ,
				     java.sql.DriverManager ,
					 java.sql.PreparedStatement ,
					 java.sql.ResultSet ,
					 java.sql.SQLException"
	 %>
	 <%!
	int SIZE=100;
	Connection con=null;
	PreparedStatement pst=null;
	ResultSet rs=null;
	String sql=null;
	int countState=0,countCity=0;
	int i=-1;
	int applicationno=0;
	String state[]=new String[SIZE];
	String city[]=new String[SIZE];
	String branchstateValue;
	%>
	<%
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");
		sql="select distinct state from stateandcity order by state";
		pst=con.prepareStatement(sql);
		rs=pst.executeQuery();
		i=-1;
		while(rs.next())
		{
			i=i+1;
			state[i]=rs.getString(1);
		}
		countState=i;
		
	}
	catch(ClassNotFoundException e)
	{
			e.printStackTrace();
	}
	catch(SQLException e)
	{
		e.printStackTrace();
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	finally
	{
			try
			{
				if(con!=null)
				con.close();

			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
	}
	%>
	 

<form name="form1" action="AdminEditForm1Servlet" method="post">
<center>
<table class="CSSFormAdmin" align="center">
<tr>
	<th colspan="3">Edit Personal Details</th>
</tr>
<tr>
	<td colspan="3">
	<p id="instruction"><font color="red"><b>
	Do not Press F5 or Refresh while Editing this form
	</b></font>	</p>
	<p id="errormsg">
	</p>
	</td>
</tr>
<tr bgcolor=#ffffff>
	<td>
	Application No.
	</td>
	<td colspan="1">
	<input type="text" name="applicationno" id="applicationno">
	</td>
	<td >
	Customer ID &nbsp;&nbsp;
	<input type="text" name="cid" id="cid" onchange='xmlhttpPost("AdminEditFormPart1Ajax.jsp")'>
	&nbsp;&nbsp;
	<button type="button" id="show" onclick='xmlhttpPost("AdminEditFormPart1Ajax.jsp")' >Show</button>
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
	
	<select name="dd" id="dd">
	<option value="0">DD</option>
	</select>
	<select name="mm" id="mm">
	<option value="0">MM</option>
	<option value="01">Jan</option>
	<option value="02">Feb</option>
	<option value="03">Mar</option>
	<option value="04">Apr</option>
	<option value="05">May</option>
	<option value="06">Jun</option>
	<option value="07">Jul</option>
	<option value="08">Aug</option>
	<option value="09">Sep</option>
	<option value="10">Oct</option>
	<option value="11">Nov</option>
	<option value="12">Dec</option>
	</select>
	
	<select name="yyyy" id="yyyy">
	<option value="0">YYYY</option>
	</select>
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
	&nbsp;&nbsp;
	<button type="button" id="change1" onclick="changeCity1()">Change</button>
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
	<select name="addsame" id="addsame" onchange="loadPermanentAddress()">
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
	&nbsp;&nbsp;
	<button type="button" id="change2" onclick="changeCity2()" >Change</button>
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
	<td colspan="3" id="proceedandsubmit" style="text-align: center">
	<button type="button" id="proceed" onclick="return form1Validation()">Proceed</button>
	</td>
</tr>
</table>
</center>
</form>
</body>
</html>