<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View And Delete Latest News</title>
<link rel="stylesheet" href="css/AdminTableStyle.css">
</head>
<body onload='xmlhttpPost("AdminViewLatestNewsAjax.jsp")'>
<script type="text/javascript">
function deleteNews(serial)
{
	document.getElementById("serialSession").value=serial;
	xmlhttpPostDelete("AdminDeleteLatestNewsAjax.jsp");
}

function xmlhttpPostDelete(strURL)
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
				updatepageDelete(self.xmlHttpReq.responseText);
			}
		};
		self.xmlHttpReq.send(getquerystringDelete());
	
}

function getquerystringDelete()
{
	var serial=document.getElementById("serialSession").value;
	var word = serial;
	qstr = 'w=' + escape(word); // NOTE: no '?' before querystring
	return qstr;
}

function updatepageDelete(str)
{
	xmlhttpPost("AdminViewLatestNewsAjax.jsp");
}

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

	        var cell4 = row.insertCell(3);
	        var element1 = document.createElement("input");
	        element1.setAttribute("type", "button");
	        element1.setAttribute("name", details[0]);
	        element1.setAttribute("value"," Delete ");
	        element1.addEventListener("click",function open()
	        {
	        	alert("Do You Want To Delete The News ??");
	        	deleteNews(this.name);
	        },false);
	        cell4.appendChild(element1);	 	
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

</script>

<form name="latestnews">
<center>
<table class="CSSTableAdmin" align="center" id="news">
<tr>
	<th colspan="4">View And Delete Latest News</th>
</tr>
<tr>
	<td colspan="4" style="text-align: center">
	<p id="instruction"><font color="red"><b>
	Click On Delete Button To delete The Corresponding News. 
	</b></font>	</p>
	<p id="errormsg">
	</p>
	</td>
</tr>
<tr>
	<td colspan="4" align="center" style="text-align: center">
	<button type="button" id="getbranch" onclick='xmlhttpPost("AdminViewLatestNewsAjax.jsp")'>Refresh</button>
	</td>
</tr>
<tr id="rowHeading" valign="top">
	
	<th>Serial</th>
	<th>News Heading</th>
	<th>News Details</th>
	<th>Delete News <input type="hidden" name="serialSession" id="serialSession"></th>
</tr>
</table>
</center>
</form>
</body>
</html>
