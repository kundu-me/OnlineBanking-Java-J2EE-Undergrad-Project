/**
 * 
 */
package org.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @author Nirmallya
 *
 */
public class MoneyTransferDAO {

	/**
	 * 
	 */
	public MoneyTransferDAO() {
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
			sql="select * from moneytransfer";
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

	public String setMoneyTransferRequest(String branchcode,String email,String sender_accountno,String receiver_accountno,
								String receiver_bank,double amount,double bankcharges,double totalamount)
	{
		String status="verification pending";
		int serialNo=getSerialNo();
		String serial=serialNo+"";
		String transactionid="";
		String tid="TRANSMT";
		
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
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");
			sql="insert into moneytransfer values(?,?,?,?,?,?,?,?,?,CURRENT_TIMESTAMP(),?)";
			pst=con.prepareStatement(sql);
			pst.setString(1, transactionid);
			pst.setString(2, branchcode);
			pst.setString(3, email);
			pst.setString(4, sender_accountno);
			pst.setString(5, receiver_accountno);
			pst.setString(6, receiver_bank);
			pst.setDouble(7, amount);
			pst.setDouble(8, bankcharges);
			pst.setDouble(9, totalamount);
			pst.setString(10, status);
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
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");
			sql="update moneytransfer set status=? where transactionid=?";
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
