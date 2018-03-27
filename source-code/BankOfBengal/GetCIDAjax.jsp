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

String accountno=request.getParameter("w");
CustomerAccountDAO acc=new CustomerAccountDAO();
String CID="";
CID=acc.getCidFromAccountno(accountno);
if(CID.length()<2)
{
	CID="BOBXXXXXXXXXX";
}
%>
<%=CID %>