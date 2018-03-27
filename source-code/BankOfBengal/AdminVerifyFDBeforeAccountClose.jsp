<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Verify Fixed Deposit</title>
<link rel="stylesheet" href="css/AdminTableStyle.css">
</head>
<body onload='loadFunctions()'>
<script type="text/javascript">
function loadFunctions()
{
	document.getElementById("accountno").value=window.opener.document.getElementById("closingaccountno").value.trim();
	xmlhttpPost("AdminVerifyFDBeforeAccountCloseAjax.jsp");	
}
function openTransferWindow(tid)
{
	document.getElementById("tidSession").value=tid;
	var branchWindow=window.open("AdminVerifyFDWindow.jsp","getBranchWindow","width=950,height=600");
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
	var accountno=document.getElementById("accountno").value;
	var status="verification pending"+","+accountno;
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
		errorElement.innerHTML="No More Transfers Are There With Pending Verification !";
		errorElement.style.color="blue";
	}
	else
	{
		var app = str.split("=");
		var l=app.length;
		var i;
		var c=0;
		deleteTableRow();
		var table = document.getElementById("transactionstatus");
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
	        
	        var cell8 = row.insertCell(7);
	        var element1 = document.createElement("input");
	        element1.setAttribute("type", "button");
	        element1.setAttribute("name", details[0]);
	        element1.setAttribute("value"," Show ");
	        element1.addEventListener("click",function open()
	        {
	        	alert("Open Window with TID: "+this.name);
	        	openTransferWindow(this.name);
	        },false);
	        cell8.appendChild(element1);
	 	
	 	}
	}
}
function deleteTableRow()
{
    try 
    {
    	var table = document.getElementById("transactionstatus");
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
<section >
    <div>
<form name="verifymoneytransfer">
<center>
<table class="CSSTableAdmin" align="center" id="transactionstatus">
<tr>
	<th colspan="8">Verify e-Fixed Deposit</th>
</tr>
<tr>
	<td colspan="8" style="text-align: center">
	<p id="instruction"><font color="red"><b>
	Click On Show Button To Open The Corresponding Window. 
	</b></font>	</p>
	<p id="errormsg">
	</p>
	</td>
</tr>
<tr>
	<td colspan="8" align="center" style="text-align: center">
	<button type="button" id="refresh" onclick='xmlhttpPost("AdminVerifyFDBeforeAccountCloseAjax.jsp")'>Refresh</button>
	</td>
</tr>
<tr id="rowHeading" valign="top">
	
	<th>Serial</th>
	<th>Transaction ID</th>
	<th>e-FD ID</th>
	<th>Account No.<input type="hidden" name="accountno" id="accountno"></th>
	<th>e-FD Amount</th>
	<th>Branch Code</th>
	<th>Transaction Time</th>
	<th>Verify e-FD<input type="hidden" name="tidSession" id="tidSession"></th>
</tr>
</table>
</center>
</form>
</div>
</section>
</body>
</html>