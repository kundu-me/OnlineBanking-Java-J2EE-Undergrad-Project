<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Form Part2</title>
<link rel="stylesheet" href="css/AdminTableStyle.css">
</head>
<body onload="loadF()">
<script>
function loadF()
{
	xmlhttpPost("AdminEditFormPart2Ajax.jsp");	
}
function showForm60()
{
	var CityWindow=window.open("AdminViewForm60Window.jsp","getBranchWindow","width=800,height=550");
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
	var k=document.getElementById("cid").value;
	var word = k;
	qstr = 'w=' + escape(word); // NOTE: no '?' before querystring
	return qstr;
}

function updatepage(str)
{
	alert(str);
	str1="error";
	if(str!=str1)
	{
		var x = str.split("|");
		
		document.getElementById("applicationno").value=x[0];
		document.getElementById("cid").value=x[1];
		
		if(x[2]!="0")
		document.getElementById("religion1").value=x[2];
		
		if(x[3]!="0")
		document.getElementById("category1").value=x[3];
		
		document.getElementById("education").value=x[4];
		document.getElementById("occupation").value=x[5];
		document.getElementById("organization").value=x[6];
		document.getElementById("designation").value=x[7];
		document.getElementById("income").value=x[8];
		document.getElementById("term").value=x[9];
		document.getElementById("assetvalue").value=x[10];
		
		var v=x[11].split(",");
		var vElement=document.forms["form2"]["vehicle1"];
		if(v[0]=="two wheeler" || v[1]=="two wheeler" || v[2]=="two wheeler")
		{
			vElement[0].checked=true;
		}
		if(v[0]=="four wheeler" || v[1]=="four wheeler" || v[2]=="four wheeler")
		{
			vElement[1].checked=true;
		}
		if(v[0]=="others" || v[1]=="others" || v[2]=="others")
		{
			vElement[2].checked=true;
		}
			
		document.getElementById("lifeinsurancevalue").value=x[12];
		
		if(x[13]!="n/a")
		{
			var l=x[13].split(",");
			var lElement=document.forms["form2"]["lifeinsurance1"];
			if(l[0]=="BOB LifeInsurance" || l[1]=="BOB LifeInsurance")
			{
				lElement[0].checked=true;
			}
			if(l[0]=="Others" || l[1]=="Others")
			{
				lElement[1].checked=true;
			}
		}
		
		if(x[14]!="n/a")
		{
			var lo=x[14].split(",");
			var loElement=document.forms["form2"]["loan1"];
			var i;
			for(i=0;i<5;i++)
			{
				if(lo[i]=="Car Loan")
				{
					loElement[0].checked=true;
				}
				if(lo[i]=="Home Loan")
				{
					loElement[1].checked=true;
				}
				if(lo[i]=="Personal Loan")
				{
					loElement[2].checked=true;
				}
				if(lo[i]=="Education Loan")
				{
					loElement[3].checked=true;
				}
				if(lo[i]=="Business Loan")
				{
					loElement[4].checked=true;
				}
			}
		}		
		
		var element=x[15];
		document.getElementById(element).checked=true;
		
		var m=x[16].split(",");
		var mElement=document.forms["form2"]["mutualfund1"];
		var i;
		for(i=0;i<3;i++)
		{
			if(m[i]=="BOB Mutual Fund")
			{
				mElement[0].checked=true;
			}
			if(m[i]=="Others")
			{
				mElement[1].checked=true;
			}
			if(m[i]=="No Investment")
			{
				mElement[2].checked=true;
			}
		}		
		
		if(x[17]!="n/a")
		{
			var c=x[17].split(",");
			var cElement=document.forms["form2"]["creditcard1"];
			var i;
			for(i=0;i<2;i++)
			{
				if(c[i]=="BOB Card")
				{
					cElement[0].checked=true;
				}
				if(c[i]=="Others")
				{
					cElement[1].checked=true;
				}
			}
		}
		document.getElementById("it").value=x[18];
		if(x[18]=="pan")
		{
			document.getElementById("itLabel").value="I.T. PAN No.";
		}
		else
		{
			document.getElementById("itLabel").value="Form 60 Application No.";
		}
		document.getElementById("itno").value=x[19];
				
	}

}

