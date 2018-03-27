<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New Offers For Customer||Bank Of Bengal</title>
  <link rel="stylesheet" href="css/EmailStyle.css">
</head>
<body onload="getSignature()">
<script type="text/javascript">
function getSignature()
{
	var element=document.getElementById("signature");
	if(element.checked==true)
	{
		var element=document.getElementById("body");
		var name="Mr. Nirmallya Kundu";
		element.value="\n\n\n\n\n-Thanks & Regards\n "+name+"\n Administrator\n Bank Of Bengal";
	}
	else
	{
		var element=document.getElementById("body");
		element.value="";
		
	}
}
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
	 
  <section class="container">
    <div class="login">
      <h1>Compose Email To Send</h1>
      <form name="addBranchDetails" method="post" action="NewCustomersOfferServlet" name="account">
      <table>
      	<tr>
      		<td width="150" colspan="2">
      		<p><h4>
      		<select name="branchstate" id="branchstate" onchange='xmlhttpPost("GetCityFromStateAjax.jsp")' style="width:180px">
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
	
	<select name="branchcity" id="branchcity" onchange='xmlhttpPostBranch("GetBranchCodeAjax.jsp")' style="width:180px">
	<option value="0">--Select--</option>
	</select>
	
	<select name="branchcode" id="branchcode" onchange='xmlhttpPostName("GetBranchNameAjax.jsp")' style="width:180px">
	<option value="0">--Select--</option>
	</select>
	</td>
      </tr>
	<tr>
		<td>
		<h4>Branch Name</h4>
		</td>
		<td style="text-align: right">
		<input type="text" name="branchname" id="branchname" placeholder="Branch Name" style="width:400px">
		</td>
	<tr>
      		<td>
      		<h4>Email Subject</h4>
      		</td>
      		<td style="text-align: right">
      		<input type="text" name="sub" id="sub" placeholder="Subject" value="NEW EXCITING OFFER" style="width:400px"></h4></p>
      		</td>
      </tr>
      <tr>
      		<td width="150" colspan="2">
      		<h6>Signature <input type="checkbox" checked="checked" name="signature" id="signature" onchange="getSignature()">
      		<br>
      		<textarea rows="20" cols="50" name="body" id="body" placeholder="Enter Your Message Here ..."></textarea></h6>
      		</td>
      </tr>
      <tr>
      <td colspan="2">
      <label id="errormsg" style="color: red; font-family: Times New Roman; font-size: 15px"></label>
      </td>
      </tr>
      </table>
       <p class="submit"><input type="submit" name="commit" value="Send"></p>
      </form>
    </div>
  </section>
 </body>
</html>
