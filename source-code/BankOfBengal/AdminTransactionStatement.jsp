
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>All Transaction Details</title>
<link rel="stylesheet" href="css/CustomerInputStyle.css">
 <link rel="stylesheet" href="css/CustomerFormDetailsStyle.css">
  <link rel="stylesheet" href="css/ButtonStyleCSS.css">
</head>
<body onload='xmlhttpPost("AdminTransactionStatementAjax.jsp")'>
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
	var username="username";
	var word = username;
	qstr = 'w=' + escape(word); // NOTE: no '?' before querystring
	return qstr;
}

function updatepage(str)
{
		
		var app = str.split("=");
		var l=app.length;
		var max=3;
		var i;
		var c=0;
		deleteTableRow();
		var table = document.getElementById("transactionDetailsTable");
		for(i=0;i<l-1;i++)
		{
			var details=app[i].split("|");
			
			rowCount = table.rows.length;
		    row = table.insertRow(rowCount);
		
		    var cell1 = row.insertCell(0);
	        cell1.innerHTML=++c;
	        
		    var cell2 = row.insertCell(1);
	        cell2.innerHTML=details[0];
	        
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
	         
	}
}
function deleteTableRow()
{
    try 
    {
    	var table = document.getElementById("transactionDetailsTable");
    	var rowCount = table.rows.length;

    	for(var i=2; i<rowCount; i++) 
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
<section >
    <div>
<form name="transactiondetails">
<center>
<table class="CSSFormCustomer" align="center" id="transactionDetailsTable" width="1000">
<tr>
	<th colspan="7" style="text-decoration: underline; height: 50px">All Transaction Details
	</th>
</tr>
<tr id="rowHeading" valign="top">
	
	<th>Serial</th>
	<th>Transaction ID</th>
	<th>Transaction Amount</th>
	<th>Transaction Type</th>
	<th>Balance</th>
	<th>Time Stamp</th>
	<th>Details</th>
</tr>
</table>
</center>
</form>
</div>
</section>
</body>
</html>
