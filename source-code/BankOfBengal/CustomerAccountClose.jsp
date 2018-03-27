<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Account Close||Bank Of Bengal</title>
  <link rel="stylesheet" href="css/CustomerStyle.css">
</head>
<body onload="getSecurityQuestion()">
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
	var k="details";
	var word = k;
	qstr = 'w=' + escape(word); // NOTE: no '?' before querystring
	return qstr;
}

function updatepage(str)
{
	var str1="x";
	if(str!=str1)
	{
		var acc = str.split("|");
		var l=acc.length;
		var n=0;
		var selectElement=document.getElementById("accountno");
		for (n=0; n<l-1; n++)
		{
			var o=document.createElement('option');
			o.value=acc[n].trim();
			o.text=acc[n];
			selectElement.options.add(o);
			
			//selectElement.options[selectElement.options.length]=new Option(acc[n],acc[n]);
		}
	}

}
function formValidation()
{
	var password=document.getElementById("password").value;
	var securityQuestion=document.getElementById("securityQuestion").value;
	var securityAnswer=document.getElementById("securityAnswer").value;
	if(password==null|| password=="")
	{
		alert("New Password Cannot be Blank !");
		document.getElementById("password").focus();
		return false;
	}
	if(securityQuestion=="Select A Security Question")
	{
	alert("Select A Security Question !!!");
	document.getElementById("securityQuestion").focus();
	return false;
	}
	
	if(securityAnswer==null|| securityAnswer=="")
	{
		alert("Security Answer Cannot be Blank !");
		document.getElementById("securityAnswer").focus();
		return false;
	}
}

function getSecurityQuestion()
{
	var element=document.getElementById("securityQuestion");
	while (element.length>1)
	{
		element.remove(x.length-1);
	}
	
	var question=new Array();
	i=0;
	question[i++]="What was your childhood nickname?";
	question[i++]="What is your oldest cousin's first and last name?";
	question[i++]="What was the name of your elementary / primary school?";
	question[i++]="What is the name of your grandmother's dog?";
	question[i++]="What are the last 5 digits of your driver's license number?";
	question[i++]="Where were you New Year's 2000?";
	question[i++]="Where were you when you first heard about 9/11?";
	question[i++]="What is your youngest brother's birthday?";
		
	for(var i=0;i<question.length;i++)
	{
		element.options[element.options.length]=new Option(question[i],question[i]);
	}
	
	xmlhttpPost("CustomerAccountSelectAjax.jsp");
}
</script>
  <section class="container">
    <div class="login">
      <h1>Account Close Request</h1>
      <form method="post" action="CustomerAccountCloseServlet">
      <table>
      <tr>
      		<td width="150">
      		<p><h4>Closing Account No.</h4></p>
      		</td>
      		<td>
      		<%
      		String account1=(String)session.getAttribute("accountnoSession"); %>
      		<select name="accountno" id="accountno">
      		<option value=<%=account1 %>><%=account1 %></option>
      		</select>
      		</td>
      </tr>
      <tr>
      <td width="150">
      <p><h4>User Name*</h4></p>
      </td>
      <td>
      <input type="text" name="username" id="username" placeholder="Username Of The Closing">
      </td>
      </tr>
      <tr>
      <td>
      <p><h4>Password*</h4></p>
      </td>
      <td>
      <input type="password" name="password" id="password" placeholder="Password Of The Closing Account">
      </td>
      </tr>
      </table>
        <p>
        <select name="securityQuestion" id="securityQuestion">
        <option value="Select A Security Question">Select A Security Question</option>
        </select>
        <br>
        <input type="text" style="width: 433px;" name="securityAnswer" id="securityAnswer" placeholder="Security Answer">
        </p>
    <p class="submit"><input type="submit" onclick="return formValidation()" style="text-align: center;" name="commit" value="Close The Account"></p>
      </form>
    </div>
  </section>

 </body>
</html>
