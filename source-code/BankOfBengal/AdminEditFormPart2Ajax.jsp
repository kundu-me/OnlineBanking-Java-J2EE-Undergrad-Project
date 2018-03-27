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
org.dao.Form2AdditionalDetailsDAO form2DAO=new org.dao.Form2AdditionalDetailsDAO();
org.bean.Form2AdditionalDetails ff=null;

ff=form2DAO.getForm2AdditionalDetails(cid);

if(ff==null)
{
	Q="error";
}
else
{
	Q=  ff.getApplicationno()+"|"+
		ff.getCid()+"|"+
		ff.getReligion()+"|"+
		ff.getCategory()+"|"+
		ff.getEducation()+"|"+
		ff.getOccupation()+"|"+
		ff.getOrganization()+"|"+
		ff.getDesignation()+"|"+
		ff.getIncome()+"|"+
		ff.getTerm()+"|"+
		ff.getAssetvalue()+"|"+
		ff.getVehicle()+"|"+
		ff.getLifeinsurancevalue()+"|"+
		ff.getLifeinsurance()+"|"+
		ff.getLoan()+"|"+
		ff.getHouse()+"|"+
		ff.getMutualfund()+"|"+
		ff.getCreditcard()+"|"+
		ff.getIt()+"|"+
		ff.getItno();
}


%>
<%=Q %>

