<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Verify Account Close</title>
<link rel="stylesheet" href="css/AdminTableStyle.css">
</head>
<body onload='xmlhttpPost("AdminVerifyAccountCloseAjax.jsp")'>
<script type="text/javascript">

function ifCloseEnable(acc)
{
	var name1="FDV"+acc;
	var name2="FDM"+acc;
	var name3="MT"+acc;
	var name4="C"+acc
	var x1=document.getElementById(name1).disabled;
	var x2=document.getElementById(name2).disabled;
	var x3=document.getElementById(name3).disabled;
	if(x1==true && x2==true && x3==true)
	{
		document.getElementById(name4).disabled=false;
	}
}
function openVerifyWindow(val)
{
	var details=val.split("|");
	document.getElementById("cidSession").value=details[1];
	document.getElementById("accountnoSession").value=details[0];
	var branchWindow=window.open("AdminVerifyAccountCloseWindow.jsp","getBranchWindow","width=750,height=600");
}
function openFDVWindow(acc)
{
	document.getElementById("closingaccountno").value=acc;
	var name="FDV"+acc;
	document.getElementById(name).disabled=true;
	
	ifCloseEnable(acc);
	
	var branchWindow=window.open("AdminVerifyFDBeforeAccountClose.jsp");
}
function openFDMWindow(acc)
{
	document.getElementById("closingaccountno").value=acc;
	var name="FDM"+acc;
	document.getElementById(name).disabled=true;

	ifCloseEnable(acc);
	
	var branchWindow=window.open("AdminMatureFDBeforeAccountClose.jsp");
}
function openMTWindow(acc)
{
	document.getElementById("closingaccountno").value=acc;
	var name="MT"+acc;
	document.getElementById(name).disabled=true;

	ifCloseEnable(acc);
	
	var branchWindow=window.open("AdminVerifyMoneyTransferBeforeAccountClose.jsp");
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
	var status="closing";
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
		errorElement.innerHTML="No More Account Close Are There With Pending Verification !";
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
	        
	        var val="FDV"+details[0];
	        var cell6 = row.insertCell(5);
	        var element1 = document.createElement("input");
	        element1.setAttribute("type", "button");
	        element1.setAttribute("name", details[0]);
	        element1.setAttribute("id", val);
	        element1.setAttribute("value"," Reject e-FD Application ");
	        element1.addEventListener("click",function open()
	        {
	        	alert("Open Window with Account No: "+this.name);
	        	openFDVWindow(this.name);
	        },false);
	        cell6.appendChild(element1);
	     
	        val="FDM"+details[0];
	        var cell7 = row.insertCell(6);
	        element1 = document.createElement("input");
	        element1.setAttribute("type", "button");
	        element1.setAttribute("name", details[0]);
	        element1.setAttribute("id", val);
	        element1.setAttribute("value"," Mature Pending e-FD ");
	        element1.addEventListener("click",function open()
	        {
	        	alert("Open Window with Account No: "+this.name);
	        	openFDMWindow(this.name);
	        },false);
	        cell7.appendChild(element1);
	     
	        val="MT"+details[0];
	        var cell8 = row.insertCell(7);
	        element1 = document.createElement("input");
	        element1.setAttribute("type", "button");
	        element1.setAttribute("name", details[0]);
	        element1.setAttribute("id", val);
	        element1.setAttribute("value"," Verify Pending Transaction ");
	        element1.addEventListener("click",function open()
	        {
	        	alert("Open Window with Account No: "+this.name);
	        	openMTWindow(this.name);
	        },false);
	        cell8.appendChild(element1);
	     
	        var values=details[0]+"|"+details[1];
	        val="C"+details[0];
	        var cell9 = row.insertCell(8);
	        element1 = document.createElement("input");
	        element1.setAttribute("type", "button");
	        element1.setAttribute("name", details[0]);
	        element1.setAttribute("id", val);
	        element1.setAttribute("value"," Close Account ");
	        element1.addEventListener("click",function open()
	        {
	        	alert("Open Window with Account No: "+this.name);
	        	openVerifyWindow(values);
	        },false);
	        cell9.appendChild(element1);
	        
	        var cbID="C"+details[0];
	        document.getElementById(cbID).disabled=true;
	 	
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
<form name="verifyaccount">
<center>
<table class="CSSTableAdmin" align="center" id="transactionstatus">
<tr>
	<th colspan="9">Verify Customer Account Close Request</th>
</tr>
<tr>
	<td colspan="9" style="text-align: center">
	<p id="instruction"><font color="red"><b>
	Click On Show Button To Open The Corresponding Window. 
	</b></font>	</p>
	<p id="errormsg">
	</p>
	</td>
</tr>
<tr>
	<td colspan="9" align="center" style="text-align: center">
	<button type="button" id="refresh" onclick='xmlhttpPost("AdminVerifyAccountCloseAjax.jsp")'>Refresh</button>
	</td>
</tr>
<tr id="rowHeading" valign="top">
	
	<th>Serial</th>
	<th>Account No.</th>
	<th>Customer ID</th>
	<th>Email</th>
	<th>Branch Code</th>
	<th>e-FD Application</th>
	<th>e-FD Maturity</th>
	<th>Money Transfer</th>
	<th>Close Account
	<input type="hidden" name="cidSession" id="cidSession">
	<input type="hidden" name="accountnoSession" id="accountnoSession">
	<input type="hidden" name="closingaccountno" id="closingaccountno">	
	</th>
</tr>
</table>
</center>
</form>
</div>
</section>
</body>
</html>