<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Fixed Deposit||Bank Of Bengal</title>
<link rel="stylesheet" href="css/CustomerInputStyle.css">
 <link rel="stylesheet" href="css/CustomerFormStyle.css">
  <link rel="stylesheet" href="css/CloseButtonStyleCSS.css">
</head>
<body onload='xmlhttpPost("OnlineFDPart1Ajax.jsp")'>
<script type="text/javascript">
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
	var status="true";
	var word = status;
	qstr = 'w=' + escape(word); // NOTE: no '?' before querystring
	return qstr;
}

function updatepage(str)
{
	var str1="x";
	if(str==str1)
	{
		var errorElement=document.getElementById("errormsg");
		errorElement.innerHTML="No Fixed Deposit Scheme Available Now !!!";
		errorElement.style.color="blue";
	}
	else
	{
		var app = str.split("=");
		var l=app.length;
		var i;
		var c=0;
		var table = document.getElementById("fdScheme");
		for(i=0;i<l-1;i++)
		{
			var details=app[i].split("|");
			
			rowCount = table.rows.length;
		    row = table.insertRow(rowCount);
		
		    var cell1 = row.insertCell(0);
	        cell1.innerHTML=details[0];
	        
		    var cell2 = row.insertCell(1);
	        cell2.innerHTML=details[1];
	        
	       	var cell3 = row.insertCell(2);
	        cell3.innerHTML = details[2];
	       	
	 	}
	}
}
function deleteTableRow()
{
    try 
    {
    	var table = document.getElementById("fdScheme");
    	var rowCount = table.rows.length;

    	for(var i=1; i<rowCount; i++) 
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
</script>
<form name="schemeChooser" method="post">
<center>
<table class="CSSFormCustomer" align="center" id="fdScheme">
<tr bgcolor=#888888>
	<th colspan="3" valign="top">FD Scheme Details</th>
</tr>
<tr id="rowHeading" valign="top">
	
	<th>Tenor</th>
	<th>Interest Rates</th>
	<th>PreMature Penalty</th>
</tr>
</table>
</center>
<center>
<a class="CloseButtons" href="CustomerAccountSelectFD.jsp">Proceed</a>
</center>
</form>
</body>
</html>