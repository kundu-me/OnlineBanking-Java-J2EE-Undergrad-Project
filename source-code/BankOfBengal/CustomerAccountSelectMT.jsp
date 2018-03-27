<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Transfer Money||Bank Of Bengal</title>
  <link rel="stylesheet" href="css/CustomerTransferMoneyStyle.css">
</head>
<body onload='xmlhttpPost("CustomerAccountSelectAjax.jsp")'>
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
		var selectElement=document.getElementById("sender_accountno");
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
</script>
  <section class="container">
    <div class="login">
      <h1>Select Account For Money Transfer</h1>
      <form method="post" action="CustomerAccountSelectMTServlet" name="account">
      <table>
      	<tr>
      		<td width="150">
      		<p><h4>From (Account No.)</h4></p>
      		</td>
      		<td>
      		<%
      		String account1=(String)session.getAttribute("accountnoSession"); %>
      		<select name="sender_accountno" id="sender_accountno">
      		<option value=<%=account1 %>><%=account1 %></option>
      		</select>
      		</td>
      </tr>
      <tr>
      		<td>
      		<p><h4>Password</h4></p>
      		</td>
      		<td>
      		<input type="password" name="password" id="password" placeholder="Password" >
      		</td>
      </tr>
      <tr>
      <td colspan="2">
      <label id="msg" style="color: red; font-family: Times New Roman; font-size: 15px"></label>
      </td>
      </tr>
      </table>
       <p class="submit"><input type="submit" onclick="return formValidation()" name="commit" value="Proceed"></p>
      </form>
    </div>
  </section>
 </body>
</html>
