<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Details</title>
</head>
<body>
<script>
function xmlhttpPostGetCity(strURL)
{
	var k=document.getElementById("state");
	var k1=k.options[k.selectedIndex].text;
	var removeXElement=document.getElementById("city");
	var x = removeXElement;
	while (x.length>1)
	{
		x.remove(x.length-1);
	}
	var removeXElement=document.getElementById("branch");
	var x = removeXElement;
	while (x.length>1)
	{
		x.remove(x.length-1);
	}
	
	if(k1=="--Select State--")
	{
		deleteTableRow();
		alert("Select Correct Branch State !");
		document.getElementById("state").focus();
		
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
				updatepageGetCity(self.xmlHttpReq.responseText);
			}
		};
		self.xmlHttpReq.send(getquerystringGetCity());
	}
}

function getquerystringGetCity()
{
	var k=document.getElementById("state");
	var k1=k.options[k.selectedIndex].text;
	var word = k1;
	qstr = 'w=' + escape(word); // NOTE: no '?' before querystring
	return qstr;
}

function updatepageGetCity(str)
{
	var cityString = str.split(",");
	var l=cityString.length;
	var n=0;
	var selectElement=document.customerchooser.city;
	for (n=0; n<l-1; n++)
	{
		selectElement.options[selectElement.options.length]=new Option(cityString[n],cityString[n]);
	}

}

function xmlhttpPostGetBranch(strURL)
{
	var k=document.getElementById("state");
	var k1=k.options[k.selectedIndex].text;
	var l=document.getElementById("city");
	var l1=l.options[l.selectedIndex].text;
	var removeXElement=document.getElementById("branch");
	var x = removeXElement;
	while (x.length>1)
	{
		x.remove(x.length-1);
	}
	
	if(l1=="--Select City--")
	{
		deleteTableRow();
		alert("Select Correct Branch City !");
		document.getElementById("city").focus();
		
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
				updatepageGetBranch(self.xmlHttpReq.responseText);
			}
		};
		self.xmlHttpReq.send(getquerystringGetBranch());
	}
}

function getquerystringGetBranch()
{
	var k=document.getElementById("state");
	var k1=k.options[k.selectedIndex].text;
	
	var l=document.getElementById("city");
	var l1=l.options[l.selectedIndex].text;
	
	var word = k1+","+l1;
	qstr = 'w=' + escape(word); // NOTE: no '?' before querystring
	return qstr;
}

function updatepageGetBranch(str)
{
	
	var branchString = str.split(",");
	var l=branchString.length;
	var n=0;
	var selectElement=document.customerchooser.branch;
	for (n=0; n<l-1; n++)
	{
		selectElement.options[selectElement.options.length]=new Option(branchString[n],branchString[n]);
	}
	
}

function xmlhttpPostGetCustomer(strURL)
{
	deleteTableRow();
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
			updatepageGetCustomer(self.xmlHttpReq.responseText);
		}
	};
	self.xmlHttpReq.send(getquerystringGetCustomer());
}

function getquerystringGetCustomer()
{
	var state1=document.getElementById("state");
	var state=state1.options[state1.selectedIndex].text;
	if(state=="--Select State--")
	{
		state="x";	
	}
	var city1=document.getElementById("city");
	var city=city1.options[city1.selectedIndex].text;
	if(city=="--Select City--")
	{
		city="x";
	}
	var branch1=document.getElementById("branch");
	var branch=branch1.options[branch1.selectedIndex].text;
	if(branch=="--Select Branch--")
	{
		branch="x";
	}
	var bcode=document.forms["customerchooser"]["branchcode"].value;
	if(bcode==null|| bcode=="")
	{
		bcode="x";
	}
	var bname=document.forms["customerchooser"]["branchname"].value;
	if(bname==null|| bname=="")
	{
		bname="x";
	}
	var cid=document.forms["customerchooser"]["customerid"].value;
	if(bcode==null|| cid=="")
	{
		cid="x";
	}
	var aid=document.forms["customerchooser"]["accountno"].value;
	if(aid==null|| aid=="")
	{
		aid="x";
	}
	
	var word = state+","+city+","+branch+","+bcode+","+bname+","+cid+","+aid;
	qstr = 'w=' + escape(word); // NOTE: no '?' before querystring
	return qstr;
	
}
 
