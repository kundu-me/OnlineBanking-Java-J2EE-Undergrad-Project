<%@page import="org.dao.Form1PersonalDetailsDAO"%>
<%@ page language="java" contentType="application/x-www-form-urlencoded; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@	page import="java.sql.Connection ,
				     java.sql.DriverManager ,
					 java.sql.PreparedStatement ,
					 java.sql.ResultSet ,
					 java.sql.SQLException"
%>
<%
org.dao.ApplicationStatusDAO app=new org.dao.ApplicationStatusDAO();

String qString=request.getParameter("w");
String Q="";
String status=qString;
int SIZE=100;
String[] S=new String[SIZE];
String[] C=new String[SIZE];
int count=0;
Connection con=null;
PreparedStatement pst=null;
ResultSet rs=null;
String sql=null;
int applicationno;
int i=0;
int X[]=new int[SIZE];
String cid,email,branchcode,status1,remarks1;
org.dao.Form1PersonalDetailsDAO f1=new org.dao.Form1PersonalDetailsDAO();
org.dao.Form2AdditionalDetailsDAO f2=new org.dao.Form2AdditionalDetailsDAO();
org.dao.Form3PersonalIdentificationDAO f3=new org.dao.Form3PersonalIdentificationDAO();
try
{
	
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");

	sql="select * from applicationstatus where status=?";
	pst=con.prepareStatement(sql);
	pst.setString(1,status);
	rs=pst.executeQuery();
	i=0;
	while(rs.next())
	{
		i=i+1;
		applicationno=rs.getInt(1);
		cid=rs.getString(2);
		email=rs.getString(3);
		branchcode=rs.getString(4);
		status1=rs.getString(5);
		remarks1=rs.getString(6);
		
		C[i]=cid;
		S[i]=applicationno+"|"+cid+"|"+email+"|"+branchcode+"|"+status1+"=";
	}
	count=i;
	
	for(int j=1;j<=count;j++)
	{
		String checkCID=C[j];
		boolean check1=f1.isEntry(checkCID);
		boolean check2=f2.isEntry(checkCID);
		boolean check3=f3.isEntry(checkCID);
		if(check1==true && check2==true && check3==true)
		{
			X[j]=1;
		}
		else
		{
			X[j]=0;
		}
	}
	for(int j=1;j<=count;j++)
	{
		if(X[j]==1)
		{
			Q+=S[j];
		}
	}
	
	for(int j=1;j<=count;j++)
	{
		if(X[j]==0)
		{
			String xCID=C[j];
			String xStatus="application incomplete";
			String xRemarks="Please Fill Up A New Application Form !";
			app.updateStatusAndRemarks(xCID, xStatus, xRemarks);
			
			org.bean.SendEmail emailToCustomer=new org.bean.SendEmail();
			String name=f1.getFname(xCID);
			String to=f1.getEmail(xCID);
			String sub="APPLICATION INCOMPLETE";
			String msg="Dear "+name+",\n"
					+"Your Application with Customer ID - "+xCID+" is Incomplete.\n"
					+"You need to re - apply with new Application Form.";
			emailToCustomer.sendEmail(to, sub, msg); 
		}
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