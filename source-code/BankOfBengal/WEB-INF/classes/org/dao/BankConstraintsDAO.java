package org.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BankConstraintsDAO {

	public BankConstraintsDAO() {
		// TODO Auto-generated constructor stub
	}
	
	public boolean updateBranchConstraints(int serial, String value,String type)
	{
		Connection con=null;
		PreparedStatement pst=null;
		int val=0;
		String sql=null;

		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");
			sql="update bankconstraints set value=? , type=? where serial=?";
			pst=con.prepareStatement(sql);
			pst.setString(1,value);
			pst.setString(2,type);
			pst.setInt(3, serial);
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

				if(val!=0)
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


	public ArrayList<org.bean.BankConstraints> getBankConstraints()
	{
		
		org.bean.BankConstraints constraint=null;
		ArrayList<org.bean.BankConstraints> list=new ArrayList<org.bean.BankConstraints>();
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql=null;
		int i=0;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");
			sql="select name,value,type from bankconstraints";
			pst=con.prepareStatement(sql);
			rs=pst.executeQuery();
			while(rs.next())
			{
				constraint=new org.bean.BankConstraints();
				constraint.setName(rs.getString(1));
				constraint.setValue(rs.getString(2));
				constraint.setType(rs.getString(3));
				list.add(constraint);
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
