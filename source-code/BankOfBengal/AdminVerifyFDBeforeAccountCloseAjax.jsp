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
String[] details=qString.split(",");
String status=details[0];
String accountno=details[1];
int SIZE=100;
String[] S=new String[SIZE];
int count=0;
Connection con=null;
PreparedStatement pst=null;
ResultSet rs=null;
String sql=null;
int i=0;
try
{
	
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");

	sql="select transactionid,fid,accountno,amount,branchcode,transactiontimestamp from fixeddeposit where status=? and accountno=?";
	pst=con.prepareStatement(sql);
	pst.setString(1,status);
	pst.setString(2,accountno);
	
	rs=pst.executeQuery();
	i=0;
	while(rs.next())
	{
		i=i+1;
		String tid=rs.getString(1);
		String fid=rs.getString(2);
		accountno=rs.getString(3);
		double amount=rs.getDouble(4);
		String branchcode=rs.getString(5);
		String time=rs.getTimestamp(6).toString();
		
		S[i]=tid+"|"+fid+"|"+accountno+"|"+amount+"|"+branchcode+"|"+time+"=";
	}
	count=i;
	
	for(int j=1;j<=count;j++)
	{
		Q+=S[j];
		
	}

	if(Q.length()<2)
	{
		Q="x";
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