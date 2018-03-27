<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Login Details</title>
<link rel="stylesheet" href="css/CustomerInputStyle.css">
 <link rel="stylesheet" href="css/CustomerFormDetailsStyle.css">
  <link rel="stylesheet" href="css/ButtonStyleCSS.css">
<link href="css/CloseButtonStyleCSS.css" rel="stylesheet" type="text/css" />
<style TYPE="text/css"><!--
    A:link {text-decoration: none; color: #ffffff}
    a:visited {text-decoration: none; color: #fffff}
    a:active {text-decoration: none; color: #ffffff}
    a:hover{color: #ffffff}
--></style>
</head>
<body onload='xmlhttpPost("CustomerLoginDetailsAjax.jsp")'>
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
		var max=5;
		var i;
		var c=0;
		deleteTableRow();
		var table = document.getElementById("loginDetailsTable");
		for(i=l-2;i>0;i--)
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
	        
	        if(c==max)
	        {
	        	break;
	        }
	      
	}
}
function deleteTableRow()
{
    try 
    {
    	var table = document.getElementById("loginDetailsTable");
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
<form name="logindetails">
<center>
<table class="CSSFormCustomer" align="center" id="loginDetailsTable">
<tr>
	<th colspan="3" style="text-decoration: underline;height: 50px ">Login Details
	<input type="hidden" id="username" name="username" value=<%=(String)session.getAttribute("usernameSession") %>>
	</th>
</tr>
<tr id="rowHeading" valign="top">
	
	<th>Serial</th>
	<th>Login TimeStamp</th>
	<th>Login IP</th>
</tr>
</table>
 <p class="submit"><a class="CloseButtons" href="CustomerWelcome.jsp" style="font-family: Gregoria; color: white;">Close</a></p>
</center>
</form>
</div>
</section>
</body>
</html>
