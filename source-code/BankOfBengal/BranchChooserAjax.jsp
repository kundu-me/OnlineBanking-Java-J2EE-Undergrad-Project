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
String branchpincode=q[2];
String branchcode=q[3];

boolean a=branchstate.equals("x");
boolean b=branchcity.equals("x");
boolean c=branchpincode.equals("x");
boolean d=branchcode.equals("x");

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
	
	if(d==false)
	{		
		sql="select branchcode,branchname,branchstate, branchcity,branchpincode,branchaddress from branchdetails "+
			"where branchcode like ? and status=?";
		pst=con.prepareStatement(sql);
		pst.setString(1,"%"+branchcode+"%");
		pst.setString(2,"true");
	}
	
	else if(a==false && b==true && c==true)
	{		
		sql="select branchcode,branchname,branchstate, branchcity,branchpincode,branchaddress from branchdetails "+
			"where branchstate=? and status=?";
		pst=con.prepareStatement(sql);
		pst.setString(1,branchstate);
		pst.setString(2,"true");
	}
	else if(a==false && b==false && c==true)
	{		
		sql="select branchcode,branchname,branchstate, branchcity,branchpincode,branchaddress from branchdetails "+
			"where branchstate=? and branchcity=? and status=?";
		pst=con.prepareStatement(sql);
		pst.setString(1,branchstate);
		pst.setString(2, branchcity);
		pst.setString(3, "true");
	}
	else if(a==false && b==false && c==false)
	{		
		sql="select branchcode,branchname,branchstate, branchcity,branchpincode,branchaddress from branchdetails "+
			"where branchstate=? and branchcity=? and branchpincode like ? and status=?";
		pst=con.prepareStatement(sql);
		pst.setString(1,branchstate);
		pst.setString(2, branchcity);
		pst.setString(3,"%"+branchpincode+"%");
		pst.setString(4, "true");
	}
	else if(a==false && b==true && c==false)
	{		
		sql="select branchcode,branchname,branchstate, branchcity,branchpincode,branchaddress from branchdetails "+
			"where branchstate=? and branchpincode like ? and status=?";
		pst=con.prepareStatement(sql);
		pst.setString(1,branchstate);
		pst.setString(2,"%"+branchpincode+"%");
		pst.setString(3,"true");
	}
	else if(a==true && b==true && c==false)
	{		
		sql="select branchcode,branchname,branchstate, branchcity,branchpincode,branchaddress from branchdetails "+
			"where branchpincode like ? and status=?";
		pst=con.prepareStatement(sql);
		pst.setString(1,"%"+branchpincode+"%");
		pst.setString(2,"true");
	}
	else
	{
		sql="select branchcode,branchname,branchstate, branchcity,branchpincode,branchaddress from branchdetails where status=?";
		pst=con.prepareStatement(sql);
		pst.setString(1,"true");
	}
	
	rs=pst.executeQuery();
	
	i=-1;
	while(rs.next())
	{
		i=i+1;
		queryString+=rs.getString(1)+","+rs.getString(2)+","+rs.getString(3)+","+rs.getString(4)+
				     ","+rs.getString(5)+","+rs.getString(6)+"|";
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