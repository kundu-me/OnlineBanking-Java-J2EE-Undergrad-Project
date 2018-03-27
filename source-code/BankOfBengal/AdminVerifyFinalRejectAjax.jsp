<%@page import="org.dao.OtherAccountsDAO"%>
<%@ page language="java" contentType="application/x-www-form-urlencoded; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%

String qString=request.getParameter("w");
String Q="";
String[] v=qString.split(",");

boolean success=false;
String cid=v[0];
String remarks=v[1];

String status="application rejected";

String name="";
String to="";
String sub="APPLICATION REJECTED";
String msg="";

org.dao.ApplicationStatusDAO appStatus=new org.dao.ApplicationStatusDAO();
org.dao.Form1PersonalDetailsDAO f1=new org.dao.Form1PersonalDetailsDAO();
org.dao.Form2AdditionalDetailsDAO f2=new org.dao.Form2AdditionalDetailsDAO();
org.dao.Form3PersonalIdentificationDAO f3=new org.dao.Form3PersonalIdentificationDAO();
org.dao.OtherAccountsDAO acc=new org.dao.OtherAccountsDAO();
org.bean.SendEmail email=new org.bean.SendEmail();

boolean success1=appStatus.updateStatusAndRemarks(cid,status,remarks);
status="false";
boolean successf1=f1.updateStatus(cid,status);
boolean successf2=f2.updateStatus(cid,status);
boolean successf3=f3.updateStatus(cid,status);
boolean successacc=acc.updateOtherAccountsFalse(cid);

name=f1.getFname(cid);
to=f1.getEmail(cid);
String remarksToUpper=remarks;
msg="Dear "+name+",\n"+"Your Application with customer ID - "+cid+" is rejected.\n"
			+"REMARKS : "+remarksToUpper.toUpperCase()+"\n You have to Re-apply with a new application.";
email.sendEmail(to,sub,msg);

if(success1==true && successf1==true && successf2==true && successf3==true && successacc==true)
{
	Q=remarks;
}
else
{
	Q="error";
}

%>
<%=Q %>