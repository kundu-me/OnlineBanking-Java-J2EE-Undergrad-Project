package org.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AdminLoginDAO {

	public AdminLoginDAO() {
		// TODO Auto-generated constructor stub
	}
	
	
	public boolean setAdminLogin(String username,String ipaddress)
	{
		Connection con=null;
		PreparedStatement pst=null;
		String sql=null;
		int value=0;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");
		
			sql="insert into adminlogin(username,ipaddress,logintimestamp) values(?,?,CURRENT_TIMESTAMP())";
			pst=con.prepareStatement(sql);
			pst.setString(1, username);
			pst.setString(2, ipaddress);
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
			sql="select * from adminlogin where username=?";
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

		public ArrayList<org.bean.AdminLogin> getLoginDetails(String username)
	{
		
		org.bean.AdminLogin login=null;
		ArrayList<org.bean.AdminLogin> list=new ArrayList<org.bean.AdminLogin>();
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql=null;
		int i=0;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");
			sql="select logintimestamp,ipaddress from adminlogin where username=?";
			pst=con.prepareStatement(sql);
			pst.setString(1, username);
			rs=pst.executeQuery();
			while(rs.next())
			{
				String x=rs.getTimestamp(1).toString();
				login=new org.bean.AdminLogin();
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
