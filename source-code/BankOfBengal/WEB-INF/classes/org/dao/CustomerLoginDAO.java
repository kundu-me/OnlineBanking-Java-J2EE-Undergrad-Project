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
public class CustomerLoginDAO {

	/**
	 * 
	 */
	public CustomerLoginDAO() {
		// TODO Auto-generated constructor stub
	}
	
	public boolean setCustomerLogin(String username,String accountno,String ipaddress)
	{
		Connection con=null;
		PreparedStatement pst=null;
		String sql=null;
		int value=0;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");
		
			sql="insert into customerlogin(username,accountno,ipaddress,logintimestamp) values(?,?,?,CURRENT_TIMESTAMP())";
			pst=con.prepareStatement(sql);
			pst.setString(1, username);
			pst.setString(2, accountno);
			pst.setString(3, ipaddress);
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
	
	public boolean is1stLogin(String username)
	{
		
		boolean val=true;
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");
			sql="select * from customerlogin where username=?";
			pst=con.prepareStatement(sql);
			pst.setString(1, username);
			rs=pst.executeQuery();
			if(rs.next())
			{
				val=false;
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
					
					return val;

				}
				catch(SQLException e)
				{
					e.printStackTrace();
				}
		}


		return val;
	}

	public String getCustomerLogin(String username,int number)
	{
		
		String details="";
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql=null;
		int i=0;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");
			sql="select ipaddress,logintimestamp from customerlogin where username=?";
			pst=con.prepareStatement(sql);
			pst.setString(1, username);
			rs=pst.executeQuery();
			while(rs.next())
			{
				i=i+1;
				details+=rs.getString(1)+","+rs.getTimestamp(2)+"|";
				if(i==number)
				{
					break;
				}
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
					
					return details;

				}
				catch(SQLException e)
				{
					e.printStackTrace();
				}
		}


		return details;
	}

	public ArrayList<org.bean.CustomerLogin> getLoginDetails(String username)
	{
		
		org.bean.CustomerLogin login=null;
		ArrayList<org.bean.CustomerLogin> list=new ArrayList<org.bean.CustomerLogin>();
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql=null;
		int i=0;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");
			sql="select logintimestamp,ipaddress from customerlogin where username=?";
			pst=con.prepareStatement(sql);
			pst.setString(1, username);
			rs=pst.executeQuery();
			while(rs.next())
			{
				String x=rs.getTimestamp(1).toString();
				login=new org.bean.CustomerLogin();
				login.setLogintimestamp(x);
				login.setIpaddress(rs.getString(2));
				list.add(login);
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


