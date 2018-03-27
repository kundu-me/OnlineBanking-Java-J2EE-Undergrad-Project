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
String accountno=details[2];
String amtD=details[3];
String branchcode=details[4];

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
String remarks="Money Transfer To e-FD With FD ID: "+fid+" Failure.";

org.dao.CustomerAccountDAO custDAO=new org.dao.CustomerAccountDAO();
balance=custDAO.updateAccountBalance(accountno, transactionamount, transactionType);

org.dao.TransactionDetailsDAO transDAO=new org.dao.TransactionDetailsDAO();
boolean success1=transDAO.setTransactionDetails(accountno, branchcode, tid, transactionType, transactionamount, balance, remarks);

String status="rejected";
org.dao.FixedDepositDAO fdDAO=new org.dao.FixedDepositDAO();
boolean success2=fdDAO.updateStatus(tid, status);

status="false";
org.dao.FixedDepositDetailsDAO fdDetailsDAO=new org.dao.FixedDepositDetailsDAO();
boolean success3=fdDetailsDAO.updateStatus(fid, status);

if(success1==true && success2==true && success3==true)
{
	Q="success";
}
else
{
	Q="failure";
}
%>
<%=Q %>