<%@page import="org.dao.CustomerAccountDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Balance||Bank Of Bengal</title>
  <link rel="stylesheet" href="css/CustomerStyle.css">
  <link href="css/CloseButtonStyleCSS.css" rel="stylesheet" type="text/css" />
<style TYPE="text/css"><!--
    A:link {text-decoration: none; color: #ffffff}
    a:visited {text-decoration: none; color: #fffff}
    a:active {text-decoration: none; color: #ffffff}
    a:hover{color: #ffffff}
--></style>
  
</head>
<body onload='xmlhttpPost("CustomerAccountDetailsAjax.jsp")'>
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
		var app = str.split("=");
		var l=app.length;
		var i;
		var c=0;
		var table = document.getElementById("balanceTable");
		for(i=0;i<l-1;i++)
		{
			var details=app[i].split("|");
			
			var rowCount = table.rows.length;
		    var row = table.insertRow(rowCount);
		
		    var cell1 = row.insertCell(0);
	        cell1.innerHTML=details[0];
	        
		    var cell2 = row.insertCell(1);
	        cell2.innerHTML=details[1];
	    }

	}

	
}

</script>
<%
 org.dao.CustomerAccountDAO acc=new org.dao.CustomerAccountDAO();
 String username=(String)session.getAttribute("usernameSession");
 String accountno=(String)session.getAttribute("accountnoSession");
%>
  <section class="container">
    <div class="login">
      <h1>Account Balance Details</h1>
      <form method="post">
      <table id="balanceTable" align="center">
      <tr>
      	<td width="200">
		   <h3>Account No</h3>
      	</td>
      	<td width="200">
		  <h3>Current Balance INR.</h3>
      	</td>
      </tr>
      <tr>
      	<td>
		   &nbsp;
      	</td>
      	<td>
		   &nbsp; 
      	</td>
      </tr>
      <tr>
      	<td>
		 <%=accountno %>
      	</td>
      	<td>
        <%=acc.getBalance(accountno) %>
      	</td>
      </tr>
     </table>
     <p class="submit"><a class="CloseButtons" href="CustomerWelcome.jsp" style="font-family: Gregoria; color: white;">Close</a></p>
  </form>
  </div>
  </section>

 </body>
</html>
