package org.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CustomerSettingsDAO {

	public CustomerSettingsDAO() {
		// TODO Auto-generated constructor stub
	}

	public boolean setCustomerSettings(String username,String accountno,String password,String question,String answer,
			String twostepverification,String settings)
	{
		org.bean.PasswordEncryption passEncrypt=new org.bean.PasswordEncryption();
		String status="true";
		Connection con=null;
		PreparedStatement pst=null;
		String sql=null;
		int value=0;
		String passwordEncrypted=passEncrypt.passwordEncryption(password);
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");

			sql="insert into customersettings values(?,?,?,?,?,?,?,?)";
			pst=con.prepareStatement(sql);
			pst.setString(1, username);
			pst.setString(2, accountno);
			pst.setString(3, passwordEncrypted);
			pst.setString(4, question);
			pst.setString(5, answer);
			pst.setString(6, twostepverification);
			pst.setString(7, settings);
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

	public boolean updatePassword(String username,String password)
	{
		org.bean.PasswordEncryption passEncrypt=new org.bean.PasswordEncryption();
		String status="true";
		Connection con=null;
		PreparedStatement pst=null;
		String sql=null;
		int value=0;
		String passwordEncrypted=passEncrypt.passwordEncryption(password);
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");

			sql="update customersettings set password=? where username=?";
			pst=con.prepareStatement(sql);
			pst.setString(1,passwordEncrypted);
			pst.setString(2, username);
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


	public boolean isUsernameSecurityQAVAlid(String username, String question,String answer)
	{

		boolean val=false;
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql=null;

		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");
			sql="select * from customersettings where username=? and question=? and answer=? ";
			pst=con.prepareStatement(sql);
			pst.setString(1, username);
			pst.setString(2, question);
			pst.setString(3, answer);
			rs=pst.executeQuery();
			if(rs.next())
			{
				val=true;
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

}
