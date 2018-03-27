package org.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminAccountDAO {

	public AdminAccountDAO() {
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
			sql="select * from adminaccount";
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

			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
		}

		return serial;

	}

	public String getEmail(String username)
	{
		String email="";

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
			sql="select email from adminaccount where username=?";
			pst=con.prepareStatement(sql);
			pst.setString(1, username);
			rs=pst.executeQuery();
			while(rs.next())
			{
				email=rs.getString(1);
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
				return email;

			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
		}

		return email;

	}
	public String getName(String username)
	{
		String name="";

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
			sql="select name from adminaccount where username=?";
			pst=con.prepareStatement(sql);
			pst.setString(1, username);
			rs=pst.executeQuery();
			while(rs.next())
			{
				name=rs.getString(1);
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
				return name;

			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
		}

		return name;

	}

	public boolean isAdminAccountValid(String username, String password)
	{
		
		boolean val=false;
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql=null;
		org.bean.PasswordEncryption passEncrypt=new org.bean.PasswordEncryption();
		String passwordEncrypted=passEncrypt.passwordEncryption(password);
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");
			sql="select * from adminaccount where username=? and password=?";
			pst=con.prepareStatement(sql);
			pst.setString(1, username);
			pst.setString(2, passwordEncrypted);
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


	public String getPassword(String username)
	{
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql=null;
		String password="";
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");

			sql="select password from adminaccount where username=?";
			pst=con.prepareStatement(sql);
			pst.setString(1, username);
			rs=pst.executeQuery();
			while(rs.next())
			{
				password=rs.getString(1);
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
				return password;
			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
		}

		return password;

	}

	public String getBranchCode(String username)
	{
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql=null;
		String branchcode="";
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");

			sql="select branchcode from adminaccount where username=?";
			pst=con.prepareStatement(sql);
			pst.setString(1, username);
			rs=pst.executeQuery();
			while(rs.next())
			{
				branchcode=rs.getString(1);
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
				return branchcode;
			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
		}

		return branchcode;

	}

	public boolean ifBranchCodeInListUpdateStatus(String branchcode,String status)
	{
		Connection con=null;
		PreparedStatement pst=null;
		int val=0;
		String sql=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");

			sql="update adminaccount set status=? where branchcode=?";
			pst=con.prepareStatement(sql);
			pst.setString(1, status);
			pst.setString(2, branchcode);
			val=pst.executeUpdate();
			
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
				return true;
			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
		}

		return true;

	}

	public String setAdminAccount(String password,String branchcode, String name,String email)
	{
		org.bean.PasswordEncryption passEncrypt=new org.bean.PasswordEncryption();
		Connection con=null;
		PreparedStatement pst=null;
		String sql=null;
		int value=0;
		int serial=getSerialNo();
		String[] user=email.split("@");
		String username=user[0]+serial;
		String status="true";
		String passwordEncrypted=passEncrypt.passwordEncryption(password);
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");

			sql="insert into adminaccount values(?,?,?,?,?,?)";
			pst=con.prepareStatement(sql);
			pst.setString(1, username);
			pst.setString(2, passwordEncrypted);
			pst.setString(3, branchcode);
			pst.setString(4, name);
			pst.setString(5, email);
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
					return username;
				}
				else
				{
					return username;
				}

			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
		}


		return username;

	}

	public boolean updateAdminAccountPassword(String username,String password)
	{
		org.bean.PasswordEncryption passEncrypt=new org.bean.PasswordEncryption();
		Connection con=null;
		PreparedStatement pst=null;
		String sql=null;
		int value=0;
		String passwordEncrypted=passEncrypt.passwordEncryption(password);
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");

			sql="update adminaccount set password=? where username=?";
			pst=con.prepareStatement(sql);
			pst.setString(1,passwordEncrypted);
			pst.setString(2,username);
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
		}


		return false;

	}

		public boolean isUsernameInList(String username)
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
			sql="select * from adminaccount where username=?";
			pst=con.prepareStatement(sql);
			pst.setString(1, username);
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
	public boolean updatePassword(String username,String password)
	{
		Connection con=null;
		PreparedStatement pst=null;
		String sql=null;
		int value=0;
		org.bean.PasswordEncryption passEncrypt=new org.bean.PasswordEncryption();
		String passwordEncrypted=passEncrypt.passwordEncryption(password);
		
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");

			sql="update adminaccount set password=? where username=?";
			pst=con.prepareStatement(sql);
			pst.setString(1, passwordEncrypted);
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

}

