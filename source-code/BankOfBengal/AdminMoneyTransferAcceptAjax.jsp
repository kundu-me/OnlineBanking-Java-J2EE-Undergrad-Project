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
// tid+","+branchcode+","+sender_accountno+","+receiver_accountno+","+amount;

String qString=request.getParameter("w");
String Q="";
String[] details=qString.split(",");

String transactionid=details[0];
String branchcode=details[1];
String sender_accountno=details[2];
String receiver_accountno=details[3];
String amtD=details[4];
double transactionamount=0;
try
{
	transactionamount=Double.parseDouble(amtD);
}
catch(Exception e)
{
	e.printStackTrace();
}

String transactionType="add";

double balance=0;

String remarks="Money Transfered From Account No. "+sender_accountno+" Of Bank Of Bengal";

org.dao.CustomerAccountDAO custDAO=new org.dao.CustomerAccountDAO();
balance=custDAO.updateAccountBalance(receiver_accountno, transactionamount, transactionType);

org.dao.TransactionDetailsDAO transDAO=new org.dao.TransactionDetailsDAO();
boolean success1=transDAO.setTransactionDetails(receiver_accountno, branchcode, transactionid, transactionType, transactionamount, balance, remarks);

String status="accepted";
org.dao.MoneyTransferDAO moneyDAO=new org.dao.MoneyTransferDAO();
boolean success2=moneyDAO.updateStatus(transactionid, status);
if(success1==true && success2==true)
{
	Q="success|1";
}
else
{
	Q="failure|0";
}

%>
<%=Q %>