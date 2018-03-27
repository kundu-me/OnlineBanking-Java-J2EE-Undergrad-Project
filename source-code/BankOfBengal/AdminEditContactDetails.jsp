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
	document.getElementById("salutation").disabled=x;
	document.getElementById("fname").disabled=x;
	document.getElementById("mname1").disabled=x;
	document.getElementById("lname").disabled=x;
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

function loadFunctions()
{	
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
		
		document.getElementById("cid").value=x[1];
		
		document.getElementById("branchcode").value=x[2];
	
		
		document.getElementById("salutation").value=x[5];
		document.getElementById("fname").value=x[6];
		document.getElementById("mname1").value=x[7];
		document.getElementById("lname").value=x[8];
		
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

function xmlhttpPostGetACC(strURL)
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
				updatepageGetACC(self.xmlHttpReq.responseText);
			}
		};
		self.xmlHttpReq.send(getquerystringGetACC());
	
}

function getquerystringGetACC()
{
	var k=document.getElementById("cid").value;
	var word = k;
	qstr = 'w=' + escape(word); // NOTE: no '?' before querystring
	return qstr;
}

function updatepageGetACC(str)
{
	{
		document.getElementById("accountno").value=str;
	}

}


function xmlhttpPostGetCID(strURL)
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
				updatepageGetCID(self.xmlHttpReq.responseText);
			}
		};
		self.xmlHttpReq.send(getquerystringGetCID());
	
}

function getquerystringGetCID()
{
	var k=document.getElementById("accountno").value;
	var word = k;
	qstr = 'w=' + escape(word); // NOTE: no '?' before querystring
	return qstr;
}

function updatepageGetCID(str)
{
		document.getElementById("cid").value=str;
		
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
	int accountno=0;
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
	 

<form name="form1" action="AdminEditContactDetailsServlet" method="post">
<center>
<table class="CSSFormAdmin" align="center">
<tr>
	<th colspan="3">Edit Contact Details</th>
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
	Account No.
	</td>
	<td colspan="1">
	<input type="text" name="accountno" id="accountno" onkeyup='xmlhttpPostGetCID("GetCIDAjax.jsp")'>
	</td>
	<td >
	Customer ID &nbsp;&nbsp;
	<input type="text" name="cid" id="cid" onkeyup='xmlhttpPostGetACC("GetACCAjax.jsp")'>
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