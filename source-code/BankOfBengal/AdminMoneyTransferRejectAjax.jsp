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
// word = tid+","+branchcode+","+sender_accountno++","+receiver_accountno+","+amount+","+bank;

String qString=request.getParameter("w");
String Q="";
String[] details=qString.split(",");

String transactionid=details[0];
String branchcode=details[1];
String sender_accountno=details[2];
String receiver_accountno=details[3];
String amtD=details[4];
String bankD=details[5];
String totalD=details[6];
String receiver_bank=details[7];
double transactionamount=0,bankcharges=0,totalamount=0;
try
{
	transactionamount=Double.parseDouble(amtD);
	bankcharges=Double.parseDouble(bankD);
	totalamount=Double.parseDouble(totalD);
}
catch(Exception e)
{
	e.printStackTrace();
}
String transactionType="add";
double balance=0;

String remarks="Money Transfer To Account No. "+receiver_accountno+" Of "+receiver_bank+" Failure.";

org.dao.CustomerAccountDAO custDAO=new org.dao.CustomerAccountDAO();
org.dao.BankAccountDAO bankDAO=new org.dao.BankAccountDAO();
balance=custDAO.updateAccountBalance(sender_accountno, transactionamount, transactionType);

org.dao.TransactionDetailsDAO transDAO=new org.dao.TransactionDetailsDAO();
boolean success1=transDAO.setTransactionDetails(sender_accountno, branchcode, transactionid, transactionType, transactionamount, balance, remarks);

balance=custDAO.updateAccountBalance(sender_accountno, bankcharges, transactionType);
boolean success2=transDAO.setTransactionDetails(sender_accountno, branchcode, transactionid, transactionType, bankcharges, balance, remarks);
String status="false";
boolean success3=bankDAO.updateStatus(transactionid, status);

status="rejected";
org.dao.MoneyTransferDAO moneyDAO=new org.dao.MoneyTransferDAO();
boolean success4=moneyDAO.updateStatus(transactionid, status);

if(success1==true && success2==true && success3==true && success4==true)
{
	Q="success|1";
}
else
{
	Q="failure|0";
}
%>
<%=Q %>