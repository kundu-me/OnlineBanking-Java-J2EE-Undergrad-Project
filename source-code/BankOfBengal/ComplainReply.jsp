<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View And Reply To Customer Complain</title>
<link rel="stylesheet" href="css/AdminTableStyle.css">
</head>
<body onload='xmlhttpPost("ComplainReplyAjax.jsp")'>
<script type="text/javascript">
function replyWindow(val)
{
	var d=val.split(",");
	document.getElementById("serialSession").value=d[0];
	document.getElementById("emailSession").value=d[1];
	document.getElementById("subjectSession").value=d[2];
	document.getElementById("detailsSession").value=d[3];
	var replyWindow=window.open("ComplainReplyWindow.jsp","getBranchWindow","width=650,height=650");
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
		errorElement.innerHTML="No More Complains Are There !";
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
	        cell4.innerHTML = details[3];

	        var cell5 = row.insertCell(4);
	        
	        var elementValue=details[0]+","+details[1]+","+details[2]+","+details[3];
	        
	        var element1 = document.createElement("input");
	        element1.setAttribute("type", "button");
	        element1.setAttribute("name", elementValue);
	        element1.setAttribute("value"," Reply ");
	        element1.addEventListener("click",function open()
	        {
	        	alert("Do You Want To Reply The Complain ??");
	        	replyWindow(this.name);
	        },false);
	        cell5.appendChild(element1);	 	
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

<form name="complain">
<center>
<table class="CSSTableAdmin" align="center" id="news">
<tr>
	<th colspan="4">View And Reply Customer Complain</th>
</tr>
<tr>
	<td colspan="5" style="text-align: center">
	<p id="instruction"><font color="red"><b>
	Click On Reply Button To Reply To The Corresponding Complain. 
	</b></font>	</p>
	<p id="errormsg">
	</p>
	</td>
</tr>
<tr>
	<td colspan="5" align="center" style="text-align: center">
	<button type="button" id="getbranch" onclick='xmlhttpPost("ComplainReplyAjax.jsp")'>Refresh</button>
	</td>
</tr>
<tr id="rowHeading" valign="top">
	
	<th>Serial</th>
	<th>Customer Email</th>
	<th>Subject</th>
	<th>Details</th>
	<th>Reply
	<input type="hidden" name="serialSession" id="serialSession">
	<input type="hidden" name="emailSession" id="emailSession">
	<input type="hidden" name="subjectSession" id="subjectSession">
	<input type="hidden" name="detailsSession" id="detailsSession">
	</th>
</tr>
</table>
</center>
</form>
</body>
</html>
