<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Verify Applications</title>
<link rel="stylesheet" href="css/AdminTableStyle.css">
</head>
<body onload='xmlhttpPost("AdminVerifyApplicationsAjax.jsp")'>
<script type="text/javascript">
function openApplication(cid)
{
	document.getElementById("cidSession").value=cid;
	var branchWindow=window.open("AdminVerifyFormPart1.jsp","getBranchWindow","width=950,height=600");
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
	var status="verification pending";
	var word = status;
	qstr = 'w=' + escape(word); // NOTE: no '?' before querystring
	return qstr;
}

function updatepage(str)
{
	if(str=="x")
	{
		var errorElement=document.getElementById("errormsg");
		errorElement.innerHTML="No More Applications Are There With Pending Verification !";
		errorElement.style.color="blue";
	}
	else
	{
		var app = str.split("=");
		var l=app.length;
		var i;
		var c=0;
		deleteTableRow();
		var table = document.getElementById("applicationstatus");
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
	        cell6.innerHTML = details[4].toUpperCase();
	        
	        var cell7 = row.insertCell(6);
	        var element1 = document.createElement("input");
	        element1.setAttribute("type", "button");
	        element1.setAttribute("name", details[1]);
	        element1.setAttribute("value"," Show ");
	        element1.addEventListener("click",function open()
	        {
	        	alert("Open Application with CID: "+this.name);
	        	openApplication(this.name);
	        },false);
	        cell7.appendChild(element1);
	 	
	 	}
	}
}
function deleteTableRow()
{
    try 
    {
    	var table = document.getElementById("applicationstatus");
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
<form name="verifyapplications">
<center>
<table class="CSSTableAdmin" align="center" id="applicationstatus">
<tr>
	<th colspan="7">Verify Applications</th>
</tr>
<tr>
	<td colspan="7" style="text-align: center">
	<p id="instruction"><font color="red" ><b>
	Click On Show Button To Open The Corresponding Application. 
	</b></font>	</p>
	<p id="errormsg">
	</p>
	</td>
</tr>
<tr>
	<td colspan="7" style="text-align: center">
	<button id="getbranch" onclick='xmlhttpPost("AdminVerifyApplicationsAjax.jsp")'>Refresh</button>
	</td>
</tr>
<tr id="rowHeading" style="text-align: center">
	
	<th>Serial</th>
	<th>Application No.</th>
	<th>Customer ID</th>
	<th>Applicant's Email</th>
	<th>Branch Code</th>
	<th>Application Status</th>
	<th>Verify Application <input type="hidden" name="cidSession" id="cidSession" ></th>
</tr>
</table>
</center>
</form>
</body>
</html>