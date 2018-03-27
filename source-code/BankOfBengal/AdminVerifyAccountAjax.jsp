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
boolean value=false;
String accountno=qString;
Connection con=null;
PreparedStatement pst=null;
ResultSet rs=null;
String sql=null;
String status="active";
try
{
	
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");
	sql="select * from customeraccount where accountno=? and status=?";
	pst=con.prepareStatement(sql);
	pst.setString(1,accountno);
	pst.setString(2,status);
	rs=pst.executeQuery();
	if(rs.next())
	{
		value=true;
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
if(value)
{
	Q="true|Receiver's Account Verified";
}
else
{
	Q="false|Receiver's Account Not Verified";
}
%>
<%=Q %>