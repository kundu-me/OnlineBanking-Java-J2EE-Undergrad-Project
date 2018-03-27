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

Connection con=null;
PreparedStatement pst=null;
ResultSet rs=null;
String sql=null;
int applicationno;
String email,branchcode,status1,remarks1;
try
{
	
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");

	sql="select * from applicationstatus where cid=?";
	pst=con.prepareStatement(sql);
	pst.setString(1,cid);
	rs=pst.executeQuery();

	if(rs.next())
	{
		applicationno=rs.getInt(1);
		cid=rs.getString(2);
		email=rs.getString(3);
		branchcode=rs.getString(4);
		status1=rs.getString(5);
		remarks1=rs.getString(6);
		
		Q=applicationno+"|"+cid+"|"+email+"|"+branchcode;
	}
	else
	{
		Q="error";
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