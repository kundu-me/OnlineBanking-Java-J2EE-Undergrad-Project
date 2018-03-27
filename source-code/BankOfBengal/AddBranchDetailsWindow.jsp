<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Branch Details Window</title>
<link rel="stylesheet" href="css/AdminTableStyle.css">
<script>
function validation()
{
	var errorElement=document.getElementById("errormsg");
	var errorMessage=" **Error : ";
	var a=document.forms["addBranchDetails"]["branchcode"].value;
	if(a==null || a=="" )
	{
	alert("Branch Code Cannot be Blank !");
	var text="Enter The Correct Branch Code ";
	var error=errorMessage+text;
	errorElement.innerHTML=error;
	errorElement.style.color="red";
	document.getElementById("branchcode").focus();
	return false;
	}
	var b=document.forms["addBranchDetails"]["branchname"].value;
	if(b==null || b=="" )
	{
	alert("Branch Name Cannot be Blank !");
	var text="Enter The Correct Branch Name ";
	var error=errorMessage+text;
	errorElement.innerHTML=error;
	errorElement.style.color="red";
	document.getElementById("branchname").focus();
	return false;
	}
	var c=document.getElementById("branchstate");
	var c1=c.options[c.selectedIndex].text;
	if(c1=="--Select--")
		{
		alert("Select Branch State !");
		var text="Select The Branch State";
		var error=errorMessage+text;
		errorElement.innerHTML=error;
		errorElement.style.color="red";
		document.getElementById("branchstate").focus();
		return false;	
		}
	var d=document.getElementById("branchcity");
	var d1=d.options[d.selectedIndex].text;
	if(d1=="--Select--")
		{
		alert("Select Branch City !");
		var text="Select The Branch City";
		var error=errorMessage+text;
		errorElement.innerHTML=error;
		errorElement.style.color="red";
		document.getElementById("branchcity").focus();
		return false;	
		}
	
	var e=document.forms["addBranchDetails"]["branchpincode"].value;
	if(e==null || e=="" )
	{
	alert("Branch PinCode Cannot be Blank !");
	var text="Enter The Branch PinCode ";
	var error=errorMessage+text;
	errorElement.innerHTML=error;
	errorElement.style.color="red";
	document.getElementById("branchpincode").focus();
	return false;
	}
	var f=document.forms["addBranchDetails"]["branchaddress"].value;
	if(f==null || f=="" )
	{
	alert("Branch Address Cannot be Blank !");
	var text="Enter The Branch Address ";
	var error=errorMessage+text;
	errorElement.innerHTML=error;
	errorElement.style.color="red";
	document.getElementById("branchaddress").focus();
	return false;
	}
}

function xmlhttpPost(strURL)
{
	var errorElement=document.getElementById("errormsg");
	var errorMessage=" **Error : ";
	var k=document.getElementById("branchstate");
	var k1=k.options[k.selectedIndex].text;
	var removeXElement=document.getElementById("branchcity");
	var x = removeXElement;
	while (x.length>1)
	{
		x.remove(x.length-1);
	}
	if(k1=="--Select--")
	{
		alert("Select Correct Branch State !");
		var text="Select Correct Branch State";
		var error=errorMessage+text;
		errorElement.innerHTML=error;
		errorElement.style.color="red";
		document.getElementById("branchstate").focus();
		return false;	
	}
	else
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
}

function getquerystring()
{
	var k=document.getElementById("branchstate");
	var k1=k.options[k.selectedIndex].text;
	var word = k1;
	qstr = 'w=' + escape(word); // NOTE: no '?' before querystring
	return qstr;
}

function updatepage(str)
{
	var cityString = str.split(",");
	var l=cityString.length;
	var n=0;
	var selectElement=document.addBranchDetails.branchcity;
	for (n=0; n<l-1; n++)
	{
		selectElement.options[selectElement.options.length]=new Option(cityString[n],cityString[n]);
	}
}



</script>
</head>
<body>
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
	int serial=0;
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
		
		i=0;
		sql="select * from branchdetails";
		pst=con.prepareStatement(sql);
		rs=pst.executeQuery();
		while(rs.next())
		{
			i=i+1;
		}
		serial=i+1;
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
	 


<form name="addBranchDetails" action="AddBranchDetailsServlet" method="post" >
<center>
<table class="CSSFormAdmin" align="center">
<tr>
	<th colspan="2">
	Add New Branch Details
	</th>
</tr>
<tr bgcolor=#888888>
	<td colspan="2" align="center">
	Enter The Details for the Branch to Add
	</td>
</tr>
<tr>
	<td colspan="2">
	<p id="instruction"><font color="red"><b>
	Do not Press F5 or Refresh while filling up this 
	</b></font>	</p>
	<p id="errormsg">
	</p>
	</td>
</tr>
<tr bgcolor=#d8d8d8>
	<td>
	Branch Serial No.
	</td>
	<td>
		<input type="text" name="serial" value=<%=serial %> readonly="readonly">
	</td>
</tr>
<tr bgcolor=#ffffff>
	<td>
	Branch Code
	</td>
	<td>
	<input type="text" name="branchcode" id="branchcode">
	</td>
</tr>
<tr bgcolor=#d8d8d8>
	<td>
	Branch Name
	</td>
	<td>
	<input type="text" name="branchname" id="branchname">
	</td>
</tr>
<tr bgcolor=#ffffff>
	<td>
	Branch State
	</td>
	<td>
	<select name="branchstate" id="branchstate" onchange='return xmlhttpPost("GetCityFromStateAjax.jsp")'>
	<option value="0">--Select--</option>
	<%
	for(int j=0;j<=countState;j++)
	{
		String stringValue=state[j];
	 %>
	 <option value="<%=stringValue %>"><%= stringValue %></option>
	<%
	}
	%>
	</select>
	</td>
</tr >
<tr bgcolor=#d8d8d8>
	<td>
	Branch City
	</td>
	<td>
	<select name="branchcity" id="branchcity">
	<option value="0">--Select--</option>
	</select>
	</td>
</tr>
<tr bgcolor=#ffffff>
	<td>
	Branch PinCode
	</td>
	<td>
	<input type="text" name="branchpincode" id="branchpincode">
	</td> 
</tr>
<tr bgcolor=#d8d8d8>
	<td>
	Branch Address
	</td>
	<td>
	<textarea rows="3" cols="30" name="branchaddress" id="branchaddress"></textarea>
	</td>
</tr>
<tr bgcolor=#ffffff>
	<td colspan="2">
	<center>
	<input type="reset" value="Reset">
	<button name="Submit" onclick="return validation()" >Submit</button>
	</center>
	</td>
</tr>
</table>
</center>
</form>
</body>
</html>