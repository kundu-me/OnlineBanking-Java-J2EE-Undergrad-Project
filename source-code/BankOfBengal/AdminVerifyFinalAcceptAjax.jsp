<%@page import="org.bean.ConstraintValues"%>
<%@page import="org.dao.TransactionDetailsDAO"%>
<%@page import="org.bean.PasswordGenerator"%>
<%@ page language="java" contentType="application/x-www-form-urlencoded; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%

String qString=request.getParameter("w");
String Q="";
String[] v=qString.split(",");

int serial=-1;
boolean success1=false,success2=false;
String accountno=v[0];
String a="";
String cid=v[1];
String branchcode=v[2];
String email=v[3];
String remarks=v[4];
String balString=v[5];

String status="active";
double balance=org.bean.ConstraintValues.ACCOUNT_BALANCE;
String username="",password="";
try
{
	balance=Double.parseDouble(balString);
}
catch(Exception e)
{
	e.printStackTrace();
}

org.dao.CustomerAccountDAO acDAO=new org.dao.CustomerAccountDAO();
org.dao.Form1PersonalDetailsDAO f1=new org.dao.Form1PersonalDetailsDAO();
org.dao.ApplicationStatusDAO appStatus=new org.dao.ApplicationStatusDAO();
org.dao.BankAccountDAO bank=new org.dao.BankAccountDAO();
org.dao.TransactionDetailsDAO trans=new org.dao.TransactionDetailsDAO();

serial=acDAO.getSerialNo();

if(serial>0)
{
	String s=serial+"";
	if(s.length()==1)
	{
		a="00000"+s;
	}
	else if(s.length()==2)
	{
		a="0000"+s;
	}
	else if(s.length()==3)
	{
		a="000"+s;
	}
	else if(s.length()==4)
	{
		a="00"+s;
	}
	else if(s.length()==5)
	{
		a="0"+s;
	}
	else if(s.length()==6)
	{
		a=s;
	}
	else if(s.length()>=7)
	{
		a=s;
	}
	accountno+=a;
	
	
	org.bean.PasswordGenerator pass=new org.bean.PasswordGenerator();
	String name=f1.getFname(cid);
	
	String[] UEname=email.split("@");
	username=UEname[0]+serial;
	password=pass.passwordGenerator();
	
	org.bean.SendEmail emailToCustomer=new org.bean.SendEmail();
	
	success1=acDAO.setCustomerAccount(serial,accountno,cid,branchcode,email,username,password,0,status);
	
	status="application accepted";
	success2=appStatus.updateStatusAndRemarks(cid,status,remarks);
	
	String transactiontype="add";
	String transactionid="CASHIN"+accountno;
	double current_balance=acDAO.updateAccountBalance(accountno, balance, transactiontype);
	
	remarks="INR. "+balance+ " Transfered To Account Because Of Initial Deposit";
	boolean validUpdate1=trans.setTransactionDetails(accountno, branchcode, transactionid,
													transactiontype, balance, current_balance, remarks);
	bank.setBankAccountCharges(transactionid, accountno, branchcode, balance,"add");
	
	String to=email;
	String sub="ACCOUNT LOGIN DETAILS";
	String msg="Dear "+name+",\n"
			+"Your Application with Customer ID - "+cid+" is Verified.\n"
			+"Your Account NO. is "+accountno+".\n"
			+"Your Login Details is As Follows:\n"
			+"Username OR Login ID : "+username+"\n"
			+"Password : "+password;
	emailToCustomer.sendEmail(to, sub, msg);
			
	
	
	if(success1==true && success2==true)
	{
		Q=accountno+"|"+remarks;
	}
	else
	{
		Q="error";
	}

	
}
%>
<%=Q %>