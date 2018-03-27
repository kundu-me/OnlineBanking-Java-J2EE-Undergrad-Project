<%@ page language="java" contentType="application/x-www-form-urlencoded; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%

String qString=request.getParameter("w");
String Q="";
String[] q=qString.split(",");

String cid=q[0];
String email=q[1];

org.dao.ApplicationStatusDAO appDAO=new org.dao.ApplicationStatusDAO();
org.bean.ApplicationStatus app=null;

app=appDAO.getApplicationStatus(cid, email);

if(app==null)
{
	Q="Either Customer ID or Email Is Incorrect"+"|"+"Please Enter Correct Details !";	
}
else
{
	String s1=app.getStatus();
	String r1=app.getRemarks();
	if(r1.equalsIgnoreCase("n/a"))
	{
		r1="No Remarks.";
	}
	Q="Application Status: "+s1.toUpperCase()+"|"+
	  "Remarks (If Any): "+r1;
}

%>
<%=Q %>