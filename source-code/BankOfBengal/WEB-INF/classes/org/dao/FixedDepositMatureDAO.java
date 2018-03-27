package org.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class FixedDepositMatureDAO {

	public FixedDepositMatureDAO() {
		// TODO Auto-generated constructor stub
	}
	
	public boolean setFixeddepositMature(String fid,String tid,String accountno,String branchcode,double amount,double interest,double penalty,double total)
	{
		Connection con=null;
		PreparedStatement pst=null;
		String sql=null;
		int value=0;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");

			sql="insert into fixeddepositmature(fid,transactionid,accountno,branchcode,amount,"+
				"interestamount,prematurepenaltyamount,totalamount,mature_date) values(?,?,?,?,?,?,?,?,CURDATE())";
			pst=con.prepareStatement(sql);
			pst.setString(1, fid);
			pst.setString(2, tid);
			pst.setString(3, accountno);
			pst.setString(4, branchcode);
			pst.setDouble(5, amount);
			pst.setDouble(6, interest);
			pst.setDouble(7, penalty);
			pst.setDouble(8, total);
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

}
