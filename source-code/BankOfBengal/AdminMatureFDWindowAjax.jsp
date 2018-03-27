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
String fid=qString;
double interestAmount=0;
double penaltyAmount=0;
double totalAmount=0;
Connection con=null;
PreparedStatement pst=null;
ResultSet rs=null;
String sql=null;
String tid="";
try
{
	
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");

	sql="select transactionid from fixeddeposit where fid=?";
	pst=con.prepareStatement(sql);
	pst.setString(1,fid);
	rs=pst.executeQuery();
	if(rs.next())
	{
		tid=rs.getString(1);
	}
	
	sql="select fid,amount,interest,prematurepenalty,term,start_date,end_date,branchcode,transactiontimestamp from fixeddeposit where transactionid=?";
	pst=con.prepareStatement(sql);
	pst.setString(1,tid);
	rs=pst.executeQuery();
	if(rs.next())
	{
		String term="";
		fid=rs.getString(1);
		double amount=rs.getDouble(2);
		double interest=rs.getDouble(3);
		double penalty=rs.getDouble(4);
		int term1=rs.getInt(5);
		
		java.sql.Date sdate=rs.getDate(6);
		String start=rs.getDate(6).toString();
		
		String end=rs.getDate(7).toString();
		String branchcode=rs.getString(8);
		String stamp=rs.getTimestamp(9).toString();
		
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
		
		int term2=0;
		sql="select DATEDIFF(CURDATE(),?)";
		pst=con.prepareStatement(sql);
		pst.setDate(1,sdate);
		rs=pst.executeQuery();
		if(rs.next())
		{
			term2=rs.getInt(1);
		}
		
		interestAmount=((amount*interest*term2)/(365*100));
		penaltyAmount=((interestAmount*penalty)/100);
		totalAmount=amount+interestAmount-penaltyAmount;
				
		Q=tid+"|"+fid+"|"+amount+"|"+interest+"|"+penalty+"|"+term+"|"+start+"|"+end+"|"+
				interestAmount+"|"+penaltyAmount+"|"+totalAmount+"|"+branchcode+"|"+stamp+"|";
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
		   uidlabel+"|"+uidno+"|"+caddress+"|"+paddress+"|"+mobile+"|"+landline+"|"+email+"|"+it+"|"+itno+"|"+accountno;
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