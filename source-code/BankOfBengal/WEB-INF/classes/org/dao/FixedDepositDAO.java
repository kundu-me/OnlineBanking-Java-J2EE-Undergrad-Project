package org.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

public class FixedDepositDAO {

	public FixedDepositDAO() {
		// TODO Auto-generated constructor stub
	}

	public ArrayList<org.bean.FixedDeposit> getAllFixedDepositDetails()
	{
		
		org.bean.FixedDeposit fd=null;
		ArrayList<org.bean.FixedDeposit> list=new ArrayList<org.bean.FixedDeposit>();
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");
			sql="select * from fixeddeposit";
			pst=con.prepareStatement(sql);
			rs=pst.executeQuery();
			while(rs.next())
			{
				fd=new org.bean.FixedDeposit();
				fd.setTransactionid(rs.getString(1));
				fd.setFid(rs.getString(2));
				fd.setAccountno(rs.getString(3));
				fd.setBranchcode(rs.getString(4));
				fd.setEmail(rs.getString(5));
				fd.setAmount(rs.getDouble(6));
				fd.setInterest(rs.getDouble(7));
				fd.setPrematurepenalty(rs.getDouble(8));
				fd.setTerm(rs.getInt(9));
				fd.setStart_date(rs.getDate(10).toString());
				fd.setEnd_date(rs.getDate(11).toString());
				fd.setTransactiontimestamp(rs.getTimestamp(12).toString());
				fd.setStatus(rs.getString(13));
				list.add(fd);
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
					
					return list;

				}
				catch(SQLException e)
				{
					e.printStackTrace();
				}
		}


		return list;
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
			sql="select * from fixeddeposit";
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

	public int getFDTerm(String tid)
	{
		int term=0;
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
			sql="select term from fixeddeposit where transactionid=?";
			pst=con.prepareStatement(sql);
			pst.setString(1, tid);
			rs=pst.executeQuery();
			while(rs.next())
			{
				term=rs.getInt(1);
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
				return term;

			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
		}

		return term;
	}


	public String setFixedDepositRequest(String fid,String accountno,String branchcode,String email,double amount,double interest,double penalty,int term)
	{
		String status="verification pending";
		int serialNo=getSerialNo();
		String serial=serialNo+"";
		String transactionid="";
		String tid="TRANSFD";
		
		if(branchcode.length()==1)
		{
			tid+="000"+branchcode;
		}
		else if(branchcode.length()==2)
		{
			tid+="00"+branchcode;
		}
		else if(branchcode.length()==3)
		{
			tid+="0"+branchcode;
		}
		else if(branchcode.length()==4)
		{
			tid+=branchcode;
		}
		else if(branchcode.length()>=5)
		{
			tid+=branchcode;
		}
		
		if(serial.length()==1)
		{
			tid+="00000"+serial;
		}
		else if(serial.length()==2)
		{
			tid+="0000"+serial;
		}
		else if(serial.length()==3)
		{
			tid+="000"+serial;
		}
		else if(serial.length()==4)
		{
			tid+="00"+serial;
		}
		else if(serial.length()==5)
		{
			tid+="0"+serial;
		}
		else if(serial.length()==6)
		{
			tid+=serial;
		}
		else if(serial.length()>=7)
		{
			tid+=serial;
		}

		transactionid=tid;

		Connection con=null;
		PreparedStatement pst=null;
		String sql=null;
		int value=0;
		String start="CURDATE()";
		String end="DATE_ADD(CURDATE() ,INTERVAL "+term+" DAY)";
		String stamp="CURRENT_TIMESTAMP()";
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");
			sql="insert into fixeddeposit values(?,?,?,?,?,"+
												"?,?,?,?,"+
												start+","+end+","+stamp+","
												+ "?)";
			pst=con.prepareStatement(sql);
			pst.setString(1, transactionid);
			pst.setString(2, fid);
			pst.setString(3, accountno);
			pst.setString(4, branchcode);
			pst.setString(5, email);
			pst.setDouble(6, amount);
			pst.setDouble(7, interest);
			pst.setDouble(8, penalty);
			pst.setInt(9, term);
			pst.setString(10,status);
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
					return transactionid;
				}

			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
		}


		return transactionid;

	}

	public boolean updateStatus(String transactionid,String status)
	{
		
		Connection con=null;
		PreparedStatement pst=null;
		String sql=null;
		int value=0;
		int term=getFDTerm(transactionid);
		String start="CURDATE()";
		String end="DATE_ADD(CURDATE() ,INTERVAL "+term+" DAY)";
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");
			sql="update fixeddeposit set status=?,start_date="+start+" ,end_date="+end+" where transactionid=?";
			pst=con.prepareStatement(sql);
			pst.setString(1, status);
			pst.setString(2, transactionid);
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

	public boolean updateMatureStatus(String transactionid,String status)
	{
		
		Connection con=null;
		PreparedStatement pst=null;
		String sql=null;
		int value=0;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");
			sql="update fixeddeposit set status=? where transactionid=?";
			pst=con.prepareStatement(sql);
			pst.setString(1, status);
			pst.setString(2, transactionid);
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
