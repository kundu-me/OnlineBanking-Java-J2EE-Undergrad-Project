/**
 * 
 */
package org.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.bean.Form60;

/**
 * @author Nirmallya Kundu
 *
 */
public class Form60DAO {

	/**
	 * 
	 */
	public Form60DAO() {
		// TODO Auto-generated constructor stub
	}

	public int getForm60No()
	{
		int form60no=0;
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql=null;
		int count=0;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");

			sql="select * from form60";
			pst=con.prepareStatement(sql);
			rs=pst.executeQuery();

			while(rs.next())
			{
				count=count+1;
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

		form60no=count+1;
		return form60no;
	}

	public int setForm60(String cid, String fullname,String address,
			String openingof,String issueof,double tamount, String tax,
			String document, String status)
	{

		int form60no=0;
		Connection con=null;
		PreparedStatement pst=null;
		int value=0;
		String sql=null;

		form60no=getForm60No();
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");
			sql="insert into form60 values(?,?,?,?,?,?,?,?,?,?)";
			pst=con.prepareStatement(sql);

			pst.setInt(1,form60no);
			pst.setString(2,cid);
			pst.setString(3,fullname);
			pst.setString(4,address);
			pst.setString(5,openingof);
			pst.setString(6,issueof);
			pst.setDouble(7,tamount);
			pst.setString(8,tax);
			pst.setString(9,document);
			pst.setString(10,status);
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
					return form60no;
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
		return -1;
	}

	public void updateStatus(String cid, String status)
	{
		Connection con=null;
		PreparedStatement pst=null;
		int value=0;
		String sql=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");
			sql="update form60 set status=? where cid=?";
			pst=con.prepareStatement(sql);
			pst.setString(1, status);
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

	}

	
	public Form60 getForm60(String cid)
	{

		Form60 form60=null;
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");

			sql="select * from form60 where cid=? and status=?";
			pst=con.prepareStatement(sql);
			pst.setString(1,cid);
			pst.setString(2, "true");
			rs=pst.executeQuery();

			while(rs.next())
			{
				form60=new Form60();
				form60.setForm60no(rs.getInt(1));
				form60.setCid(rs.getString(2));
				form60.setFullname(rs.getString(3));
				form60.setAddress(rs.getString(4));
				form60.setOpeningof(rs.getString(5));
				form60.setIssueof(rs.getString(6));
				form60.setTamount(rs.getDouble(7));
				form60.setTax(rs.getString(8));
				form60.setDocument(rs.getString(9));
				form60.setStatus(rs.getString(10));
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

		return form60;
	}
}
