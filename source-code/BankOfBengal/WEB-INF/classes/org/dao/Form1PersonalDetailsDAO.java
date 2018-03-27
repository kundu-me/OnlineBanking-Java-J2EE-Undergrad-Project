/**
 * 
 */
package org.dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import org.bean.Form1PersonalDetails;
/**
 * @author Nirmallya Kundu
 *
 */
public class Form1PersonalDetailsDAO {

	/**
	 * 
	 */
	public Form1PersonalDetailsDAO() {
		// TODO Auto-generated constructor stub
	}

	public boolean setForm1PersonalDetails(int applicationno, String cid, String branchcode,String ctype, String cage,
			String salutation, String fname, String mname, String lname, String guardian, String gsalutation, String gname,
			String dob1, String gender, String nationality, String maiden, String marital, String uidlabel,
			String uidno, String homeno, String street, String landmark, String district, String city, String state,
			String pincode, String addsame, String xhomeno, String xstreet, String xlandmark, String xdistrict, String xcity,
			String xstate, String xpincode, String mcode, String mobile, String lcode, String landline,
			String eid, String edomain,String email,String dor1,String status)
	{
		Connection con=null;
		PreparedStatement pst=null;
		int value=0;
		String sql=null;
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date dob2 = null;
		java.sql.Date dob=null;
		try 
		{
		     dob2 = simpleDateFormat.parse(dob1);
		     dob=new java.sql.Date(dob2.getTime());
		}
		catch (java.text.ParseException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date dor2 = null;
		java.sql.Date dor=null;
		try 
		{
		     dor2 = simpleDateFormat.parse(dor1);
		     dor=new java.sql.Date(dor2.getTime());
		}
		catch (java.text.ParseException e)
		{
		     e.printStackTrace();
		}
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");
			sql="insert into personaldetails values( ?,?,?,?,?,?,?,?,?,?," +
													"?,?,?,?,?,?,?,?,?,?," +
													"?,?,?,?,?,?,?,?,?,?," +
													"?,?,?,?,?,?,?,?,?,?," +
													"?,?,?)";
			pst=con.prepareStatement(sql);
			pst.setInt(1,applicationno);
			pst.setString(2,cid);
			pst.setString(3,branchcode);
			pst.setString(4,ctype);
			pst.setString(5,cage);
			pst.setString(6,salutation);
			pst.setString(7,fname);
			pst.setString(8,mname);
			pst.setString(9,lname);
			pst.setString(10,guardian);
			pst.setString(11,gsalutation);
			pst.setString(12,gname);
			pst.setDate(13,dob);
			pst.setString(14,gender);
			pst.setString(15,nationality);
			pst.setString(16,maiden);
			pst.setString(17,marital);
			pst.setString(18,uidlabel);
			pst.setString(19,uidno);
			pst.setString(20,homeno);
			pst.setString(21,street);
			pst.setString(22,landmark);
			pst.setString(23,district);
			pst.setString(24,city);
			pst.setString(25,state);
			pst.setString(26,pincode);
			pst.setString(27,addsame);
			pst.setString(28,xhomeno);
			pst.setString(29,xstreet);
			pst.setString(30,xlandmark);
			pst.setString(31,xdistrict);
			pst.setString(32,xcity);
			pst.setString(33,xstate);
			pst.setString(34,xpincode);
			pst.setString(35,mcode);
			pst.setString(36,mobile);
			pst.setString(37,lcode);
			pst.setString(38,landline);
			pst.setString(39,eid);
			pst.setString(40,edomain);
			pst.setString(41,email);
			pst.setDate(42,dor);
			pst.setString(43,status);
			value=pst.executeUpdate();

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
					
				if(value!=0)
				{
					return true;
				}
				

			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		return false;
	}

	public boolean updateContactDetails(String cid, String salutation, String fname, String mname, String lname, 
			String homeno, String street, String landmark, String district, String city, String state,
			String pincode, String addsame, String xhomeno, String xstreet, String xlandmark, String xdistrict, String xcity,
			String xstate, String xpincode, String mcode, String mobile, String lcode, String landline,
			String eid, String edomain,String email)
	{
		Connection con=null;
		PreparedStatement pst=null;
		int[] value=new int[10];
		
		String sql=null;
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");
			
			sql="update personaldetails set "+
				"salutation=?,fname=?,mname=?,lname=? where cid=?";
			pst=con.prepareStatement(sql);
			pst.setString(1,salutation);
			pst.setString(2,fname);
			pst.setString(3,mname);
			pst.setString(4,lname);
			pst.setString(5,cid);
			value[0]=pst.executeUpdate();
			
			sql="update personaldetails set "+
				"homeno=?,street=?,landmark=?,district=?,city=?,state=?,pincode=? where cid=?";
			pst=con.prepareStatement(sql);
			pst.setString(1,homeno);
			pst.setString(2,street);
			pst.setString(3,landmark);
			pst.setString(4,district);
			pst.setString(5,city);
			pst.setString(6,state);
			pst.setString(7,pincode);
			pst.setString(8,cid);
			value[1]=pst.executeUpdate();
			
			sql="update personaldetails set "+
					"addsame=?,xhomeno=?,xstreet=?,xlandmark=?,xdistrict=?,xcity=?,xstate=?,xpincode=? where cid=?";
			pst=con.prepareStatement(sql);
			pst.setString(1,addsame);
			pst.setString(2,xhomeno);
			pst.setString(3,xstreet);
			pst.setString(4,xlandmark);
			pst.setString(5,xdistrict);
			pst.setString(6,xcity);
			pst.setString(7,xstate);
			pst.setString(8,xpincode);
			pst.setString(9,cid);
			value[2]=pst.executeUpdate();
			
			sql="update personaldetails set "+
					"mcode=?,mobile=?,lcode=?,landline=?,eid=?,edomain=?,email=? where cid=?";
			pst=con.prepareStatement(sql);
			pst.setString(1,mcode);
			pst.setString(2,mobile);
			pst.setString(3,lcode);
			pst.setString(4,landline);
			pst.setString(5,eid);
			pst.setString(6,edomain);
			pst.setString(7,email);
			pst.setString(8,cid);
			value[3]=pst.executeUpdate();
			
			sql="update customeraccount set "+
					"email=? where cid=?";
			pst=con.prepareStatement(sql);
			pst.setString(1,email);
			pst.setString(2,cid);
			value[4]=pst.executeUpdate();
			
			sql="update applicationstatus set "+
					"email=? where cid=?";
			pst=con.prepareStatement(sql);
			pst.setString(1,email);
			pst.setString(2,cid);
			value[5]=pst.executeUpdate();
			
			CustomerAccountDAO acc=new CustomerAccountDAO();
			String accountno=acc.getAccountNoFromCID(cid);
			sql="update moneytransfer set "+
					"email=? where sender_accountno=?";
			pst=con.prepareStatement(sql);
			pst.setString(1,email);
			pst.setString(2,accountno);
			value[6]=pst.executeUpdate();
			
			sql="update fixeddeposit set "+
					"email=? where accountno=?";
			pst=con.prepareStatement(sql);
			pst.setString(1,email);
			pst.setString(2,accountno);
			value[7]=pst.executeUpdate();
		
			sql="update fixeddepositdetails set "+
					"email=? where accountno=?";
			pst=con.prepareStatement(sql);
			pst.setString(1,email);
			pst.setString(2,accountno);
			value[8]=pst.executeUpdate();
		
		
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
					
					return true;
			
			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		return true;
	}

	public Form1PersonalDetails getForm1PersonalDetails(String cid)
	{

		Form1PersonalDetails form1PersonalDetails=null;
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql=null;
		try
		{
			
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");

			sql="select * from personaldetails where cid=? and status=?";
			pst=con.prepareStatement(sql);
			pst.setString(1,cid);
			pst.setString(2, "true");
			rs=pst.executeQuery();

			if(rs.next())
			{
				form1PersonalDetails=new Form1PersonalDetails();
				form1PersonalDetails.setApplicationno(rs.getInt(1));
				form1PersonalDetails.setCid(rs.getString(2));
				form1PersonalDetails.setBranchcode(rs.getString(3));
				form1PersonalDetails.setCtype(rs.getString(4));
				form1PersonalDetails.setCage(rs.getString(5));
				form1PersonalDetails.setSalutation(rs.getString(6));
				form1PersonalDetails.setFname(rs.getString(7));
				form1PersonalDetails.setMname(rs.getString(8));
				form1PersonalDetails.setLname(rs.getString(9));
				form1PersonalDetails.setGuardian(rs.getString(10));
				form1PersonalDetails.setGsalutation(rs.getString(11));
				form1PersonalDetails.setGname(rs.getString(12));
				
				//
				
				form1PersonalDetails.setGender(rs.getString(14));
				form1PersonalDetails.setNationality(rs.getString(15));
				form1PersonalDetails.setMaiden(rs.getString(16));
				form1PersonalDetails.setMarital(rs.getString(17));
				form1PersonalDetails.setUidlabel(rs.getString(18));
				form1PersonalDetails.setUidno(rs.getString(19));
				form1PersonalDetails.setHomeno(rs.getString(20));
				form1PersonalDetails.setStreet(rs.getString(21));
				form1PersonalDetails.setLandmark(rs.getString(22));
				form1PersonalDetails.setDistrict(rs.getString(23));
				form1PersonalDetails.setCity(rs.getString(24));
				form1PersonalDetails.setState(rs.getString(25));
				form1PersonalDetails.setPincode(rs.getString(26));
				form1PersonalDetails.setAddsame(rs.getString(27));
				form1PersonalDetails.setXhomeno(rs.getString(28));
				form1PersonalDetails.setXstreet(rs.getString(29));
				form1PersonalDetails.setXlandmark(rs.getString(30));
				form1PersonalDetails.setXdistrict(rs.getString(31));
				form1PersonalDetails.setXcity(rs.getString(32));
				form1PersonalDetails.setXstate(rs.getString(33));
				form1PersonalDetails.setXpincode(rs.getString(34));
				form1PersonalDetails.setMcode(rs.getString(35));
				form1PersonalDetails.setMobile(rs.getString(36));
				form1PersonalDetails.setLcode(rs.getString(37));
				form1PersonalDetails.setLandline(rs.getString(38));
				form1PersonalDetails.setEid(rs.getString(39));
				form1PersonalDetails.setEdomain(rs.getString(40));
				form1PersonalDetails.setEmail(rs.getString(41));
				
				//
				
				form1PersonalDetails.setStatus(rs.getString(43));
				
				java.sql.Date dob1=(rs.getDate(13));
				java.util.Date dob2=dob1;
				DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");  
				String dob = dateFormat.format(dob2);  
				form1PersonalDetails.setDob(dob);
				
				java.sql.Date dor1=(rs.getDate(42));
				java.util.Date dor2=dor1;
				dateFormat = new SimpleDateFormat("dd-MM-yyyy");  
				String dor = dateFormat.format(dor2);  
				form1PersonalDetails.setDor(dor);
				
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

		return form1PersonalDetails;
		
	}
	public int getForm1applicationno(String cid)
	{
		int returnValue=-1;
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");

			sql="select applicationno from personaldetails where cid=?";
			pst=con.prepareStatement(sql);
			pst.setString(1,cid);
			rs=pst.executeQuery();

			if(rs.next())
			{
				returnValue=rs.getInt(1);
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

		return returnValue;
		
	}
	public String getEmail(String cid)
	{
		String retEmail="";
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");

			sql="select email from personaldetails where cid=?";
			pst=con.prepareStatement(sql);
			pst.setString(1,cid);
			rs=pst.executeQuery();

			if(rs.next())
			{
				retEmail=rs.getString(1);
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
				return retEmail;
				

			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
		}
		return retEmail;
	}
	public String getFname(String cid)
	{
		String retFname="";
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");

			sql="select fname from personaldetails where cid=?";
			pst=con.prepareStatement(sql);
			pst.setString(1,cid);
			rs=pst.executeQuery();

			if(rs.next())
			{
				retFname=rs.getString(1);
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
				return retFname;
				

			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
		}
		return retFname;
	}
	public String getCtype(String cid)
	{
		String retCtype="";
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");

			sql="select ctype from personaldetails where cid=?";
			pst=con.prepareStatement(sql);
			pst.setString(1,cid);
			rs=pst.executeQuery();

			if(rs.next())
			{
				retCtype=rs.getString(1);
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
				return retCtype;
				

			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
		}
		return retCtype;
	}
	
	public String getCage(String cid)
	{
		String retCage="";
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");

			sql="select cage from personaldetails where cid=?";
			pst=con.prepareStatement(sql);
			pst.setString(1,cid);
			rs=pst.executeQuery();

			if(rs.next())
			{
				retCage=rs.getString(1);
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
				return retCage;
				

			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
		}
		return retCage;
	}

	public boolean updateStatus(String cid,String status)
	{
		Connection con=null;
		PreparedStatement pst=null;
		int value=0;
		String sql=null;

		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");
			sql="update personaldetails set status=? where cid=?";
			pst=con.prepareStatement(sql);
			pst.setString(1,status);
			pst.setString(2,cid);
			value=pst.executeUpdate();
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

				if(value!=0)
				{
					return true;
				}


			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}

		return true;
	}
	
	public boolean isEntry(String cid)
	{
		int returnValue=-1;
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");

			sql="select * from personaldetails where cid=?";
			pst=con.prepareStatement(sql);
			pst.setString(1,cid);
			rs=pst.executeQuery();

			if(rs.next())
			{
				returnValue=1;
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

				if(returnValue==1)
				{
					return true;
				}
			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
		}

		return false;
		
	}

	public boolean updateForm1PersonalDetails(String cid,String ctype, String cage,
			String salutation, String fname, String mname, String lname, String guardian, String gsalutation, String gname,
			String dob1, String gender, String nationality, String maiden, String marital, String uidlabel,
			String uidno, String homeno, String street, String landmark, String district, String city, String state,
			String pincode, String addsame, String xhomeno, String xstreet, String xlandmark, String xdistrict, String xcity,
			String xstate, String xpincode, String mcode, String mobile, String lcode, String landline,
			String eid, String edomain,String email)
	{
		Connection con=null;
		PreparedStatement pst=null;
		int value=0;
		String sql=null;
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date dob2 = null;
		java.sql.Date dob=null;
		try 
		{
		     dob2 = simpleDateFormat.parse(dob1);
		     dob=new java.sql.Date(dob2.getTime());
		}
		catch (java.text.ParseException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");
			sql="update personaldetails set ctype=?,cage=?,salutation=?,fname=?, mname=?,lname=?,"+
			    "guardian=?,gsalutation=?,gname=?, dob=?,gender=?,nationality=?,maiden=?,marital=?,uidlabel=?,"+
			    "uidno=?,homeno=?, street=?,landmark=?,district=?,city=?,state=?,pincode=?,addsame=?,"+
			    "xhomeno=?,xstreet=?, xlandmark=?, xdistrict=?,xcity=?, xstate=?,xpincode=?,"+
			    "mcode=?, mobile=?,lcode=?,landline=?,eid=?, edomain=?, email=? where cid=? and status=?";
			pst=con.prepareStatement(sql);
		
			pst.setString(1,ctype);
			pst.setString(2,cage);
			pst.setString(3,salutation);
			pst.setString(4,fname);
			pst.setString(5,mname);
			pst.setString(6,lname);
			pst.setString(7,guardian);
			pst.setString(8,gsalutation);
			pst.setString(9,gname);
			pst.setDate(10,dob);
			pst.setString(11,gender);
			pst.setString(12,nationality);
			pst.setString(13,maiden);
			pst.setString(14,marital);
			pst.setString(15,uidlabel);
			pst.setString(16,uidno);
			pst.setString(17,homeno);
			pst.setString(18,street);
			pst.setString(19,landmark);
			pst.setString(20,district);
			pst.setString(21,city);
			pst.setString(22,state);
			pst.setString(23,pincode);
			pst.setString(24,addsame);
			pst.setString(25,xhomeno);
			pst.setString(26,xstreet);
			pst.setString(27,xlandmark);
			pst.setString(28,xdistrict);
			pst.setString(29,xcity);
			pst.setString(30,xstate);
			pst.setString(31,xpincode);
			pst.setString(32,mcode);
			pst.setString(33,mobile);
			pst.setString(34,lcode);
			pst.setString(35,landline);
			pst.setString(36,eid);
			pst.setString(37,edomain);
			pst.setString(38,email);
			pst.setString(39,cid);
			pst.setString(40,"true");
			value=pst.executeUpdate();

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
					
				if(value!=0)
				{
					return true;
				}
				

			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		return true;
	}

}
