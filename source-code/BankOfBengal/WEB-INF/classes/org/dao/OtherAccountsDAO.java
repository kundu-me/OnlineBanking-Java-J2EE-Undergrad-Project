/**
 * 
 */
package org.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.bean.OtherAccounts;

/**
 * @author Nirmallya Kundu
 *
 */
public class OtherAccountsDAO {

	/**
	 * 
	 */
	public OtherAccountsDAO() {
		// TODO Auto-generated constructor stub
	}

	public int getSerial()
	{
		int returnValue=0;
		int value=0;
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");

			sql="select * from otheraccounts";
			pst=con.prepareStatement(sql);
			rs=pst.executeQuery();

			while(rs.next())
			{
				value=value+1;
			}
			returnValue=value+1;
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
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}

		return returnValue;
	}

	public boolean setOtherAccounts(String serial,String cid,String bank,String branch, String accounttype,String accountno,String status)
	{
		Connection con=null;
		PreparedStatement pst=null;
		int value=0;
		String sql=null;
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");
			sql="insert into otheraccounts(serial,cid,bank,branch,accounttype,accountno,status) values(?,?,?,?,?,?,?)";
			pst=con.prepareStatement(sql);
			pst.setString(1, serial);
			pst.setString(2,cid);
			pst.setString(3,bank);
			pst.setString(4,branch);
			pst.setString(5,accounttype);
			pst.setString(6,accountno);
			pst.setString(7, status);
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

	public OtherAccounts getOtherAccounts(String serial,String cid)
	{

		OtherAccounts otherAccounts=null;
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql=null;
		try
		{
			otherAccounts=new OtherAccounts(); 
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");

			sql="select * from otheraccounts where serial=? and cid=? and status=?";
			pst=con.prepareStatement(sql);
			pst.setString(1,serial);
			pst.setString(2,cid);
			pst.setString(3, "true");
			rs=pst.executeQuery();

			while(rs.next())
			{
				otherAccounts.setSerial(rs.getString(1));
				otherAccounts.setCid(rs.getString(2));
				otherAccounts.setBank(rs.getString(3));
				otherAccounts.setBranch(rs.getString(4));
				otherAccounts.setAccounttype(rs.getString(5));
				otherAccounts.setAccountno(rs.getString(6));
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

		return otherAccounts;

	}
	
	public boolean updateOtherAccountsFalse(String cid)
	{
		Connection con=null;
		PreparedStatement pst=null;
		int value=0;
		String sql=null;
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");
			sql="update otheraccounts set status=? where cid=?";
			pst=con.prepareStatement(sql);
			pst.setString(1, "false");
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

}
