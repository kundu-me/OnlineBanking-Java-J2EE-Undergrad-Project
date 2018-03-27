<%@page import="org.dao.BankAccountDAO"%>
<%@page import="org.dao.TransactionDetailsDAO"%>
<%@page import="org.dao.AddCustomerAccountDAO"%>
<%@page import="org.dao.OtherAccountsDAO"%>
<%@page import="org.dao.Form60DAO"%>
<%@page import="org.dao.Form3PersonalIdentificationDAO"%>
<%@page import="org.dao.Form2AdditionalDetailsDAO"%>
<%@page import="org.bean.Form2AdditionalDetails"%>
<%@page import="org.dao.Form1PersonalDetailsDAO"%>
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
String cid=details[0];
String accountno=details[1];
String balString=details[2];
String branchcode=details[3];
double balance=0;

try
{
	balance=Double.parseDouble(balString);
}
catch(Exception e)
{
	e.printStackTrace();
}

CustomerAccountDAO acc=new CustomerAccountDAO();
Form1PersonalDetailsDAO f1=new Form1PersonalDetailsDAO();
Form2AdditionalDetailsDAO f2=new Form2AdditionalDetailsDAO();
Form3PersonalIdentificationDAO f3=new Form3PersonalIdentificationDAO();
Form60DAO f60=new Form60DAO();
OtherAccountsDAO otherAcc=new OtherAccountsDAO();
AddCustomerAccountDAO addAcc=new AddCustomerAccountDAO();
TransactionDetailsDAO trans=new TransactionDetailsDAO();
BankAccountDAO bank=new BankAccountDAO();

String transactiontype="sub";
double current_balance=acc.updateAccountBalance(accountno, balance, transactiontype);

String remarks="INR. "+balance+ " Transfered To Account No. "+accountno+" Beacuse Of Account Close";

String transactionid="CASHOUT"+accountno;
boolean valid1=trans.setTransactionDetails(accountno, branchcode, transactionid ,transactiontype, balance, current_balance, remarks);

boolean valid2=bank.setBankAccountCharges(transactionid, accountno, branchcode, balance, transactiontype);

boolean s1=acc.updateAccountStatus(accountno, "closed");
boolean s2=f1.updateStatus(cid, "false");
boolean s3=f2.updateStatus(cid, "false");
boolean s4=f3.updateStatus(cid, "false");
boolean s5=otherAcc.updateOtherAccountsFalse(cid);
boolean s6=addAcc.updateStatus(accountno, "false");
f60.updateStatus(cid, "false");

Q="Account Closed !!!";
%>
<%=Q%>