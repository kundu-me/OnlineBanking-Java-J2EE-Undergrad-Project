/**
 * 
 */
package org.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.bean.News;

/**
 * @author Nirmallya
 *
 */
public class NewsDAO {

	/**
	 * 
	 */
	public NewsDAO() {
		// TODO Auto-generated constructor stub
	}

	public boolean setNews(String heading,String details, String status)
	{
		Connection con=null;
		PreparedStatement pst=null;
		int value=0;
		String sql=null;

		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");
			sql="insert into news(heading,details,timestamp1,status) values(?,?,CURRENT_DATE(),?)";
			pst=con.prepareStatement(sql);
			pst.setString(1,heading);
			pst.setString(2,details);
			pst.setString(3,status);
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
	
	public boolean deleteNews(int serial)
	{
		Connection con=null;
		PreparedStatement pst=null;
		int value=0;
		String sql=null;
		String status="false";

		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");
			sql="update news set status=? where serial=?";
			pst=con.prepareStatement(sql);
			pst.setString(1,status);
			pst.setInt(2,serial);
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
	public News getNewsValid()
	{

		News news=null;
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql=null;
		try
		{
			news=new News(); 
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");

			sql="select * from news where status=?";
			pst=con.prepareStatement(sql);
			pst.setString(1,"true");
			rs=pst.executeQuery();

			while(rs.next())
			{
				news.setSerial(rs.getString(1));
				news.setHeading(rs.getString(2));
				news.setDetails(rs.getString(3));
				rs.getDate(4);
				news.setStatus(rs.getString(5));
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

		return news;

	}
	
	public String getNewsLatest3()
	{

		int SIZE=400;
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql=null;
		String returnString="";
		String str0=" = = = = = =";
		String str1=" = = = =";
		String str2=" = =";
		String[] heading=new String[SIZE];
		String[] details=new String[SIZE];
		int i=0;
		
		try
		{ 
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");

			sql="select heading,details from news where status=? order by serial desc";
			pst=con.prepareStatement(sql);
			pst.setString(1,"true");
			rs=pst.executeQuery();

			while(rs.next())
			{
				heading[i]=rs.getString(1);
				details[i]=rs.getString(2);
				i=i+1;
			}
			if(i==0)
			{
				returnString=str0;
			}
			else if(i==1)
			{
				returnString=heading[0]+"="+details[0]+"="+str1;
			}
			else if(i==2)
			{
				returnString=heading[0]+"="+details[0]+"="+heading[1]+"="+details[1]+"="+str2;
			}
			else
			{
				for(int j=0;j<3;j++)
				{
					returnString+=heading[j]+"="+details[j]+"=";
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
				
				return returnString;

			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
		}

		return returnString;
	}

	public String getNewsLatest()
	{

		int SIZE=400;
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql=null;
		String returnString="";
		String str0=" = = = = = =";
		String str1=" = = = =";
		String str2=" = =";
		String[] heading=new String[SIZE];
		String[] details=new String[SIZE];
		int i=0;
		
		try
		{ 
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");

			sql="select heading,details from news where status=? order by serial asc";
			pst=con.prepareStatement(sql);
			pst.setString(1,"true");
			rs=pst.executeQuery();

			while(rs.next())
			{
				heading[i]=rs.getString(1);
				details[i]=rs.getString(2);
				i=i+1;
			}
			int count=i;
			if(i==0)
			{
				returnString=str0;
			}
			else if(i==1)
			{
				returnString=heading[0]+"="+details[0]+"="+str1;
			}
			else if(i==2)
			{
				returnString=heading[0]+"="+details[0]+"="+heading[1]+"="+details[1]+"="+str2;
			}
			else
			{
				for(int j=0;j<count;j++)
				{
					returnString+=heading[j]+"="+details[j]+"=";
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
				
				return returnString;

			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
		}

		return returnString;
	}

}