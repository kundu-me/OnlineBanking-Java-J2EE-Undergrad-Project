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
String queryString="";

String branchcode=qString;
int i;
int SIZE=100;
Connection con=null;
PreparedStatement pst=null;
ResultSet rs=null;
String sql=null;

try
{
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");
	
	sql="select branchname from branchdetails where branchcode=?";
	pst=con.prepareStatement(sql);
	pst.setString(1,branchcode);

	rs=pst.executeQuery();
	
	i=-1;
	while(rs.next())
	{
		i=i+1;
		queryString=rs.getString(1);
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
<%=queryString %>