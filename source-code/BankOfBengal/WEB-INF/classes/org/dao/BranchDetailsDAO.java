/**
 * 
 */
package org.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.bean.BranchDetails;

/**
 * @author Nirmallya Kundu
 *
 */
public class BranchDetailsDAO {

	/**
	 * 
	 */
	public BranchDetailsDAO() {
		// TODO Auto-generated constructor stub
	}
	public boolean setBranchDetails(int serial, String branchcode, String branchname, String branchstate,
			String branchcity, String branchpincode, String branchaddress, String status)
	{
		Connection con=null;
		PreparedStatement pst=null;
		int value=0;
		String sql=null;

		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");
			sql="insert into branchdetails values(?,?,?,?,?,?,?,?)";
			pst=con.prepareStatement(sql);
			pst.setInt(1,serial);
			pst.setString(2,branchcode);
			pst.setString(3,branchname);
			pst.setString(4,branchstate);
			pst.setString(5,branchcity);
			pst.setString(6,branchpincode);
			pst.setString(7,branchaddress);
			pst.setString(8,status);
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
	
	public BranchDetails getbranchDetails(String branchcode)
	{

		BranchDetails branchDetails=null;
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql=null;
		try
		{
			branchDetails=new BranchDetails();
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");

			sql="select * from branchdetails where branchcode=?";
			pst=con.prepareStatement(sql);
			pst.setString(1,branchcode);
			rs=pst.executeQuery();

			while(rs.next())
			{
				branchDetails.setSerial(rs.getInt(1));
				branchDetails.setBranchcode(rs.getString(2));
				branchDetails.setBranchname(rs.getString(3));
				branchDetails.setBranchstate(rs.getString(4));
				branchDetails.setBranchcity(rs.getString(5));
				branchDetails.setBranchpincode(rs.getString(6));
				branchDetails.setBranchaddress(rs.getString(7));
				branchDetails.setStatus(rs.getString(8));
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

		return branchDetails;
	}
	public boolean isBranchCodeAvailable(String branchcode)
	{

		boolean returnValue=false;
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");

			sql="select * from branchdetails where branchcode=?";
			pst=con.prepareStatement(sql);
			pst.setString(1,branchcode);
			rs=pst.executeQuery();

			if(rs.next())
			{
				returnValue=true;
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

		return returnValue;
	}
	
	public boolean isBranchNameAvailable(String branchname)
	{
		boolean returnValue=false;
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");

			sql="select * from branchdetails where branchname=?";
			pst=con.prepareStatement(sql);
			pst.setString(1,branchname);
			rs=pst.executeQuery();

			if(rs.next())
			{
				returnValue=true;
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

		return returnValue;
	}
	
}
