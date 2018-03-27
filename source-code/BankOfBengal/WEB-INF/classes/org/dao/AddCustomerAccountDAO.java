/**
 * 
 */
package org.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * @author Nirmallya
 *
 */
public class AddCustomerAccountDAO {

	/**
	 * 
	 */
	public AddCustomerAccountDAO() {
		// TODO Auto-generated constructor stub
	}

	public boolean addCustomerAccount(String username,String accountno)
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
		
			sql="insert into addcustomeraccount(username,accountno,status) values(?,?,?)";
			pst=con.prepareStatement(sql);
			pst.setString(1, username);
			pst.setString(2, accountno);
			pst.setString(3, status);
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

	public boolean updateStatus(String accountno,String status)
	{
		Connection con=null;
		PreparedStatement pst=null;
		String sql=null;
		int value=0;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");
		
			sql="update addcustomeraccount set status=? where accountno=?";
			pst=con.prepareStatement(sql);
			pst.setString(1, status);
			pst.setString(2, accountno);
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

	
	public ArrayList<org.bean.AddCustomerAccount> getAddedCustomerAccounts(String username)
	{
		
		org.bean.AddCustomerAccount acc=null;
		ArrayList<org.bean.AddCustomerAccount> list=new ArrayList<org.bean.AddCustomerAccount>();
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql=null;
		String status="true";
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");
			sql="select accountno from addcustomeraccount where username=? and status=?";
			pst=con.prepareStatement(sql);
			pst.setString(1, username);
			pst.setString(2, status);
			rs=pst.executeQuery();
			while(rs.next())
			{
				acc=new org.bean.AddCustomerAccount();
				acc.setAccountno(rs.getString(1));
				list.add(acc);
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

	public String getAddedCustomerAccountsString(String username)
	{
		
		String list="";
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql=null;
		String status="true";
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");
			sql="select accountno from addcustomeraccount where username=? and status=?";
			pst=con.prepareStatement(sql);
			pst.setString(1, username);
			pst.setString(2, status);
			rs=pst.executeQuery();
			while(rs.next())
			{
				list+=rs.getString(1)+"|";
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

