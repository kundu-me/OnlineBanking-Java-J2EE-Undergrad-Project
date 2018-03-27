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
public class FixedDepositSchemeDAO {

	/**
	 * 
	 */
	public FixedDepositSchemeDAO() {
		// TODO Auto-generated constructor stub
	}
	
	public ArrayList<org.bean.FixedDepositScheme> getScheme(String customertype,String customerage)
	{
		
		org.bean.FixedDepositScheme scheme=null;
		ArrayList<org.bean.FixedDepositScheme> list=new ArrayList<org.bean.FixedDepositScheme>();
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql=null;
		int i=0;
		String status="true";
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");
			sql="select min_days,max_days,interest,prematurepenalty from fixeddepositscheme where customertype=? and customerage=? and status=?";
			pst=con.prepareStatement(sql);
			pst.setString(1, customertype);
			pst.setString(2, customerage);
			pst.setString(3, status);
			rs=pst.executeQuery();
			while(rs.next())
			{
				scheme=new org.bean.FixedDepositScheme();
				scheme.setMin_days(rs.getInt(1));
				scheme.setMax_days(rs.getInt(2));
				scheme.setInterest(rs.getDouble(3));
				scheme.setPrematurepenalty(rs.getDouble(4));
				list.add(scheme);
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

	public ArrayList<org.bean.FixedDepositScheme> getInterestAndPenalty(int term,String ctype,String cage)
	{
		
		org.bean.FixedDepositScheme scheme=null;
		ArrayList<org.bean.FixedDepositScheme> list=new ArrayList<org.bean.FixedDepositScheme>();
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql=null;
		int i=0;
		String status="true";
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");
			sql="select min_days,max_days,interest,prematurepenalty from fixeddepositscheme where customertype=? and customerage=? and status=?";
			pst=con.prepareStatement(sql);
			pst.setString(1, ctype);
			pst.setString(2, cage);
			pst.setString(3, status);
			rs=pst.executeQuery();
			int min=0,max=0;
			double intr=0,penalty=0;
			while(rs.next())
			{
				min=rs.getInt(1);
				max=rs.getInt(2);
				intr=rs.getDouble(3);
				penalty=rs.getDouble(4);
				if(term>=min||term<=max)
				{
					scheme=new org.bean.FixedDepositScheme(); 
					scheme.setInterest(intr);
					scheme.setPrematurepenalty(penalty);
					list.add(scheme);
					return list;
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
					
					return list;

				}
				catch(SQLException e)
				{
					e.printStackTrace();
				}
		}


		return list;
	}


	public double  getInterest(int term,String ctype,String cage)
	{
		double interest=0;
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql=null;
		String status="true";
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");
			sql="select min_days,max_days,interest from fixeddepositscheme where customertype=? and customerage=? and status=?";
			pst=con.prepareStatement(sql);
			pst.setString(1, ctype);
			pst.setString(2, cage);
			pst.setString(3, status);
			rs=pst.executeQuery();
			int min=0,max=0;
			double intr=0;
			while(rs.next())
			{
				min=rs.getInt(1);
				max=rs.getInt(2);
				intr=rs.getDouble(3);
				if(term>=min||term<=max)
				{
					interest=intr;
					return interest;
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
					
					return interest;

				}
				catch(SQLException e)
				{
					e.printStackTrace();
				}
		}


		return interest;
	}


}


