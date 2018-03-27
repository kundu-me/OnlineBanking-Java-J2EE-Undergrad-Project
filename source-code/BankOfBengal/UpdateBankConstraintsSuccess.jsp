<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bank Constraints Update Success</title>
<link rel="stylesheet" href="css/AdminTableStyle.css">
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
<center>
<table class="CSSFormAdmin" align="center">
<tr>
	<th colspan="2">
	Bank Constraints Updated Successfully 
	</th>
</tr>
<tr>
<td colspan="2"></td>
</tr>
<tr bgcolor=#888888>
	<td colspan="2" align="center">
	<a type="button" class="smallbuttons" href="UpdateBankConstraints.jsp">Re-Update Constraints</a>
	<button type="button" class="smallbuttons" onclick="closeWindow()">Close</button>
	</td>
</tr>
</table>
</center>
</body>
</html>