/**
 * 
 */
package org.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.bean.ApplicationStatus;

/**
 * @author Nirmallya
 *
 */
public class ApplicationStatusDAO {

	/**
	 * 
	 */
	public ApplicationStatusDAO() {
		// TODO Auto-generated constructor stub
	}
	public boolean setApplicationStatus(int applicationno,String cid,String email, String branchcode, String status, String remarks)
	{
		Connection con=null;
		PreparedStatement pst=null;
		int value=0;
		String sql=null;

		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");
			sql="insert into applicationstatus(applicationno,cid,email,branchcode,status,remarks) values(?,?,?,?,?,?)";
			pst=con.prepareStatement(sql);
			pst.setInt(1,applicationno);
			pst.setString(2,cid);
			pst.setString(3,email);
			pst.setString(4,branchcode);
			pst.setString(5,status);
			pst.setString(6,remarks);
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
	
	public ApplicationStatus getApplicationStatus(String cid,String email)
	{

		ApplicationStatus applicationStatus=null;
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql=null;
		try
		{
			
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");

			sql="select * from applicationstatus where cid=? and email=?";
			pst=con.prepareStatement(sql);
			pst.setString(1,cid);
			pst.setString(2,email);
			rs=pst.executeQuery();

			if(rs.next())
			{
				applicationStatus=new ApplicationStatus();
			
				applicationStatus.setApplicationno(rs.getInt(1));
				applicationStatus.setCid(rs.getString(2));
				applicationStatus.setEmail(rs.getString(3));
				applicationStatus.setBranchcode(rs.getString(4));
				applicationStatus.setStatus(rs.getString(5));
				applicationStatus.setRemarks(rs.getString(6));
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

		return applicationStatus;
	}	
	
	public ApplicationStatus getAllApplicationWithStatus(String status)
	{

		ApplicationStatus applicationStatus=null;
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql=null;
		try
		{
			
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");

			sql="select * from applicationstatus status=?";
			pst=con.prepareStatement(sql);
			pst.setString(1,status);
			rs=pst.executeQuery();

			if(rs.next())
			{
				applicationStatus=new ApplicationStatus();
			
				applicationStatus.setApplicationno(rs.getInt(1));
				applicationStatus.setCid(rs.getString(2));
				applicationStatus.setEmail(rs.getString(3));
				applicationStatus.setBranchcode(rs.getString(4));
				applicationStatus.setStatus(rs.getString(5));
				applicationStatus.setRemarks(rs.getString(6));
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

		return applicationStatus;
	}
	
	public boolean updateStatusAndRemarks(String cid,String status, String remarks)
	{
		Connection con=null;
		PreparedStatement pst=null;
		int value=0;
		String sql=null;

		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");
			sql="update applicationstatus set status=?,remarks=? where cid=?";
			pst=con.prepareStatement(sql);
			pst.setString(1,status);
			pst.setString(2,remarks);
			pst.setString(3,cid);
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
