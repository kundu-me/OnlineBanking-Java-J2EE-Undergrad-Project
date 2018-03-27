<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Online Account Open Form Part2</title>
<link rel="stylesheet" href="css/CustomerInputStyle.css">
 <link rel="stylesheet" href="css/CustomerFormStyle.css">
 
</head>
<body onload="disableForm60()">
<script>
function disableForm60()
{
	document.getElementById("itno").disabled=false;
	document.getElementById("fullname").disabled=true;
	document.getElementById("address").disabled=true;
	document.getElementById("openingof").disabled=true;
	document.getElementById("issueof").disabled=true;
	document.getElementById("tamount").disabled=true;
	document.getElementById("tax").disabled=true;
	document.getElementById("document").disabled=true;
}
function enableForm60()
{
	document.getElementById("itno").disabled=true;
	document.getElementById("fullname").disabled=false;
	document.getElementById("address").disabled=false;
	document.getElementById("openingof").disabled=false;
	document.getElementById("issueof").disabled=false;
	document.getElementById("tamount").disabled=false;
	document.getElementById("tax").disabled=false;
	document.getElementById("document").disabled=false;
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
	if(document.getElementById("pan").checked==true)
		{
		var d=document.forms["form2"]["itno"].value;
		if(d==null || d=="")
			{
			alert("Enter Your IT PAN Number !");
			var text="Enter Your IT PAN Number. If you do not have your IT PAN Number then Fill Up Form 60/61 Below ";
			var error=errorMessage+text;
			errorElement.innerHTML=error;
			errorElement.style.color="red";
			document.getElementById("itno").focus();
			return false;
			}
		}
	if(document.getElementById("form60").checked==true)
		{
		var d=document.forms["form2"]["fullname"].value;
		var e=document.forms["form2"]["address"].value;
		var f=document.forms["form2"]["openingof"].value;
		var g=document.forms["form2"]["issueof"].value;
		var h=document.forms["form2"]["tamount"].value;
		var i=document.forms["form2"]["document"].value;
		if(d==null || d=="")
		{
			alert("Enter Your Full Name !");
			var text="Enter Your Full Name of Declarant ";
			var error=errorMessage+text;
			errorElement.innerHTML=error;
			errorElement.style.color="red";
			document.getElementById("fullname").focus();
			return false;
		}
		if(e==null || e=="")
		{
			alert("Enter Your Full Address !");
			var text="Enter Your Full Address of Declarant";
			var error=errorMessage+text;
			errorElement.innerHTML=error;
			errorElement.style.color="red";
			document.getElementById("address").focus();
			return false;
		}
		if(f==null || f=="")
		{
			alert("Enter Opening Of Accounts !");
			var text="Enter Opening Of Accounts ";
			var error=errorMessage+text;
			errorElement.innerHTML=error;
			errorElement.style.color="red";
			document.getElementById("openingof").focus();
			return false;
		}
		if(g==null || g=="")
		{
			alert("Enter Issue Of Debit card !");
			var text="Enter Issue Of Debit Card ";
			var error=errorMessage+text;
			errorElement.innerHTML=error;
			errorElement.style.color="red";
			document.getElementById("issueof").focus();
			return false;
		}
	
		if(h==null || h=="")
		{
			alert("Enter Transaction Amount !");
			var text="Enter Transaction Amount ";
			var error=errorMessage+text;
			errorElement.innerHTML=error;
			errorElement.style.color="red";
			document.getElementById("tamount").focus();
			return false;
		}
		if(h!=null || h!="")
		{
			if(isNaN(h))
			{
				alert("Enter Transaction Amount Only In Numbers !");
				var text="Enter Transaction Amount Only In Numbers";
				var error=errorMessage+text;
				errorElement.innerHTML=error;
				errorElement.style.color="red";
				document.getElementById("tamount").focus();
				return false;
			}
		}
		if(i==null || i=="")
		{
			alert("Enter Details of Documents !");
			var text="Enter Details of Documents being produced in support of address";
			var error=errorMessage+text;
			errorElement.innerHTML=error;
			errorElement.style.color="red";
			document.getElementById("document").focus();
			return false;
		}
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
		document.getElementById("mutualfund").value="No Investment,";
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
    element1.setAttribute("value", "Save And Proceed");
    element1.setAttribute("name", "Submit");
    cell1.appendChild(element1);
}
</script>

<form name="form2" method="post" action="Form2AdditionalDetailsServlet">
<center>
<table class="CSSFormCustomer" align="center">
<tr bgcolor=#888888>
	<th colspan="4">Additional Details</th>
</tr>
<tr>
	<td colspan="4" >
	<p id="instruction"><font color="red"><b>
	Do not Press F5 or Refresh while filling up this form
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
	<input type="text" name="applicationno" id="applicationno" readonly="readonly" value=<%=(String) session.getAttribute("aidSession")%>>
	</td>
	<td>
	Customer ID
	</td>
	<td>
	<input type="text" name="cid" id="cid" readonly="readonly" value=<%=(String) session.getAttribute("cidSession")%>>
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
	<select name="term">
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
	<input type="checkbox"  name="vehicle1" value="others">others
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
	<input type="radio" name="house" value="ancestral">Ancestral
	<input type="radio" name="house" value="owned">Owned
	<input type="radio" name="house" value="rented">Rented
	<input type="radio" name="house" value="others" checked="checked">Others
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
	Provide Your IT PAN No. OR Fill Form 60 below
	</th>
</tr>
<tr bgcolor=#ffffff>
	<td colspan="4">
<pre>
	<font size="3" face="gregoria">
	<input type="radio" name="it" id="pan" value="pan" checked="checked" onchange="disableForm60()">IT PAN No. (as in Card)	<input type="text" name="itno" id="itno"><b>OR</b>
	
	<input type="radio" name="it" id="form60" value="form60" onchange="enableForm60()">Form 60/61</font><b>
	<font size="3" face="Times" style="background-color: #d8d8d8;">
|		Form 60/61																					|</font></b>

	Form of declaration filled by a person who does not have either a Permanent Account Number
	or General Index Registration Number and who makes payment in cash in respect of transaction
	specified in clause (a) to (h) of rule 114B
	
	Full Name of Declarant*	<input type="text" name="fullname" id="fullname">
	
	Address of Declarant*	<textarea rows="3" cols="30" name="address" id="address"></textarea>
	
	Particulars of Transaction - (a) Opening of	<input type="text" name="openingof" id="openingof"> account(s)*
	
	                             (b) Issue of Debit Card	<input type="text" name="issueof" id="issueof">
								 
	Amount of Transaction*	<input type="text" name="tamount" id="tamount">
	
	Are you assessed to tax?*	<input type="radio" name="tax" value="yes" id="tax">Yes <input type="radio" name="tax" value="no" checked="checked">No
	
	Details of documents being produced in support of address	<input type="text" name="document" id="document">
	
	</pre>
	</td>
</tr>
<tr>
	<td colspan="4" align="center" id="proceedandsubmit" style="text-align: center">
	<button type="button" name="proceed" id="proceed" onclick="return form2Validation()" >Proceed</button>
	</td>
</tr>
</table>
</center>
</form>
</body>
</html>