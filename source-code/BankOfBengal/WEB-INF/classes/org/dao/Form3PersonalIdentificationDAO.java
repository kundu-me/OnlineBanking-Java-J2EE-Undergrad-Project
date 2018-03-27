/**
 * 
 */
package org.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import org.bean.Form3PersonalIdentification;

/**
 * @author Nirmallya Kundu
 *
 */
public class Form3PersonalIdentificationDAO {

	/**
	 * 
	 */
	public Form3PersonalIdentificationDAO() {
		// TODO Auto-generated constructor stub
	}
	
	public boolean setForm3PersonalIdentification(int applicationno,String cid, 
								String	poilabel, String poino, String poiplace, String poidate,
								String poalabel, String poano, String poaplace, String poadate, 
								int otheraccount, String status)
	{
		Connection con=null;
		PreparedStatement pst=null;
		int value=0;
		String sql=null;
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date sDate2 = null;
		java.sql.Date poiDate=null;
		try 
		{
		     sDate2 = simpleDateFormat.parse(poidate);
		     poiDate=new java.sql.Date(sDate2.getTime());
		}
		catch (java.text.ParseException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date eDate2 = null;
		java.sql.Date poaDate=null;
		try 
		{
		     eDate2 = simpleDateFormat.parse(poadate);
		     poaDate=new java.sql.Date(eDate2.getTime());
		}
		catch (java.text.ParseException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");
			sql="insert into personalidentification values( ?,?,?,?,?,?,?,?,?,?,"+
															"?,?)";
			pst=con.prepareStatement(sql);
			pst.setInt(1,applicationno);
			pst.setString(2,cid);
			pst.setString(3,poilabel);
			pst.setString(4,poino);
			pst.setString(5,poiplace);
			pst.setDate(6,poiDate);
			pst.setString(7,poalabel);
			pst.setString(8,poano);
			pst.setString(9,poaplace);
			pst.setDate(10,poaDate);
			pst.setInt(11,otheraccount);
			pst.setString(12,status);
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
				{
					con.close();
				}	
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

	public Form3PersonalIdentification getForm3PersonalIdentification(String cid)
	{

		Form3PersonalIdentification form3PersonalIdentification=null;
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql=null;
		try
		{
			
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");
			sql="select * from personalidentification where cid=? and status=?";
			pst=con.prepareStatement(sql);
			pst.setString(1,cid);
			pst.setString(2,"true");
			rs=pst.executeQuery();

			while(rs.next())
			{
				form3PersonalIdentification=new Form3PersonalIdentification();
				form3PersonalIdentification.setApplicationno(rs.getInt(1));
				form3PersonalIdentification.setCid(rs.getString(2));
				form3PersonalIdentification.setPoilabel(rs.getString(3));
				form3PersonalIdentification.setPoino(rs.getString(4));
				form3PersonalIdentification.setPoiplace(rs.getString(5));
				form3PersonalIdentification.setPoidate(rs.getDate(6).toString());
				form3PersonalIdentification.setPoalabel(rs.getString(7));
				form3PersonalIdentification.setPoano(rs.getString(8));
				form3PersonalIdentification.setPoaplace(rs.getString(9));
				form3PersonalIdentification.setPoadate(rs.getString(10).toString());
				form3PersonalIdentification.setOtheraccount(rs.getInt(11));
				form3PersonalIdentification.setStatus(rs.getString(12));
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

		return form3PersonalIdentification;
	}
	
	public boolean updateStatus(String cid,String status)
	{
		Connection con=null;
		PreparedStatement pst=null;
		int value=0;
		String sql=null;

		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");
			sql="update personalidentification set status=? where cid=?";
			pst=con.prepareStatement(sql);
			pst.setString(1,status);
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
	public boolean isEntry(String cid)
	{
		int returnValue=-1;
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");

			sql="select * from personalidentification where cid=?";
			pst=con.prepareStatement(sql);
			pst.setString(1,cid);
			rs=pst.executeQuery();

			if(rs.next())
			{
				returnValue=1;
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

				if(returnValue==1)
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


	public boolean updateForm3PersonalIdentification(String cid, String poilabel, String poino,	String poiplace, String poidate,
													String poalabel, String poano, String poaplace, String poadate, int otheraccount)
	{
		Connection con=null;
		PreparedStatement pst=null;
		int value=0;
		String sql=null;
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date sDate2 = null;
		java.sql.Date poiDate=null;
		try 
		{
		     sDate2 = simpleDateFormat.parse(poidate);
		     poiDate=new java.sql.Date(sDate2.getTime());
		}
		catch (java.text.ParseException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date eDate2 = null;
		java.sql.Date poaDate=null;
		try 
		{
		     eDate2 = simpleDateFormat.parse(poadate);
		     poaDate=new java.sql.Date(eDate2.getTime());
		}
		catch (java.text.ParseException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");
			sql="update personalidentification set poilabel=?,poino=?,poiplace=?,poidate=?,"+
				"poalabel=?,poano=?,poaplace=?,poadate=?, otheraccount=? where cid=? and status=?";
			pst=con.prepareStatement(sql);
			pst.setString(1,poilabel);
			pst.setString(2,poino);
			pst.setString(3,poiplace);
			pst.setDate(4,poiDate);
			pst.setString(5,poalabel);
			pst.setString(6,poano);
			pst.setString(7,poaplace);
			pst.setDate(8,poaDate);
			pst.setInt(9,otheraccount);
			pst.setString(10,cid);
			pst.setString(11,"true");
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
				{
					con.close();
				}	
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
