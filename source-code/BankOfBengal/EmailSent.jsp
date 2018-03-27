<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Email Sent Successfully</title>
 <link rel="stylesheet" href="css/EmailStyle.css">
<link rel="stylesheet" href="css/SmallButtonStyleCSS.css">
</head>
<body>
<script type="text/javascript">
function closeWindow()
{
	window.open('', '_self', ''); 
	window.close(); 
}
</script>
<section class="container">
    <div class="login">
<center>
<table align="center">
<tr>
	<th colspan="2">
	<h1>Email Sent Successfully</h1> 
	</th>
</tr>
<tr>
<td colspan="2"></td>
</tr>
<tr>
	<td colspan="2" align="center">
	<a type="button" class="smallbuttons" href="AdminSendEmail.jsp">Send New Email</a>
	<button type="button" class="smallbuttons" onclick="closeWindow()">Close</button>
	</td>
</tr>
</table>
</center>
</div>
</section>
</body>
</html>