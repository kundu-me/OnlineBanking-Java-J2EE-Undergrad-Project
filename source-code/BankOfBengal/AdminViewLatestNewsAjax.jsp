<%@page import="org.dao.NewsDAO"%>
<%@ page language="java" contentType="application/x-www-form-urlencoded; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@	page import="java.sql.Connection ,
				     java.sql.DriverManager ,
					 java.sql.PreparedStatement ,
					 java.sql.ResultSet ,
					 java.sql.SQLException"
%>
<%
org.dao.NewsDAO news=new org.dao.NewsDAO();

String qString=request.getParameter("w");
String Q="";
String status=qString;
String str="";
int count=0,i=0,j=0;

Connection con=null;
PreparedStatement pst=null;
ResultSet rs=null;
String sql=null;
int serial;
String heading,details,status1;

try
{
	
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");

	sql="select * from news where status=?";
	pst=con.prepareStatement(sql);
	pst.setString(1,status);
	rs=pst.executeQuery();
	i=0;
	j=0;
	while(rs.next())
	{
		i=i+1;
		serial=rs.getInt(1);
		heading=rs.getString(2);
		details=rs.getString(3);
		status1=rs.getString(4);
		
		str+=serial+"|"+heading+"|"+details+"=";
	}
	count=i;
	if(count==0)
	{
		str="x";
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
<%=str %>