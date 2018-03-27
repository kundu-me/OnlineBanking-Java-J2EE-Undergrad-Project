<%@page import="org.bean.AddCustomerAccount"%>
<%@ page language="java" contentType="application/x-www-form-urlencoded; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import="java.util.*" %>
<%
String qString=request.getParameter("w");
String Q="";
String username=(String)session.getAttribute("usernameSession");

org.dao.AddCustomerAccountDAO addAcc=new org.dao.AddCustomerAccountDAO();
org.dao.CustomerAccountDAO acc=new org.dao.CustomerAccountDAO();
java.util.ArrayList<org.bean.AddCustomerAccount> list=null;
String accountnoI="";
double balanceI=0;
list=addAcc.getAddedCustomerAccounts(username);
int i=0;
if(list!=null)
{
	for(org.bean.AddCustomerAccount obj:list)
	{
		accountnoI=obj.getAccountno();
		balanceI=acc.getBalance(accountnoI);
		Q+=accountnoI+"|"+balanceI+"=";
	}
}
if(Q.length()<2)
{
	Q="x";
}


%>
<%=Q %>
 