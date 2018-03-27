package org.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ComplainBoxDAO {

	public ComplainBoxDAO() {
		// TODO Auto-generated constructor stub
	}
	
	public boolean registerComplain(String email,String subject,String complain)
	{
		Connection con=null;
		PreparedStatement pst=null;
		int value=0;
		String sql=null;
		String reply="reply pending",status="true";

		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");
			sql="insert into complainbox(email,subject,complain,reply,status) values(?,?,?,?,?)";
			pst=con.prepareStatement(sql);
			pst.setString(1,email);
			pst.setString(2,subject);
			pst.setString(3,complain);
			pst.setString(4,reply);
			pst.setString(5,status);
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

	public boolean updateReply(String s,String reply)
	{
		Connection con=null;
		PreparedStatement pst=null;
		int value=0;
		String sql=null;
		String status="false";
		int serial=0;
		try
		{
			System.out.println(s);
			serial=Integer.parseInt(s);
			System.out.println(serial);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");
			sql="update complainbox set reply=? , status=? where serial=?";
			pst=con.prepareStatement(sql);
			pst.setString(1,reply);
			pst.setString(2, status);
			pst.setInt(3,serial);
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


}
