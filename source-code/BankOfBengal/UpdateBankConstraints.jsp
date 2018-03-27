<%@page import="org.dao.BankConstraintsDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Bank Constraints Window</title>
<link rel="stylesheet" href="css/AdminTableStyle.css">

</head>
<script>


</script>


<body>
<%
org.dao.BankConstraintsDAO bank=new org.dao.BankConstraintsDAO();
ArrayList<org.bean.BankConstraints> list=null;
list=bank.getBankConstraints();
int SIZE=100;
String[] name=new String[SIZE];
String[] value=new String[SIZE];
String[] type=new String[SIZE];
int i=1;
if(list!=null)
{
	for(org.bean.BankConstraints obj:list)
	{
		name[i]=obj.getName();
		value[i]=obj.getValue();
		type[i]=obj.getType();
		i++;
	}
		
}
%>
<form name="update" action="UpdateConstraintsServlet" method="post" >
<center>
<table class="CSSFormAdmin" align="center">
<tr>
	<th colspan="3">
	Update Bank Constraints Details
	</th>
</tr>
<tr bgcolor=#888888>
	<td colspan="3" align="center">
	Enter The Details for the Constraints to Update
	</td>
</tr>
<tr>
	<td colspan="3">
	<p id="instruction"><font color="red"><b>
	Do not Press F5 or Refresh while filling up this 
	</b></font>	</p>
	<p id="errormsg">
	</p>
	</td>
</tr>
<tr bgcolor=#ffffff>
	<th>
	CONSTRAINT NAME
	</th>
	<th>
	VALUE
	</th>
	<th>
	TYPE
	</th>
</tr>
<tr>
	<td>
	Minimum Account Balance
	</td>
	<td>
	<input type="text" name="value1" id="value1" value=<%=value[1] %>>
	</td>
	<td>
	<select name="type1" id="type1">
	<option value=<%=type[1] %>><%=type[1] %></option>
	</select>
	</td>
	
</tr>
<tr>
	<td>
	Money Transfer Charge
	</td>
	<td>
	<input type="text" name="value2" id="value2" value=<%=value[2] %>>
	</td>
	<td>
	<select name="type2" id="type2">
	<option value=<%=type[2] %>><%=type[2] %></option>
	</select>
	</td>	
</tr>
<tr bgcolor=#ffffff>
	<td colspan="3">
	<center>
	<input type="reset" value="Reset">
	<input type="Submit" value="Submit">
	</center>
	</td>
</tr>
</table>
</center>
</form>
</body>
</html>