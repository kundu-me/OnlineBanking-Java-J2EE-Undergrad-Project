<%@page import="org.dao.CustomerAccountDAO"%>
<%@ page language="java" contentType="application/x-www-form-urlencoded; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<%@	page import="java.sql.Connection ,
				     java.sql.DriverManager ,
					 java.sql.PreparedStatement ,
					 java.sql.ResultSet ,
					 java.sql.SQLException"
%>

<%  

String cid=request.getParameter("w");
CustomerAccountDAO acc=new CustomerAccountDAO();
String accountno="";
accountno=acc.getAccountNoFromCID(cid);

if(accountno.length()<2)
{
	accountno="ACCXXXXXXXXXX";
}
%>
<%=accountno %>