function form2Validation()
{
	var errorElement=document.getElementById("errormsg");
	var errorMessage=" **Error : ";
	
	var a=document.getElementById("education");
	var a1=a.options[a.selectedIndex].text;
	if(a1=="--Select--")
		{
		alert("Select Your Educational Qualification !");
		var text="Select Your Educational Qualification";
		var error=errorMessage+text;
		errorElement.innerHTML=error;
		errorElement.style.color="red";
		document.getElementById("education").focus();
		return false;	
		}
	var b=document.getElementById("occupation");
	var b1=b.options[b.selectedIndex].text;
	if(b1=="--Select--")
		{
		alert("Select Your Occupation Type !");
		var text="Select Your Occupation Type";
		var error=errorMessage+text;
		errorElement.innerHTML=error;
		errorElement.style.color="red";
		document.getElementById("occupation").focus();
		return false;	
		}
	var c=document.getElementById("income");
	var c1=c.options[c.selectedIndex].text;
	if(c1=="--Select--")
		{
		alert("Select Your Income !");
		var text="Select Your Income";
		var error=errorMessage+text;
		errorElement.innerHTML=error;
		errorElement.style.color="red";
		document.getElementById("income").focus();
		return false;	
		}
	var avalue=document.getElementById("assetvalue").value;
	if(avalue!="" && isNaN(avalue)==true)
	{
		alert("Enter Your Asset Value Only in Numbers !");
		var text="Enter Your Asset Value Only in Numbers";
		var error=errorMessage+text;
		errorElement.innerHTML=error;
		errorElement.style.color="red";
		document.getElementById("assetvalue").focus();
		return false;
	}
	var lvalue=document.getElementById("lifeinsurancevalue").value;
	if(lvalue!="" && isNaN(lvalue)==true)
	{
		alert("Enter Your LifeInsurance Value Only in Numbers !");
		var text="Enter Your LifeInsurance Value Only in Numbers";
		var error=errorMessage+text;
		errorElement.innerHTML=error;
		errorElement.style.color="red";
		document.getElementById("lifeinsurancevalue").focus();
		
		return false;
	}
	
	var c=document.getElementById("religion1");
	var religion=c.options[c.selectedIndex].text;
	if(religion=="0")
	{
		document.getElementById("religion").value="others";
	}
	else
	{
		document.getElementById("religion").value=religion;
	}
	var c=document.getElementById("category1");
	var category=c.options[c.selectedIndex].text;
	if(category=="0")
	{
		document.getElementById("category").value="others";
	}
	else
	{
		document.getElementById("category").value=category;
	}
	
	var organization=document.getElementById("organization").value;
	if(organization==null || organization=="")
	{
		document.getElementById("organization").value="n/a";
	}
	var designation=document.getElementById("designation").value;
	if(designation==null || designation=="")
	{
		document.getElementById("designation").value="n/a";
	}
	
	var assetvalue=document.getElementById("assetvalue").value;
	if(assetvalue==null || assetvalue=="")
	{
		document.getElementById("assetvalue").value="0";
	}
	
	var lifeinsurancevalue=document.getElementById("lifeinsurancevalue").value;
	if(lifeinsurancevalue==null || lifeinsurancevalue=="")
	{
		document.getElementById("lifeinsurancevalue").value="0";
	}
	
	var vehicle=document.forms["form2"]["vehicle1"];
	var txt="";
	var i=0;
	for (i=0;i<vehicle.length;i++)
	  {
	  if (vehicle[i].checked)
	    {
	    txt = txt + vehicle[i].value + ",";
	    }
	  }
	if(txt=="")
	{
		document.getElementById("vehicle").value="n/a";
	}
	else
	{
		document.getElementById("vehicle").value=txt;
	}
	var lifeinsurance=document.forms["form2"]["lifeinsurance1"];
	var txt="";
	var i=0;
	for (i=0;i<lifeinsurance.length;i++)
	  {
	  if (lifeinsurance[i].checked)
	    {
	    txt = txt + lifeinsurance[i].value + ",";
	    }
	  }
	if(txt=="")
	{
		document.getElementById("lifeinsurance").value="n/a";
	}
	else
	{
		document.getElementById("lifeinsurance").value=txt;
	}
	var loan=document.forms["form2"]["loan1"];
	var txt="";
	var i=0;
	for (i=0;i<loan.length;i++)
	  {
	  if (loan[i].checked)
	    {
	    txt = txt + loan[i].value + ",";
	    }
	  }
	if(txt=="")
	{
		document.getElementById("loan").value="n/a";
	}
	else
	{
		document.getElementById("loan").value=txt;
	}
	var mutualfund=document.forms["form2"]["mutualfund1"];
	var txt="";
	var i=0;
	for (i=0;i<mutualfund.length;i++)
	  {
	  if (mutualfund[i].checked)
	    {
	    txt = txt + mutualfund[i].value + ",";
	    }
	  }
	if(txt=="")
	{
		document.getElementById("mutualfund").value="No Investment";
	}
	else
	{
		document.getElementById("mutualfund").value=txt;
	}
	var creditcard=document.forms["form2"]["creditcard1"];
	var txt="";
	var i=0;
	for (i=0;i<creditcard.length;i++)
	  {
	  if (creditcard[i].checked)
	    {
	    txt = txt + creditcard[i].value + ",";
	    }
	  }
	if(txt=="")
	{
		document.getElementById("creditcard").value="n/a";
	}
	else
	{
		document.getElementById("creditcard").value=txt;
	}
	
	//Confirm
	confirm();
}
function confirm()
{
	var cell1=document.getElementById("proceedandsubmit");
	
	var x=document.getElementById("proceed");
    cell1.removeChild(x);
    
    var element1 = document.createElement("input");
    element1.setAttribute("type", "Submit");
    element1.setAttribute("value", "Update And Proceed");
    element1.setAttribute("name", "Submit");
    cell1.appendChild(element1);
}
</script>

