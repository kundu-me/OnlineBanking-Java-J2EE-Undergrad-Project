<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Latest News</title>
<link rel="stylesheet" href="css/CustomerOnlyInputStyle.css">
<link rel="stylesheet" href="css/CustomerFormStyle.css">
<link rel="stylesheet" href="css/CloseButtonStyleCSS.css">
</head>
<body onload='xmlhttpPost("AdminViewLatestNewsAjax.jsp")'>
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
	if(str=="x")
	{
		var errorElement=document.getElementById("errormsg");
		errorElement.innerHTML="No More News Are There !";
		errorElement.style.color="blue";
	}
	else
	{
		var news1 = str.split("=");
		var l=news1.length;
		var i;
		var c=0;
		deleteTableRow();
		var table = document.getElementById("news");
		for(i=0;i<l-1;i++)
		{
			var details=news1[i].split("|");
			rowCount = table.rows.length;
		    row = table.insertRow(rowCount);
		
		    var cell1 = row.insertCell(0);
	        cell1.innerHTML=++c;
	        
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
    	var table = document.getElementById("news");
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

function closeTheWindow() 
{
	window.open('', '_self', ''); 
	window.close(); 		
}
function changeMousePointer(elementID) 
{
	document.getElementById(elementID).style.cursor = "pointer";
}
</script>

<form name="latestnews">
<center>
<table class="CSSFormCustomer" align="center" id="news">
<tr>
	<th colspan="3">View Latest News</th>
</tr>
<tr id="rowHeading" valign="top">
	
	<th>Serial</th>
	<th>News Heading</th>
	<th>News Details</th>
</tr>
</table>
<br>
<br>
<button type="button" class="CloseButtons" onclick="closeTheWindow()" id="closeWindow" onmouseover="changeMousePointer(this.id)">Close</button>
</center>
</form>
</body>
</html>
