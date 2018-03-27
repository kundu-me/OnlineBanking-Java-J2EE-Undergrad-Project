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
String tid=qString;

Connection con=null;
PreparedStatement pst=null;
ResultSet rs=null;
String sql=null;

try
{
	
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");

	sql="select branchcode,email,sender_accountno,receiver_bank,receiver_accountno,amount,bankcharges,totalamount,transactiontimestamp from moneytransfer where transactionid=?";
	pst=con.prepareStatement(sql);
	pst.setString(1,tid);
	rs=pst.executeQuery();
	if(rs.next())
	{
		String branchcode=rs.getString(1);
		String email=rs.getString(2);
		String sender=rs.getString(3);
		String bank=rs.getString(4);
		String receiver=rs.getString(5);
		String amount=rs.getString(6);
		String bankcharges=rs.getString(7);
		String totalamount=rs.getString(8);
		String time=rs.getString(9);
		Q=tid+"|"+branchcode+"|"+sender+"|"+bank+"|"+receiver+"|"+amount+"|"+bankcharges+"|"+totalamount+"|"+time+"|"+email;
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