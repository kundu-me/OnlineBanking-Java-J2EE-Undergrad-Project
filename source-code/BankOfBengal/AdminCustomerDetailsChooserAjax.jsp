<%@ page language="java"
	contentType="application/x-www-form-urlencoded; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%@	page
	import="java.sql.Connection ,
				     java.sql.DriverManager ,
					 java.sql.PreparedStatement ,
					 java.sql.ResultSet ,
					 java.sql.SQLException"%>

<%  

String qString=request.getParameter("w");
String queryString="";
String[] q=qString.split(",");

String state=q[0];
String city=q[1];
String bnameS=q[2];
String bcode=q[4];
String bnameT=q[5];
String cid=q[6];
String ano=q[7];
int i=0;
String Q="";
boolean a=!(state.equals("x"));
boolean b=!(city.equals("x"));
boolean c=!(bnameS.equals("x"));

boolean d=!(bcode.equals("x"));
boolean e=!(bnameT.equals("x"));
boolean f=!(cid.equals("x"));
boolean g=!(ano.equals("x"));

String customerid;
String accountno;
String name,salutation,fname,mname,lname;
String brcode,brname;
String branch;
String address,contact,gender;
String brstate;
String brcity;
String status;

int SIZE=100;
Connection con=null;
PreparedStatement pst=null;
ResultSet rs=null;
String sql=null;
String sqlFinalQuery=null;

try
{
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");
	if(g==true)
	{
		Q="";
		accountno=ano;
		customerid="";
		status="";
		sql="select cid,status from customeraccount where ano=?";
		pst=con.prepareStatement(sql);
		pst.setString(1,accountno);
		rs=pst.executeQuery();
		if(rs.next())
		{
			customerid=rs.getString(1);
			status=rs.getString(2);
		}
		if(customerid.length()<0 || status.length()<0)
		{
			Q="X";
		}
		else
		{
			sql="select a.cid,a.salutation,a.fname,a.mname,a.lname,a.branchcode,a.gender,a.homeno,a.street,a.landmark,"+
		    "a.district,a.state,a.city,a.pincode,a.email,a.mcode,a.mobile,a.lcode,a.landline,"+
		    "b.branchname,b.branchstate,b.branchcity from personaldetails as a,branchdetails as b,"+
			"where a.branchcode=b.branchcode and a.cid=? and a.status=?";
			pst=con.prepareStatement(sql);
			pst.setString(1,customerid);
			pst.setString(2,"true");
			rs=pst.executeQuery();
		
			if(rs.next())
			{
			
				customerid=rs.getString(1);
				salutation=rs.getString(2);
				fname=rs.getString(3);
				mname=rs.getString(4);
				lname=rs.getString(5);
				brcode=rs.getString(6);
				gender=rs.getString(7);
				address=rs.getString(8)+" "+rs.getString(9)+" "+rs.getString(10)+", DISTRICT: "+rs.getString(11)+", STATE: "+
					", CITY: "+rs.getString(12)+", PINCODE: "+rs.getString(13);
				contact="EMAIL: "+rs.getString(14)+", MOBILE: "+rs.getString(15)+"-"+rs.getString(16)+
					", LANDLINE: "+rs.getString(17)+"-"+rs.getString(18);
				brname=rs.getString(19);
				brstate=rs.getString(20);
				brcity=rs.getString(21);
			
				name=salutation+" "+fname+" ";
				if(mname.length()>0)
				{
					name+=mname+" ";
				}
				name+=lname+" ( "+gender+" )";
			
				branch="CODE: "+brcode+", NAME: "+brname+", STATE: "+brstate+", CITY: "+brcity;
				Q=customerid+"|"+accountno+"|"+name+"|"+contact+"|"+address+"|"+status+"|"+branch+"=";
					
			}
		}
						
	}
	else if(f==true)
	{		
		customerid=cid;
		status="";
		sql="select status from accountstatus where cid=?";
		pst=con.prepareStatement(sql);
		pst.setString(1,customerid);
		rs=pst.executeQuery();
		if(rs.next())
		{
			status=rs.getString(1);
		}
		if(status.equalsIgnoreCase("verified and account number alloted"))
		{
			sql="select acountno,status from customeraccount where cid=?";
			pst=con.prepareStatement(sql);
			pst.setString(1,customerid);
			rs=pst.executeQuery();
			if(rs.next())
			{
				accountno=rs.getString(1);
				status+=" and "+rs.getString(2);
			}
		}
		else
		{
			accountno="Not Alloted";
		}
		
		sqlFinalQuery="select a.cid,a.salutation,a.fname,a.mname,a.lname,a.branchcode,"+
						"b.branchname,b.branchstate,branchcity from personaldetails as a,branchdetails as b,"+
						"where a.branchcode=b.branchcode and a.cid=?";
		pst=con.prepareStatement(sql);
		pst.setString(1,customerid);
		
	}


}
catch(ClassNotFoundException e1)
{
	e1.printStackTrace();
}
catch(SQLException e1)
{
	e1.printStackTrace();
}
catch(Exception e1)
{
	e1.printStackTrace();
}
finally
{
	try
	{
		if(con!=null)
		con.close();
	}
	catch(SQLException e1)
	{
		e1.printStackTrace();
	}
}

%>
<%=Q %>