<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Transfer Money Successful</title>
  <link rel="stylesheet" href="css/CustomerTransferMoneyStyle.css">
  <link href="css/CloseButtonStyleCSS.css" rel="stylesheet" type="text/css" />
<style TYPE="text/css"><!--
    A:link {text-decoration: none; color: #ffffff}
    a:visited {text-decoration: none; color: #fffff}
    a:active {text-decoration: none; color: #ffffff}
    a:hover{color: #ffffff}
--></style>
</head>
<body>
<script type="text/javascript">
</script>

  <section class="container">
    <div class="login">
      <h1>Money Transfer Message</h1>
      <table>
      <tr>
      <td colspan="2">&nbsp;
      </td>
      </tr>
      	<tr>
      		<td colspan="2" style="text-align: center;font-family: Gregoria;">
      		<p><h2>Money Transfer Is In Process. Please Note The Transaction ID</h2></p>
      		</td>
        </tr>
      <tr>
      		<td>
      		<p><h2 style="font-family: Times New Roman;">Transaction ID</h2></p>
      		</td>
      		<td>
      		<%
      		String tid=(String)session.getAttribute("tidSession"); 
      		session.removeAttribute("tidSession");
      		%>
      		<p><h2 style="font-family: Times New Roman;"><%=tid %></h2>
      		</td>
      </tr>
      <tr>
      <td colspan="2">&nbsp;
      </td>
      </tr>
      </table>
      <p class="submit"><a class="CloseButtons" href="CustomerWelcome.jsp" style="font-family: Gregoria; color: white;">Close</a></p>
      
    </div>
  </section>
 </body>
</html>
