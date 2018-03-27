package org.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

public class FixedDepositDetailsDAO {

	public FixedDepositDetailsDAO() {
		// TODO Auto-generated constructor stub
	}

	public int getSerialNo()
	{
		int serial=-1;

		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql=null;
		int i;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");

			i=0;
			sql="select * from fixeddepositdetails";
			pst=con.prepareStatement(sql);
			rs=pst.executeQuery();
			while(rs.next())
			{
				i=i+1;
			}
			serial=i+1;
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
				return serial;

			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
		}

		return serial;
	}




	public String setTransactionDetails(String accountno,String branchcode, String ctype,String cage,String name,
										String dob1,String nationality,String uidlabel,String uidno,
										String caddress,String paddress,String mobile,String landline,
										String email,String it,String itno)
	{
		Connection con=null;
		String fid="";
		int serialNo=getSerialNo();
		String serial=serialNo+"";
		
		fid="FD";
		if(branchcode.length()==1)
		{
			fid+="000"+branchcode;
		}
		else if(branchcode.length()==2)
		{
			fid+="00"+branchcode;
		}
		else if(branchcode.length()==3)
		{
			fid+="0"+branchcode;
		}
		else if(branchcode.length()==4)
		{
			fid+=branchcode;
		}
		else if(branchcode.length()>=5)
		{
			fid+=branchcode;
		}
		
		if(serial.length()==1)
		{
			fid+="00000"+serial;
		}
		else if(serial.length()==2)
		{
			fid+="0000"+serial;
		}
		else if(serial.length()==3)
		{
			fid+="000"+serial;
		}
		else if(serial.length()==4)
		{
			fid+="00"+serial;
		}
		else if(serial.length()==5)
		{
			fid+="0"+serial;
		}
		else if(serial.length()==6)
		{
			fid+=serial;
		}
		else if(serial.length()>=7)
		{
			fid+=serial;
		}

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
			String status="true";
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");
			sql="insert into fixeddepositdetails values( ?,?,?,?,?,?,?,?,?,?," +
													"?,?,?,?,?,?,?,?)";
			pst=con.prepareStatement(sql);
			pst.setString(1,fid);
			pst.setString(2,accountno);
			pst.setString(3,branchcode);
			pst.setString(4,ctype);
			pst.setString(5,cage);
			pst.setString(6,name);
			pst.setDate(7,dob);
			pst.setString(8,nationality);
			pst.setString(9,uidlabel);
			pst.setString(10,uidno);
			pst.setString(11,caddress);
			pst.setString(12,paddress);
			pst.setString(13,mobile);
			pst.setString(14,landline);
			pst.setString(15,email);
			pst.setString(16,it);
			pst.setString(17,itno);
			pst.setString(18,status);
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
					return fid;
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
		return fid;
	}

	public boolean updateStatus(String fid,String status)
	{
		
		Connection con=null;
		PreparedStatement pst=null;
		String sql=null;
		int value=0;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");
			sql="update fixeddepositdetails set status=? where fid=?";
			pst=con.prepareStatement(sql);
			pst.setString(1, status);
			pst.setString(2, fid);
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
				else
				{
					return false;
				}

			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
		}


		return false;

	}
	
}
