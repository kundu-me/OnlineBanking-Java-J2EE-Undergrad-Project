/**
 * 
 */
package org.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

/**
 * @author Nirmallya
 *
 */
public class TransactionDetailsDAO {

	/**
	 * 
	 */
	public TransactionDetailsDAO() {
		// TODO Auto-generated constructor stub
	}
	
	public boolean setTransactionDetails(String accountno, String branchcode,String transactionid, String transactiontype,
			double transactionamount, double balance, String remarks)
	{
		String status="true";
		Connection con=null;
		PreparedStatement pst=null;
		String sql=null;
		int value=0;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");

			sql="insert into transactiondetails(accountno,branchcode,transactionid,transactiontype,"+
				"transactionamount,balance,remarks,transactiontimestamp,status)values(?,?,?,?,?,?,?,CURRENT_TIMESTAMP,?)";
			pst=con.prepareStatement(sql);
			pst.setString(1, accountno);
			pst.setString(2, branchcode);
			pst.setString(3, transactionid);
			pst.setString(4, transactiontype);
			pst.setDouble(5, transactionamount);
			pst.setDouble(6, balance);
			pst.setString(7, remarks);
			pst.setString(8, status);
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


	public ArrayList<org.bean.TransactionDetails> getTransactionDetails(String accountno)
	{
		
		org.bean.TransactionDetails trans=null;
		ArrayList<org.bean.TransactionDetails> list=new ArrayList<org.bean.TransactionDetails>();
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql=null;
		int i=0;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");
			sql="select transactionid,transactionamount,transactiontype,"+
				"balance,transactiontimestamp,remarks from transactiondetails where accountno=?";
			pst=con.prepareStatement(sql);
			pst.setString(1, accountno);
			rs=pst.executeQuery();
			while(rs.next())
			{
				trans=new org.bean.TransactionDetails();
				
				trans.setTransactionid(rs.getString(1));
				trans.setTransactionamount(rs.getDouble(2));
				trans.setTransactiontype(rs.getString(3));
				trans.setBalance(rs.getDouble(4));
				trans.setTransactiontimestamp(rs.getTimestamp(5).toString());
				trans.setRemarks(rs.getString(6));
				list.add(trans);
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

	public ArrayList<org.bean.TransactionDetails> getTransactionStatement(String accountno,String start_date,String end_date)
	{
		
		org.bean.TransactionDetails trans=null;
		ArrayList<org.bean.TransactionDetails> list=new ArrayList<org.bean.TransactionDetails>();
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql=null;
		int i=0;
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date sDate2 = null;
		java.sql.Date sDate=null;
		try 
		{
		     sDate2 = simpleDateFormat.parse(start_date);
		     sDate=new java.sql.Date(sDate2.getTime());
		}
		catch (java.text.ParseException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date eDate2 = null;
		java.sql.Date eDate=null;
		try 
		{
		     eDate2 = simpleDateFormat.parse(end_date);
		     eDate=new java.sql.Date(eDate2.getTime());
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
			sql="select transactionid,transactionamount,transactiontype,"+
				"balance,transactiontimestamp,remarks from transactiondetails where accountno=? and transactiontimestamp>=? and transactiontimestamp<=?";
			pst=con.prepareStatement(sql);
			pst.setString(1, accountno);
			pst.setDate(2,sDate);
			pst.setDate(3,eDate);
			rs=pst.executeQuery();
			while(rs.next())
			{
				trans=new org.bean.TransactionDetails();
				
				trans.setTransactionid(rs.getString(1));
				trans.setTransactionamount(rs.getDouble(2));
				trans.setTransactiontype(rs.getString(3));
				trans.setBalance(rs.getDouble(4));
				trans.setTransactiontimestamp(rs.getTimestamp(5).toString());
				trans.setRemarks(rs.getString(6));
				list.add(trans);
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
	
	public ArrayList<org.bean.TransactionDetails> getAllTransactionStatement(String branchcode,String start_date,String end_date)
	{
		
		org.bean.TransactionDetails trans=null;
		ArrayList<org.bean.TransactionDetails> list=new ArrayList<org.bean.TransactionDetails>();
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql=null;
		int i=0;
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date sDate2 = null;
		java.sql.Date sDate=null;
		try 
		{
		     sDate2 = simpleDateFormat.parse(start_date);
		     sDate=new java.sql.Date(sDate2.getTime());
		}
		catch (java.text.ParseException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date eDate2 = null;
		java.sql.Date eDate=null;
		try 
		{
		     eDate2 = simpleDateFormat.parse(end_date);
		     eDate=new java.sql.Date(eDate2.getTime());
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
			sql="select transactionid,transactionamount,transactiontype,"+
				"balance,transactiontimestamp,remarks from transactiondetails where branchcode=? and transactiontimestamp>=? and transactiontimestamp<=?";
			pst=con.prepareStatement(sql);
			pst.setString(1, branchcode);
			pst.setDate(2,sDate);
			pst.setDate(3,eDate);
			rs=pst.executeQuery();
			while(rs.next())
			{
				trans=new org.bean.TransactionDetails();
				
				trans.setTransactionid(rs.getString(1));
				trans.setTransactionamount(rs.getDouble(2));
				trans.setTransactiontype(rs.getString(3));
				trans.setBalance(rs.getDouble(4));
				trans.setTransactiontimestamp(rs.getTimestamp(5).toString());
				trans.setRemarks(rs.getString(6));
				list.add(trans);
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
}
