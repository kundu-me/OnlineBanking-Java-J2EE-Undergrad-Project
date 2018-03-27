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
String cid=qString;

org.dao.Form60DAO form60DAO=new org.dao.Form60DAO();
org.bean.Form60 ff=null;

ff=form60DAO.getForm60(cid);


if(ff==null)
{
	Q="NotApplicable| | | | | | | | |";
}
else
{
	Q=  ff.getForm60no()+"|"+
		ff.getCid()+"|"+
		ff.getFullname()+"|"+
		ff.getAddress()+"|"+
		ff.getOpeningof()+"|"+
		ff.getIssueof()+"|"+
		ff.getTamount()+"|"+
		ff.getTax()+"|"+
		ff.getDocument()+"|";
}

%>
<%=Q %>