function updatepageGetCustomer(str)
{
	var customer = str.split("=");
	var l1=customer.length;
	var n=0;
	var details;
	deleteTableRow();
	var table = document.getElementById("branchdetails");
	var rowCount,row;
	for (n=0; n<l1-1; n++)
	{
		
		rowCount = table.rows.length;
	    row = table.insertRow(rowCount);
	
	    details=customer[n].split("|");
	    
	    var cell1 = row.insertCell(0);
        var element1 = document.createElement("input");
        element1.setAttribute("type", "checkbox");
        element1.setAttribute("value", details[0]);
        element1.setAttribute("name", "cid");
        element1.setAttribute("class", "GetCid");
        //element1.addEventListener ("click",submitForm,false);
       	cell1.appendChild(element1);
 	
       	var cell2 = row.insertCell(1);
        cell2.innerHTML = details[0];
               
        var cell3 = row.insertCell(2);
        cell3.innerHTML = details[1];
        
        var cell4 = row.insertCell(3);
        cell4.innerHTML = details[2];
 
        var cell5 = row.insertCell(4);
        cell5.innerHTML = details[3];
 
        var cell6 = row.insertCell(5);
        cell6.innerHTML = details[4];
 
        var cell7 = row.insertCell(6);
        cell7.innerHTML = details[5];
 
        var cell8 = row.insertCell(7);
        cell8.innerHTML = details[6];
                 
     }
}
function functionReset()
{
	 document.getElementById("state").selectedIndex=0;
	 document.getElementById("city").selectedIndex=0;
	 document.getElementById("branch").selectedIndex=0;
	 document.forms["customerchooser"]["branchcode"].value="";
	 document.forms["customerchooser"]["branchname"].value="";
	 document.forms["customerchooser"]["customerid"].value="";
	 document.forms["customerchooser"]["accountno"].value="";
	 xmlhttpPostGetCustomer("AdminCustomerDetailsChooserAjax.jsp");
}

function deleteTableRow()
{
    try 
    {
    	var table = document.getElementById("customerdetails");
    	var rowCount = table.rows.length;

    	for(var i=4; i<rowCount; i++) 
    	{
        	table.deleteRow(i);
        	rowCount--;
         	i--;
    	}
    }
    catch(e)
    {
        alert(e);
    }
}
function reLoadPage()
{
	location.reload();
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
	 

<body>
<form name="customerchooser" method="post">
<table border="1" align="center" id="customerdetails">
<tr bgcolor=#888888>
	<th colspan="8" valign="top">Customer Details</th>
</tr>
<tr valign="top">
	<td colspan="8">
	<p id="instruction"><font color="red"><b>
	Search Either by State Or/And City Or/And BranchName 
	Branch Name Or/And Customer ID Or/And Account No. 
	</b></font>	</p>
	<p id="errormsg">
	</p>
	</td>
</tr>
<tr valign="top" align="center">
	<td colspan="8">
	<br><center>
	<select name="state" id="state" onchange='xmlhttpPostGetCity("GetCityFromStateAjax.jsp")'>
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
	<select name="city" id="city" onchange='xmlhttpPostGetBranch("GetBranchFromStateCityAjax.jsp")'>
	<option value="0">--Select City--</option>
	</select>
	<select name="branch" id="branch" onchange='xmlhttpPostGetCustomer("AdminCustomerDetailsChooserAjax.jsp")'>
	<option value="0">--Select Branch--</option>
	</select>
	<br><br>
	<input type="text" name="branchcode" id="branchcode" onkeyup='xmlhttpPostGetBranch("AdminCustomerDetailsChooserAjax.jsp")'>
	<input type="text" name="branchname" id="branchname" onkeyup='xmlhttpPostGetBranch("AdminCustomerDetailsChooserAjax.jsp")'>
	<input type="text" name="customerid" id="customerid" onkeyup='xmlhttpPostGetBranch("AdminCustomerDetailsChooserAjax.jsp")'>
	<input type="text" name="accountno" id="accountno" onkeyup='xmlhttpPostGetBranch("AdminCustomerDetailsChooserAjax.jsp")'>
	<br>
	<br>
	<center>
	<a onclick='xmlhttpPostGetCustomer("AdminCustomerDetailsChooserAjax.jsp")' style="border-style:outset;cursor:pointer;background-color:gray;">Search</a>
	<a onclick='functionReset()' style="border-style:outset;cursor:pointer;background-color:gray;">Reset</a>
	</center></center>
	<br>
	</td>
</tr>
<tr id="rowHeading" valign="top">
	
	<th>Select</th>
	<th>Customer ID</th>
	<th>Account No.</th>
	<th>Name (Gender)</th>
	<th>Contact Details</th>
	<th>Address</th>
	<th>Status</th>
	<th>Branch</th>
	
</tr>
</table>
</form>
</body>
</html>