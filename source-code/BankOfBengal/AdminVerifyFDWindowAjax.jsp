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
String fid="";
double matAmt=0;
try
{
	
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");

	sql="select fid,amount,interest,term,branchcode,transactiontimestamp from fixeddeposit where transactionid=?";
	pst=con.prepareStatement(sql);
	pst.setString(1,tid);
	rs=pst.executeQuery();
	if(rs.next())
	{
		String term="";
		fid=rs.getString(1);
		double amount=rs.getDouble(2);
		double interest=rs.getDouble(3);
		int term1=rs.getInt(4);
		String branchcode=rs.getString(5);
		String stamp=rs.getTimestamp(6).toString();
		
		if(term1>=30 && term1<365)
		{
			int m=term1/30;
			int d=term1-(m*30);
			term=m+" Months "+d+" Days";
		}
		if(term1>=365)
		{
			int y=term1/365;
			int m=(term1-(y*365))/30;
			int d=term1-(m*30);
			term=y+"Years "+m+" Months "+d+" Days";
		}

		matAmt=amount+((amount*interest*term1)/36500);
		Q=fid+"|"+amount+"|"+interest+"|"+term+"|"+branchcode+"|"+stamp+"|";
	}
	
	sql="select ctype,cage,name,dob,nationality,uidlabel,uidno,caddress,paddress,mobile,landline,email,it,itno,accountno from fixeddepositdetails where fid=?";
	pst=con.prepareStatement(sql);
	pst.setString(1,fid);
	rs=pst.executeQuery();
	if(rs.next())
	{
		String ctype=rs.getString(1);
		String cage=rs.getString(2);
		String name=rs.getString(3);
		String dob=rs.getDate(4).toString();
		String nationality=rs.getString(5);
		String uidlabel=rs.getString(6);
		String uidno=rs.getString(7);
		String caddress=rs.getString(8);
		String paddress=rs.getString(9);
		String mobile=rs.getString(10);
		String landline=rs.getString(11);
		String email=rs.getString(12);
		String it=rs.getString(13);
		String itno=rs.getString(14);
		String accountno=rs.getString(15);
		
		Q+=ctype+"|"+cage+"|"+name+"|"+dob+"|"+nationality+"|"+
		   uidlabel+"|"+uidno+"|"+caddress+"|"+paddress+"|"+mobile+"|"+landline+"|"+email+"|"+it+"|"+itno+"|"+accountno+"|"+matAmt;
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