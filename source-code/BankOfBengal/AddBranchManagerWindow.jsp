<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Branch Manager Window</title>
<link rel="stylesheet" href="css/AdminTableStyle.css">
<script>
function validation()
{
	var errorElement=document.getElementById("errormsg");
	var errorMessage=" **Error : ";
	
	var c=document.getElementById("branchcode");
	var c1=c.options[c.selectedIndex].text;
	if(c1=="--Select--")
		{
		alert("Select Branch Code !");
		var text="Select The Branch Code";
		var error=errorMessage+text;
		errorElement.innerHTML=error;
		errorElement.style.color="red";
		document.getElementById("branchcode").focus();
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

function xmlhttpPostName(strURL)
{
	var errorElement=document.getElementById("errormsg");
	var errorMessage=" **Error : ";
	var k=document.getElementById("branchcode");
	var k1=k.options[k.selectedIndex].text;
	if(k1=="--Select--")
	{
		alert("Select Correct Branch Code !");
		var text="Select Correct Branch Code";
		var error=errorMessage+text;
		errorElement.innerHTML=error;
		errorElement.style.color="red";
		document.getElementById("branchcode").focus();
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
				updatepageName(self.xmlHttpReq.responseText);
			}
		};
		self.xmlHttpReq.send(getquerystringName());
	}
}

function getquerystringName()
{
	var k=document.getElementById("branchcode");
	var k1=k.options[k.selectedIndex].text;
	var word = k1;
	qstr = 'w=' + escape(word); // NOTE: no '?' before querystring
	return qstr;
}

function updatepageName(str)
{
	document.getElementById("branchname").value=str;
}


function xmlhttpPostBranch(strURL)
{
	var errorElement=document.getElementById("errormsg");
	var errorMessage=" **Error : ";
	var k=document.getElementById("branchcity");
	var k1=k.options[k.selectedIndex].text;
	var removeXElement=document.getElementById("branchcode");
	var x = removeXElement;
	while (x.length>1)
	{
		x.remove(x.length-1);
	}
	if(k1=="--Select--")
	{
		alert("Select Correct Branch City !");
		var text="Select Correct Branch City";
		var error=errorMessage+text;
		errorElement.innerHTML=error;
		errorElement.style.color="red";
		document.getElementById("branchCity").focus();
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
				updatepageBranch(self.xmlHttpReq.responseText);
			}
		};
		self.xmlHttpReq.send(getquerystringBranch());
	}
}

function getquerystringBranch()
{
	var l=document.getElementById("branchstate");
	var l1=l.options[l.selectedIndex].text;
	
	var k=document.getElementById("branchcity");
	var k1=k.options[k.selectedIndex].text;
	var word = l1+","+k1;
	qstr = 'w=' + escape(word); // NOTE: no '?' before querystring
	return qstr;
}

function updatepageBranch(str)
{
	var codeString = str.split(",");
	var l=codeString.length;
	var n=0;
	var selectElement=document.addBranchDetails.branchcode;
	for (n=0; n<l-1; n++)
	{
		selectElement.options[selectElement.options.length]=new Option(codeString[n],codeString[n]);
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
		sql="select * from adminaccount";
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
	 


<form name="addBranchDetails" action="AddBranchManagerServlet" method="post" >
<center>
<table class="CSSFormAdmin" align="center">
<tr>
	<th colspan="2">
	Add New Branch Manager
	</th>
</tr>
<tr bgcolor=#888888>
	<td colspan="2" align="center">
	Enter The Details for the Branch Manager
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
	Manager Serial No.
	</td>
	<td>
		<input type="text" name="serial" value=<%=serial %> readonly="readonly">
	</td>
</tr>
<tr bgcolor=#ffffff>
	<td>
	Branch State
	</td>
	<td>
	<select name="branchstate" id="branchstate" onchange='xmlhttpPost("GetCityFromStateAjax.jsp")'>
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
	<select name="branchcity" id="branchcity" onchange='xmlhttpPostBranch("GetBranchCodeAjax.jsp")'>
	<option value="0">--Select--</option>
	</select>
	</td>
</tr>

<tr bgcolor=#ffffff>
	<td>
	Branch Code
	</td>
	<td>
	<select name="branchcode" id="branchcode" onchange='xmlhttpPostName("GetBranchNameAjax.jsp")'>
	<option value="0">--Select--</option>
	</select>
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

<tr bgcolor=#d8d8d8>
	<td>
	Manager Full Name
	</td>
	<td>
		<input type="text" name="name">
	</td>
</tr>
<tr bgcolor=#d8d8d8>
	<td>
	Manager Email ID
	</td>
	<td>
		<input type="email" name="email">
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