<form name="form2" method="post" action="AdminEditForm2Servlet">
<center>
<table class="CSSFormAdmin" border="1" align="center">
<tr>
	<th colspan="4">Edit Additional Details</th>
</tr>
<tr>
	<td colspan="4" >
	<p id="instruction"><font color="red"><b>
	Do not Press F5 or Refresh while Editing this form
	</b></font>	</p>
	<p id="errormsg">
	</p>
	</td>
</tr>
<tr bgcolor=#d8d8d8>
	<td>
	Application No. 
	</td>
	<td>
	<input type="text" name="applicationno" id="applicationno" readonly="readonly" >
	</td>
	<td>
	Customer ID
	</td>
	<td>
	<input type="text" name="cid" id="cid" value=<%=(String)session.getAttribute("editCIDSession")%>>
	</td>
</tr>

<tr bgcolor=#ffffff>
	<td>
	Religion
	</td>
	<td>
	<select name="religion" id="religion1">
	<option value="0">--Select--</option>
	<option value="hindu">Hindu</option>
	<option value="muslim">Muslim</option>
	<option value="christian">Christian</option>
	<option value="sikh">Sikh</option>
	<option value="others">Others</option> 
	</select>
	<input type="hidden" name="religion" id="religion">
	</td>
	<td>
	Educational Qualification*
	</td>
	<td>
	<select name="education" id="education">
	<option value="0">--Select--</option>
	<option value="non graduate">Non Graduate</option>
	<option value="graduate">Graduate</option>
	<option value="post gratuate">Post Graduate</option>
	<option value="others">Others</option>
	</select>
</tr>
<tr bgcolor=#d8d8d8>
	<td>
	Category
	</td>
	<td>
	<select name="category" id="category1">
	<option value="0">--Select--</option>
	<option value="general">General</option>
	<option value="obc">OBC</option>
	<option value="sc">SC</option>
	<option value="st">ST</option>
	<option value="others">Others</option>
	</select>
	<input type="hidden" name="category" id="category">
	</td>
	<td>
	Occupation Type*
	</td>
	<td>
	<select name="occupation" id="occupation">
	<option value="0">--Select--</option>
	<option value="artist">Artist</option>
	<option value="business in service sector">Business In Service Sector</option>
	<option value="business in trade sector">Business In Trade Sector</option>
	<option value="central govt services">Central Govt Services</option>
	<option value="state govt serices">State Govt Services</option>
	<option value="industrialist">Industrialist</option>
	<option value="journalist">Journalist</option>
	<option value="student">Student</option>
	<option value="housewives">HouseWives</option>
	<option value="retired">Retired</option>
	<option value="others">Others</option>
	</select>
	</td>
</tr>
<tr bgcolor=#ffffff>
	<td>
	Organization Name
	</td>
	<td>
	<input type="text" name="organization" id="organization">
	</td>
	<td>
	Designation/Profession
	</td>
	<td>
	<input type="text" name="designation" id="designation">
	</td>
</tr>
<tr bgcolor=#d8d8d8>
	<td colspan="4">
	<hr>
	</td>
