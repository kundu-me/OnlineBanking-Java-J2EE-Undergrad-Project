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
String[] q=qString.split(",");

String branchstate=q[0];
String branchcity=q[1];

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
	
	sql="select branchcode from branchdetails where branchstate=? and branchcity=? and status=? order by branchname";
	pst=con.prepareStatement(sql);
	pst.setString(1,branchstate);
	pst.setString(2, branchcity);
	pst.setString(3,"true");
	
	rs=pst.executeQuery();
	
	i=-1;
	while(rs.next())
	{
		i=i+1;
		queryString+=rs.getString(1)+",";
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