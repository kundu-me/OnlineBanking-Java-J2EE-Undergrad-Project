<%@ page language="java" contentType="application/x-www-form-urlencoded; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import="java.util.*" %>
<%
String qString=request.getParameter("w");
String Q="";
String CD="";
String start_date=(String)session.getAttribute("AdminStart_dateSession");
String end_date=(String)session.getAttribute("AdminEnd_dateSession");
String branchcode=(String)session.getAttribute("AdminBranchcodeSession");
org.dao.TransactionDetailsDAO transDAO=new org.dao.TransactionDetailsDAO();
ArrayList<org.bean.TransactionDetails> list=null;
list=transDAO.getAllTransactionStatement(branchcode,start_date, end_date);
if(list!=null)
{
	for(org.bean.TransactionDetails obj:list)
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
		obj.getTransactionamount()+"|"+
		CD+"|"+
		obj.getBalance()+"|"+
		obj.getTransactiontimestamp()+"|"+
		obj.getRemarks()+"=";
	}
}
else
{
	Q="x";
}


%>
<%=Q %>