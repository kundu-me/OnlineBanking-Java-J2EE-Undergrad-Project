<%@page import="org.dao.CustomerAccountDAO"%>
<%@page import="org.dao.Form1PersonalDetailsDAO"%>
<%@page import="org.dao.FixedDepositSchemeDAO"%>
<%@ page language="java" contentType="application/x-www-form-urlencoded; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import="java.util.*" %>
<%@page     import="java.sql.Connection,
		        java.sql.DriverManager ,
				java.sql.PreparedStatement ,
				java.sql.ResultSet ,
				java.sql.SQLException"%>

<%
String qString=request.getParameter("w");
String Q="";
org.dao.CustomerAccountDAO custDAO= new org.dao.CustomerAccountDAO();
String branchcode=(String)session.getAttribute("FDbranchcodeSession");
String accountno=(String)session.getAttribute("FDaccountnoSession");
String cid=custDAO.getCidFromAccountno(accountno);
session.setAttribute("FDcidSession", cid);
String name=custDAO.getName(cid);
boolean value=false;
Connection con=null;
PreparedStatement pst=null;
ResultSet rs=null;
String sql=null;
try
{
	
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");
	sql="select a.ctype,a.cage,a.dob,a.nationality,a.uidlabel,a.uidno,a.homeno,a.street,a.landmark,a.district,a.city,a.state,a.pincode,"
			+"a.xhomeno,a.xstreet,a.xlandmark,a.xdistrict,a.xcity,a.xstate,a.xpincode,a.mcode,a.mobile,a.lcode,a.landline,a.email,"
			+"b.it,b.itno"
			+" from personaldetails a,additionaldetails b where a.cid=b.cid and a.cid=?";
	pst=con.prepareStatement(sql);
	pst.setString(1,cid);
	rs=pst.executeQuery();
	while(rs.next())
	{
		 Q=rs.getString(1)+"|"+rs.getString(2)+"|"+
			rs.getDate(3).toString()+"|"+
			rs.getString(4)+"|"+rs.getString(5)+"|"+rs.getString(6)+"|"+
			rs.getString(7)+","+rs.getString(8)+",\nLandMark: "+rs.getString(9)+", District: "+rs.getString(10)+",\nCity: "+rs.getString(11)+" State: "+rs.getString(12)+",\nPinCode"+rs.getString(13)+"|"+
			rs.getString(14)+","+rs.getString(15)+",\nLandMark: "+rs.getString(16)+", District: "+rs.getString(17)+",\nCity: "+rs.getString(18)+" State: "+rs.getString(19)+",\nPinCode"+rs.getString(20)+"|"+
			rs.getString(21)+"-"+rs.getString(22)+"|"+
			rs.getString(23)+"-"+rs.getString(24)+"|"+
			rs.getString(25)+"|"+
			rs.getString(26)+"|"+rs.getString(27)+"|"+name+"|";
	}
	
}
catch(ClassNotFoundException e)
{
	e.printStackTrace();
}
catch(SQLException e)
{
	e.printStackTrace();

}
catch(Exception e)
{
	e.printStackTrace();
}
finally
{

	try
	{
		if(con!=null)
			con.close();

	}
	catch(SQLException e)
	{
		e.printStackTrace();
	}
}

%>
<%=Q %>