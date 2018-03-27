<%@ page language="java" contentType="application/x-www-form-urlencoded; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@	page import="java.sql.Connection,
				     java.sql.DriverManager,
					 java.sql.PreparedStatement,
					 java.sql.ResultSet,
					 java.sql.SQLException"
%>
<%

String qString=request.getParameter("w");
String Q="";
String[] details=qString.split(",");
String cid=details[0];
String accountno=details[1];
Connection con=null;
PreparedStatement pst=null;
ResultSet rs=null;
String sql=null;
try
{
	
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");

	sql="select cid,accountno,branchcode,email,balance from customeraccount where accountno=? and cid=?";
	pst=con.prepareStatement(sql);
	pst.setString(1,accountno);
	pst.setString(2, cid);
	rs=pst.executeQuery();
	if(rs.next())
	{
		
				Q=rs.getString(1)+"|"+rs.getString(2)+"|"+rs.getString(3)+"|"+rs.getString(4)+"|"+rs.getString(5)+"|";
	}
	
	sql="select salutation,fname,mname,lname,mcode,mobile,lcode,landline from personaldetails where cid=?";
	pst=con.prepareStatement(sql);
	pst.setString(1,cid);
	rs=pst.executeQuery();
	if(rs.next())
	{
		String sal=rs.getString(1);
		String fname=rs.getString(2);
		String mname=rs.getString(3);
		String lname=rs.getString(4);
		String mcode=rs.getString(5);
		String mobile=rs.getString(6);
		String lcode=rs.getString(7);
		String landline=rs.getString(8);

		String name="";
		if(mname.equalsIgnoreCase("n/a"))
		{
			name=sal+" "+fname+" "+lname;
		}
		else
		{
			name=sal+" "+fname+" "+mname+" "+lname;
		}
		Q+=name+"|"+mcode+"-"+mobile+"|"+lcode+"-"+landline+"|";
	}
		
	sql="select it,itno from additionaldetails where cid=?";
	pst=con.prepareStatement(sql);
	pst.setString(1,cid);
	rs=pst.executeQuery();
	if(rs.next())
	{
		String it=rs.getString(1);
		String itno=rs.getString(2);
	    Q+=it+"|"+itno+"|";		
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