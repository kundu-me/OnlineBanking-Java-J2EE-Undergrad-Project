<%@page import="org.dao.Form1PersonalDetailsDAO"%>
<%@page import="org.dao.FixedDepositSchemeDAO"%>
<%@ page language="java" contentType="application/x-www-form-urlencoded; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import="java.util.*" %>
<%
String qString=request.getParameter("w");
String Q="";
String cid=(String)session.getAttribute("cidSession");
String status=qString;

org.dao.FixedDepositSchemeDAO scheme=new org.dao.FixedDepositSchemeDAO();
org.dao.Form1PersonalDetailsDAO f1=new org.dao.Form1PersonalDetailsDAO();
String ctype=f1.getCtype(cid);
String cage=f1.getCage(cid);
ArrayList<org.bean.FixedDepositScheme> list=null;
list=scheme.getScheme(ctype, cage);
if(list!=null)
{
	for(org.bean.FixedDepositScheme obj:list)
	{
		
		int min=obj.getMin_days();
		int max=obj.getMax_days();
		double interest=obj.getInterest();
		double pre=obj.getPrematurepenalty();
		String tenor=min+" days to "+max+" days";
		if(min>=365 && max>=365)
		{
			min=min/365;
			max=(max+1)/365;
			tenor=min+" years to less than "+max+" years";
		}
		
		Q+=tenor+"|"+interest+"|"+pre+"=";
		
	}
}
else
{
	Q="x";
}


%>
<%=Q %>