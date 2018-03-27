<%@ page language="java" contentType="application/x-www-form-urlencoded; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%

String qString=request.getParameter("w");
String Q="";
String[] q=qString.split(",");

String accountno=q[0];
String password=q[1];
double balance=0;

org.dao.CustomerAccountDAO accDAO=new org.dao.CustomerAccountDAO();

boolean val=accDAO.isAccountValid(accountno, password);

if(val==false)
{
	Q="0|Please Enter Correct Password !";	
}
else
{
	balance=accDAO.getBalance(accountno,password);
	Q="1|INR. "+balance;
}

%>
<%=Q %>