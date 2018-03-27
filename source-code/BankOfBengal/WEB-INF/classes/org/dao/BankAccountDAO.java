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
public class BankAccountDAO {

	/**
	 * 
	 */
	public BankAccountDAO() {
		// TODO Auto-generated constructor stub
	}
	
	public boolean setBankAccountCharges(String transactionid,String accountno,String branchcode,double bankcharges,String transactiontype)
	{
		Connection con=null;
		PreparedStatement pst=null;
		String sql=null;
		int value=0;
		String status="true";
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");
		
			sql="insert into bankaccount(transactionid,accountno,branchcode,bankcharges,transactiontype,transactiontimestamp,status)"
					+"values(?,?,?,?,?,CURRENT_TIMESTAMP(),?)";
			pst=con.prepareStatement(sql);
			pst.setString(1, transactionid);
			pst.setString(2, accountno);
			pst.setString(3, branchcode);
			pst.setDouble(4, bankcharges);
			pst.setString(5, transactiontype);
			pst.setString(6, status);
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
	
	public boolean updateStatus(String transactionid,String status)
	{
		Connection con=null;
		PreparedStatement pst=null;
		String sql=null;
		int value=0;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");
		
			sql="update bankaccount set status=? where transactionid=?";
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

	public ArrayList<org.bean.BankAccount> getAllTransactionStatement(String branchcode,String start_date,String end_date)
	{
		org.bean.BankAccount bank=null;
		ArrayList<org.bean.BankAccount> list=new ArrayList<org.bean.BankAccount>();
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql=null;
		String status="true";
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
			sql="select transactionid,accountno,transactiontype, bankcharges,transactiontimestamp from bankaccount"
				+ " where branchcode=? and status=? and transactiontimestamp>=? and transactiontimestamp<=?";
			pst=con.prepareStatement(sql);
			pst.setString(1, branchcode);
			pst.setString(2, status);
			pst.setDate(3,sDate);
			pst.setDate(4,eDate);
			rs=pst.executeQuery();
			
			while(rs.next())
			{
				bank=new org.bean.BankAccount();
				
				bank.setTransactionid(rs.getString(1));
				bank.setAccountno(rs.getString(2));
				bank.setTransactiontype(rs.getString(3));
				bank.setBankcharges(rs.getDouble(4));
				bank.setTransactiontimestamp(rs.getTimestamp(5).toString());
				
				list.add(bank);
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
