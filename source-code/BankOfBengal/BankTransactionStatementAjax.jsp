<%@ page language="java" contentType="application/x-www-form-urlencoded; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import="java.util.*" %>
<%
String qString=request.getParameter("w");
String Q="";
String CD="";
String branchcode=(String)session.getAttribute("BankBranchcodeSession");
String start_date=(String)session.getAttribute("BankStart_dateSession");
String end_date=(String)session.getAttribute("BankEnd_dateSession");

org.dao.BankAccountDAO bank=new org.dao.BankAccountDAO();
ArrayList<org.bean.BankAccount> list=null;
list=bank.getAllTransactionStatement(branchcode,start_date, end_date);
if(list!=null)
{
	for(org.bean.BankAccount obj:list)
	{
		String cd=obj.getTransactiontype();
		if(cd.equalsIgnoreCase("add"))
		{
			CD="Credit";
		}
		if(cd.equalsIgnoreCase("sub"))
		{
			CD="Debit";
		}
		Q+=	obj.getTransactionid()+"|"+
		obj.getBankcharges()+"|"+
		CD+"|"+
		obj.getTransactiontimestamp()+"|"+"=";
	}
}
else
{
	Q="x";
}

%>
<%=Q %>