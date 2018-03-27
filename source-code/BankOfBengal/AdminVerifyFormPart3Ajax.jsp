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
String serial="";
String cid=qString;
org.dao.Form3PersonalIdentificationDAO form2DAO=new org.dao.Form3PersonalIdentificationDAO();
org.dao.OtherAccountsDAO accDAO=new org.dao.OtherAccountsDAO();

org.bean.OtherAccounts aa=null;
org.bean.Form3PersonalIdentification ff=null;

ff=form2DAO.getForm3PersonalIdentification(cid);


if(ff==null)
{
	Q="error";
}
else
{
	Q=  ff.getApplicationno()+"|"+
		ff.getCid()+"|"+
		ff.getPoilabel()+"|"+
		ff.getPoino()+"|"+
		ff.getPoiplace()+"|"+
		ff.getPoidate()+"|"+
		ff.getPoalabel()+"|"+
		ff.getPoano()+"|"+
		ff.getPoaplace()+"|"+
		ff.getPoadate()+"|"+
		ff.getOtheraccount()+"|";
	int n=ff.getOtheraccount();
	if(ff.getOtheraccount()>0)
	{
		for(int i=1;i<=n;i++)
		{
			serial=cid+i;
			aa=accDAO.getOtherAccounts(serial,cid);
			Q+=aa.getBank()+"="+aa.getBranch()+"="+aa.getAccounttype()+"="+aa.getAccountno()+";";
		}
		
	}
}


%>
<%=Q %>

