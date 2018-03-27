<%@page import="org.dao.MoneyTransferDAO"%>
<%@page import="org.dao.TransactionDetailsDAO"%>
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

String qString=request.getParameter("w");
String Q="";
String[] details=qString.split(",");

String tid=details[0];
String fid=details[1];

String status="accepted";
org.dao.FixedDepositDAO fdDAO=new org.dao.FixedDepositDAO();
boolean success=fdDAO.updateStatus(tid, status);
if(success)
{
	Q="success";
}
else
{
	Q="failure";
}

%>
<%=Q %>