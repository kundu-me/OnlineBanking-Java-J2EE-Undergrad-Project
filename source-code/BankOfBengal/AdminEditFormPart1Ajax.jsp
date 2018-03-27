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
int i;
Connection con=null;
PreparedStatement pst=null;
ResultSet rs=null;
String sql=null;
org.dao.Form1PersonalDetailsDAO form1DAO=new org.dao.Form1PersonalDetailsDAO();
org.bean.Form1PersonalDetails ff=null;
org.dao.BranchDetailsDAO branchDAO=new org.dao.BranchDetailsDAO();
org.bean.BranchDetails bb=null;
ff=form1DAO.getForm1PersonalDetails(cid);

if(ff==null)
{
	Q="error";
}
else
{
	Q= ff.getApplicationno()+"|"+
		ff.getCid()+"|"+
		ff.getBranchcode()+"|"+
		ff.getCtype()+"|"+
	    ff.getCage()+"|"+
	    ff.getSalutation()+"|"+
	    ff.getFname()+"|"+
	    ff.getMname()+"|"+
	    ff.getLname()+"|"+
	    ff.getGuardian()+"|"+
	    ff.getGsalutation()+"|"+
	    ff.getGname()+"|"+
	    ff.getDob()+"|"+
	    ff.getGender()+"|"+
	    ff.getNationality()+"|"+
	    ff.getMaiden()+"|"+
	    ff.getMarital()+"|"+
	    ff.getUidlabel()+"|"+
	    ff.getUidno()+"|"+
	    ff.getHomeno()+"|"+
	    ff.getStreet()+"|"+
	    ff.getLandmark()+"|"+
	    ff.getDistrict()+"|"+
	    ff.getCity()+"|"+
	    ff.getState()+"|"+
	    ff.getPincode()+"|"+
	    ff.getAddsame()+"|"+
	    ff.getXhomeno()+"|"+
	    ff.getXstreet()+"|"+
	    ff.getXlandmark()+"|"+
	    ff.getXdistrict()+"|"+
	    ff.getXstate()+"|"+
	    ff.getXcity()+"|"+
	    ff.getXpincode()+"|"+
	    ff.getMcode()+"|"+
	    ff.getMobile()+"|"+
	    ff.getLcode()+"|"+
	    ff.getLandline()+"|"+
	    ff.getEid()+"|"+
	    ff.getEdomain()+"|"+
	    ff.getEmail()+"|";
	bb=branchDAO.getbranchDetails(ff.getBranchcode());
	String address=bb.getBranchaddress()+",\nSTATE: "+bb.getBranchstate()+",\nCITY: "+bb.getBranchcity()+",\nPINCODE: "+bb.getBranchpincode();
	String name=bb.getBranchname();
	Q+=name+"|"+address;
		
	}


%>
<%=Q %>

