<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Branch Chooser</title>
<link rel="stylesheet" href="css/CustomerOnlyInputStyle.css">
<link rel="stylesheet" href="css/CustomerFormStyle.css">
<script>
function xmlhttpPost(strURL)
{
	var k=document.getElementById("state");
	var k1=k.options[k.selectedIndex].text;
	var removeXElement=document.getElementById("city");
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
		xmlhttpPostGetBranch("BranchChooserAjax.jsp");
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
	var k=document.getElementById("state");
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
	var selectElement=document.branchchooser.city;
	for (n=0; n<l-1; n++)
	{
		selectElement.options[selectElement.options.length]=new Option(cityString[n],cityString[n]);
	}
	xmlhttpPostGetBranch("BranchChooserAjax.jsp");
}

function xmlhttpPostGetBranch(strURL)
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
			updatepageGetBranch(self.xmlHttpReq.responseText);
		}
	};
	self.xmlHttpReq.send(getquerystringGetBranch());
}

function getquerystringGetBranch()
{
	var state1=document.getElementById("state");
	var state=state1.options[state1.selectedIndex].text;
	var city1=document.getElementById("city");
	var city=city1.options[city1.selectedIndex].text;
	
	var pincode=document.forms["branchchooser"]["pincode"].value;
	var branchcode=document.forms["branchchooser"]["branchcode"].value;
	
	if(state=="--Select State--")
	{
		state="x";
	}
	if(city=="--Select City--")
	{
		city="x";
	}
	if(pincode==null || pincode=="")
	{
		pincode="x";
	}
	if(branchcode==null || branchcode=="")
	{
		branchcode="x";
	}
	
	var word = state+","+city+","+pincode+","+branchcode;
	qstr = 'w=' + escape(word); // NOTE: no '?' before querystring
	return qstr;
	
}
 function functionReset()
 {
	 document.getElementById("state").selectedIndex=0;
	 document.getElementById("city").selectedIndex=0;
	 document.forms["branchchooser"]["pincode"].value="";
	 document.forms["branchchooser"]["branchcode"].value="";
	 xmlhttpPostGetBranch("BranchChooserAjax.jsp");
 }

function updatepageGetBranch(str)
{
	
	var branch = str.split("|");
	var l1=branch.length;
	var n=0;
	var details;
	deleteTableRow();
	var table = document.getElementById("branchdetails");
	var rowCount,row;
	for (n=0; n<l1-1; n++)
	{
		
		rowCount = table.rows.length;
	    row = table.insertRow(rowCount);
	
	    details=branch[n].split(",");
	    
	    var cell1 = row.insertCell(0);
        var element1 = document.createElement("input");
        element1.setAttribute("type", "checkbox");
        element1.setAttribute("value", details[0]);
        element1.setAttribute("name", "code");
        element1.setAttribute("class", "GetCode");
        element1.addEventListener ("click",submitForm,false);
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
        
        var combinedValue=details[1]+"|"+details[5]+", \nState: "+details[2]+", City:"+details[3]+", \nPincode: "+details[4]+".";
     	if(document.getElementById(details[0])==null)
     	{
        	var element1 = document.createElement("input");
            element1.setAttribute("type", "hidden");
        	element1.setAttribute("value",combinedValue);
        	element1.setAttribute("id", details[0]);
        	cell7.appendChild(element1);
        	
     	}
        
         
     }
}

function deleteTableRow()
{
    try 
    {
    	var table = document.getElementById("branchdetails");
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

function submitForm()
{
	var code="code";
	var name="name";
	var address="address";
	var checkedValue = null; 
	var inputElements = document.getElementsByTagName('input');
	for(var i=0; inputElements[i]; ++i){
	      if(inputElements[i].className==="GetCode" && 
	         inputElements[i].checked){
	           checkedValue = inputElements[i].value;
	           break;
	      }
	}
	code=checkedValue;
	var stringValue=document.getElementById(code).value;
	value=stringValue.split("|");
	name=value[0];
	address=value[1];
	var confirmString="Branch Code: "+code+" And Branch Name: "+name;
	var confirmValue=confirm(confirmString);
	if (confirmValue==true)
	{
		window.opener.document.form1.branchcode.value=code;
		window.opener.document.form1.branchname.value=name;
		window.opener.document.form1.branchaddress.value=address;
		window.open('', '_self', ''); 
		window.close(); 
	}
	else
	{
		functionReset();
	}
	
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
	 

<body onload='xmlhttpPostGetBranch("BranchChooserAjax.jsp")'>
<form name="branchchooser" method="post" action="OnlineAccOpenFormPart1.jsp">
<table class="CSSFormCustomer" align="center" id="branchdetails">
<tr>
	<th colspan="7" valign="top">Branch Details</th>
</tr>
<tr valign="top">
	<td colspan="7">
	<p id="instruction"><font color="red"><b>
	Refine Your Search Either by Selecting State Or/And City Or/And City Or/And PinCode Or/And BranchCode 
	</b></font>	</p>
	<p id="errormsg">
	</p>
	</td>
</tr>
<tr valign="top">
	<td colspan="7">
	<br><center>
	<select name="state" id="state" onchange='xmlhttpPost("GetCityFromStateAjax.jsp")'>
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
	<select name="city" id="city" onchange='xmlhttpPostGetBranch("BranchChooserAjax.jsp")'>
	<option value="0">--Select City--</option>
	</select>
	<input type="text" name="pincode" id="pincode" onkeyup='xmlhttpPostGetBranch("BranchChooserAjax.jsp")' placeholder="PinCode">
	<input type="text" name="branchcode" id="branchcode" onkeyup='xmlhttpPostGetBranch("BranchChooserAjax.jsp")' placeholder="BranchCode">
	<br>
	<br>
	<center>
	<button type="button" onclick='xmlhttpPostGetBranch("BranchChooserAjax.jsp")'>Search</button>
	<button type="button" onclick='functionReset()'>Reset</button>
	</center></center>
	<br>
	</td>
</tr>
<tr id="rowHeading" valign="top">
	
	<th>Select</th>
	<th>Branch Code</th>
	<th>Branch Name</th>
	<th>Branch State</th>
	<th>Branch City</th>
	<th>Branch PinCode</th>
	<th>Branch Address</th>
	
</tr>
</table>
</form>
</body>
</html>