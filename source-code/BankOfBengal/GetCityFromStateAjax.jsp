<%@ page language="java" contentType="application/x-www-form-urlencoded; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@	page import="java.sql.Connection ,
				     java.sql.DriverManager ,
					 java.sql.PreparedStatement ,
					 java.sql.ResultSet ,
					 java.sql.SQLException"
%>
<%  
	
String branchstateValue=request.getParameter("w");

int i;
int SIZE=100;
Connection con=null;
PreparedStatement pst=null;
ResultSet rs=null;
String sql=null;
String[] city=new String[SIZE];
int countCity=0;
if(branchstateValue==null)
branchstateValue="West Bengal";

try
{
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");
	sql="select distinct city from stateandcity where state=? order by city";
	pst=con.prepareStatement(sql);
	pst.setString(1,branchstateValue);
	rs=pst.executeQuery();
	
	i=-1;
	while(rs.next())
	{
		i=i+1;
		city[i]=rs.getString(1);
	}
	countCity=i;
	
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

String cityString="";
for(int j=0;j<=countCity;j++)
{
	cityString+=city[j]+",";
}
%>
<%=cityString %>