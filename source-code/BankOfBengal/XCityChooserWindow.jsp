<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>State And City Chooser</title>
<link rel="stylesheet" href="css/CustomerOnlyInputStyle.css">
<link rel="stylesheet" href="css/CustomerFormStyle.css">
<script>
function xmlhttpPost(strURL)
{
	var k=document.getElementById("changestate");
	var k1=k.options[k.selectedIndex].text;
	var removeXElement=document.getElementById("changecity");
	var x = removeXElement;
	while (x.length>1)
	{
		x.remove(x.length-1);
	}
	if(k1=="--Select State--")
	{
		alert("Select Correct Branch State !");
		document.getElementById("changestate").focus();
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
	var k=document.getElementById("changestate");
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
	var selectElement=document.citychooser.changecity;
	for (n=0; n<l-1; n++)
	{
		selectElement.options[selectElement.options.length]=new Option(cityString[n],cityString[n]);
	}
	
}

function submitForm()
{
	var xn=document.getElementById("changestate");
	var xo=document.getElementById("changecity");
	var xn1=xn.options[xn.selectedIndex].text;
	var xo1=xo.options[xo.selectedIndex].text;
	if(xn1=="--Select State--")
		{
		alert("Correspondence Address: Select Your State !");
		document.getElementById("changestate").focus();
		return false;
		}
	if(xo1=="--Select City--")
		{
		alert("Correspondence Address: Select Your City !");
		document.getElementById("changecity").focus();
		return false;
		}
	
		var city=document.getElementById("changecity").value;
		var state=document.getElementById("changestate").value;
		window.opener.document.form1.xstate.value=state;
		window.opener.document.form1.xcity.value=city;
		window.open('', '_self', ''); 
		window.close(); 
		
}

</script>

</head>
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
	 

<body >
<form name="citychooser" method="post" >
<table class="CSSFormCustomer" align="center" id="citydetails">
<tr>
	<th colspan="7" valign="top">State And City Details</th>
</tr>
<tr valign="top">
	<td colspan="7">
	<p id="instruction"><font color="red"><b>
	Select Your Correspondence Address State And City 
	</b></font>	</p>
	</td>
</tr>
<tr valign="top">
	<td colspan="7">
	<br><center>
	<select name="changestate" id="changestate" onchange='xmlhttpPost("GetCityFromStateAjax.jsp")'>
	<option value="0">--Select State--</option>
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
	<select name="changecity" id="changecity">
	<option value="0">--Select City--</option>
	</select>
	<br>
	<br>
	<center>
	<input type="reset" name="reset" value="Reset">&nbsp;
	<button type="button" id="change1" onclick="return submitForm()" >Select</button>
	</center></center>
	<br>
	</td>
</table>
</form>
</body>
</html>