</tr>
<tr bgcolor=#ffffff>
	<td>
	Income*
	</td>
	<td>
	Rs.
	<select name="income" id="income">
	<option value="0">--Select--</option>
	<option value="Upto INR 20,000">Upto INR 20,000</option>
	<option value="INR 20,001 to 50,000">INR 20,001 to 50,000</option>
	<option value="INR 50,001 to 1,00,000">INR 50,001 to 1,00,000</option>
	<option value="INR 1,00,001 to 5,00,001">INR 1,00,001 to 5,00,001</option>
	<option value="INR 5,00,001 to 10,00,001">INR 5,00,001 to 10,00,001</option>
	<option value="Above 10,00,000">Above 10,00,000</option>
	</select>
	<select name="term" id="term">
	<option value="Annually">Annually</option>
	<option value="Monthly">Monthly</option>
	</select>
	</td>
	<td>
	Assets (Approximate Value)
	</td>
	<td>
	Rs.
	<input type="text" name="assetvalue" id="assetvalue">
	</td>
</tr>
<tr bgcolor=#d8d8d8>
	<td>
	Vehicle
	</td>
	<td colspan="3">
	<input type="checkbox"  name="vehicle1" value="two wheeler">Two Wheeler
	<input type="checkbox"  name="vehicle1" value="four wheeler">Four Wheeler
	<input type="checkbox"  name="vehicle1" value="others">Others
	<input type="hidden"  name="vehicle" id="vehicle">
	</td>
</tr>
<tr bgcolor=#ffffff>
	<td>
	Life Insurance Value
	</td>
	<td colspan="3">
	Rs.
	<input type="text" name="lifeinsurancevalue" id="lifeinsurancevalue">
	</td> 
</tr>
<tr bgcolor=#d8d8d8>
	<td>
	Life Insurance
	</td>
	<td colspan="3">
	<input type="checkbox" name="lifeinsurance1" value="BOB LifeInsurance">BOB LifeInsurance
	<input type="checkbox" name="lifeinsurance1" value="Others">Others
	<input type="hidden" name="lifeinsurance" id="lifeinsurance">
	</td>
</tr>
<tr bgcolor=#ffffff>
	<td>
	Existing Loans
	</td>
	<td colspan="3">
	<input type="checkbox" name="loan1" value="Car Loan">Car Loan
	<input type="checkbox" name="loan1" value="Home Loan">Home Loan
	<input type="checkbox" name="loan1" value="Personal Loan">Personal Loan
	<input type="checkbox" name="loan1" value="Education Loan">Education Loan
	<input type="checkbox" name="loan1" value="Business Loan">Business Loan
	<input type="hidden" name="loan" id="loan">
	</td>
</tr>
<tr bgcolor=#d8d8d8>
	<td>
	House
	</td>
	<td colspan="3">
	<input type="radio" name="house" id="ancestral" value="ancestral">Ancestral
	<input type="radio" name="house" id="owned" value="owned">Owned
	<input type="radio" name="house" id="rented" value="rented">Rented
	<input type="radio" name="house" id="others" value="others" checked="checked">Others
	</td>
</tr>
<tr bgcolor=#ffffff>
	<td>
	Mutual Fund
	</td>
	<td colspan="3">
	<input type="checkbox" name="mutualfund1" value="BOB Mutual Fund">BOB Mutual Fund
	<input type="checkbox" name="mutualfund1" value="Others">Others
	<input type="checkbox" name="mutualfund1" value="No Investment">No Investment
	<input type="hidden" name="mutualfund" id="mutualfund" >
	</td>
</tr>
<tr bgcolor=#d8d8d8>
	<td>
	Credit Card
	</td>
	<td colspan="3">
	<input type="checkbox" name="creditcard1" value="BOB Card">BOB Card
	<input type="checkbox" name="creditcard1" value="Others">Others
	<input type="hidden" name="creditcard" id="creditcard">
	</td>
</tr>
<tr bgcolor=#888888>
	<th colspan="4">
	IT PAN No. OR Fill Form 60 Details
	</th>
</tr>
<tr bgcolor=#ffffff>
	<td colspan="2">
	<br>
	<input type="hidden" name="it" id="it" readonly="readonly">
	<input type="text" name="itLabel" id="itLabel" readonly="readonly">&nbsp;:&nbsp;&nbsp;
	<input type="text" name="itno" id="itno">
	<br>
	&nbsp;
	</td>
	<td colspan="2" align="center">
	<br>
	<button type="button" name="show" id="show" onclick="showForm60()" >Show Form60 Window</button>
	<br>
	&nbsp;
	</td>
</tr>
<tr>
	<td colspan="4" id="proceedandsubmit" style="text-align: center">
	<button type="button" name="proceed" id="proceed" onclick="return form2Validation()" >Proceed</button>
	</td>
</tr>
</table>
</center>
</form>
</body>
</html>