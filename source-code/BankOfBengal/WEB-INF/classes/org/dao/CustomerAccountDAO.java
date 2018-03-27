/**
 * 
 */
package org.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @author Nirmallya Kundu
 *
 */
public class CustomerAccountDAO {

	/**
	 * 
	 */
	public CustomerAccountDAO() {
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
			sql="select * from customeraccount";
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

			sql="select password from customeraccount where username=?";
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

	public String getBranchCode(String accountno)
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

			sql="select branchcode from customeraccount where accountno=?";
			pst=con.prepareStatement(sql);
			pst.setString(1, accountno);
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

	public String getAccountNoFromCID(String cid)
	{
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql=null;
		String accountno="";
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");

			sql="select accountno from customeraccount where cid=?";
			pst=con.prepareStatement(sql);
			pst.setString(1, cid);
			rs=pst.executeQuery();
			while(rs.next())
			{
				accountno=rs.getString(1);
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
				return accountno;
			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
		}

		return accountno;

	}

	public String getCid(String username)
	{
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql=null;
		String cid="";
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");

			sql="select cid from customeraccount where username=?";
			pst=con.prepareStatement(sql);
			pst.setString(1, username);
			rs=pst.executeQuery();
			while(rs.next())
			{
				cid=rs.getString(1);
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
				return cid;
			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
		}

		return cid;

	}

	public String getCidFromAccountno(String accountno)
	{
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql=null;
		String cid="";
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");

			sql="select cid from customeraccount where accountno=?";
			pst=con.prepareStatement(sql);
			pst.setString(1, accountno);
			rs=pst.executeQuery();
			while(rs.next())
			{
				cid=rs.getString(1);
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
				return cid;
			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
		}

		return cid;

	}

	public boolean setCustomerAccount(int serial, String accountno, String cid, String branchcode,
			String email, String username, String password, double balance, String status)
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

			sql="insert into customeraccount values(?,?,?,?,?,?,?,?,?)";
			pst=con.prepareStatement(sql);
			pst.setInt(1, serial);
			pst.setString(2, accountno);
			pst.setString(3, cid);
			pst.setString(4, branchcode);
			pst.setString(5, email);
			pst.setString(6, username);
			pst.setString(7, passwordEncrypted);
			pst.setDouble(8, balance);
			pst.setString(9, status);
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

	public boolean updateCustomerAccountPassword(String username,String password)
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

			sql="update customeraccount set password=? where username=?";
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

	public double updateAccountBalance(String accountno,double amount,String transactionType)
	{
		Connection con=null;
		PreparedStatement pst=null;
		String sql=null;
		int value=0;
		ResultSet rs=null;
		double balance_before=0;
		double balance_after=0;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");

			sql="select balance from customeraccount where accountno=?";
			pst=con.prepareStatement(sql);
			pst.setString(1,accountno);
			rs=pst.executeQuery();
			if(rs.next())
			{
				balance_before=rs.getDouble(1);
			}
			if(transactionType.equalsIgnoreCase("add"))
			{
				balance_after=balance_before+amount;
			}
			if(transactionType.equalsIgnoreCase("sub"))
			{
				balance_after=balance_before-amount;
			}
			
			sql="update customeraccount set balance=? where accountno=?";
			pst=con.prepareStatement(sql);
			pst.setDouble(1,balance_after);
			pst.setString(2,accountno);
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
					return balance_after;
				}
				else
				{
					return balance_after;
				}

			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
		}


		return balance_after;

	}

	public boolean updateAccountStatus(String accountno,String status)
	{
		Connection con=null;
		PreparedStatement pst=null;
		String sql=null;
		int value=0;
		ResultSet rs=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");
			sql="update customeraccount set status=? where accountno=?";
			pst=con.prepareStatement(sql);
			pst.setString(1,status);
			pst.setString(2,accountno);
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
	public boolean isAccountValid(String accountno, String password)
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
			sql="select * from customeraccount where accountno=? and password=?";
			pst=con.prepareStatement(sql);
			pst.setString(1, accountno);
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

	public boolean isBalanceAvailable(String accountno,int amount)
	{
		
		boolean val=false;
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql=null;
		double balance;
		int balanceInt;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");
			sql="select balance from customeraccount where accountno=?";
			pst=con.prepareStatement(sql);
			pst.setString(1, accountno);
			rs=pst.executeQuery();
			if(rs.next())
			{
				balance=rs.getDouble(1);
				balanceInt=(int) balance;
				if(balanceInt>amount+org.bean.ConstraintValues.ACCOUNT_BALANCE)
				{
					val=true;
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

				return val;

			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
		}


		return val;
	}


	
	public boolean isCustomerValid(String username, String password)
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
			sql="select accountno from customeraccount where username=? and password=? and status=?";
			pst=con.prepareStatement(sql);
			pst.setString(1, username);
			pst.setString(2, passwordEncrypted);
			pst.setString(3,"active");
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

	public boolean isUsernameAccountValid(String accountno,String username, String password)
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
			sql="select accountno from customeraccount where accountno=? and username=? and password=?";
			pst=con.prepareStatement(sql);
			pst.setString(1, accountno);
			pst.setString(2, username);
			pst.setString(3, passwordEncrypted);
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
			sql="select * from customeraccount where username=?";
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
	
	public double getBalance(String accountno, String password)
	{

		double balance=0;
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
			sql="select balance from customeraccount where accountno=? and password=?";
			pst=con.prepareStatement(sql);
			pst.setString(1, accountno);
			pst.setString(2, passwordEncrypted);
			rs=pst.executeQuery();
			if(rs.next())
			{
				balance=rs.getDouble(1);
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

				return balance;

			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
		}


		return balance;
	}
	public double getBalance(String accountno)
	{

		double balance=0;
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");
			sql="select balance from customeraccount where accountno=?";
			pst=con.prepareStatement(sql);
			pst.setString(1, accountno);
			rs=pst.executeQuery();
			if(rs.next())
			{
				balance=rs.getDouble(1);
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

				return balance;

			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
		}


		return balance;
	}

	public String getLoginDetails(String username)
	{

		String details="";
		String accountno="",cid="",branchcode="",name="",email="";
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");
			sql="select accountno,cid,branchcode,email from customeraccount where username=?";
			pst=con.prepareStatement(sql);
			pst.setString(1, username);
			rs=pst.executeQuery();
			while(rs.next())
			{
				accountno=rs.getString(1);
				cid=rs.getString(2);
				branchcode=rs.getString(3);
				email=rs.getString(4);
			}

			sql="select salutation,fname,mname,lname from  personaldetails where cid=?";
			pst=con.prepareStatement(sql);
			pst.setString(1, cid);
			rs=pst.executeQuery();

			while(rs.next())
			{
				String salutation=rs.getString(1);
				String fname=rs.getString(2);
				String mname=rs.getString(3);
				String lname=rs.getString(4);
				if(mname.equalsIgnoreCase("n/a"))
				{
					name=salutation+" "+fname+" "+lname;
				}
				else
				{
					name=salutation+" "+fname+" "+mname+" "+lname;
				}
			}

			details=accountno+","+cid+","+branchcode+","+email+","+name;
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

				return details;

			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
		}


		return details;
	}

	public String getName(String cid)
	{

		String name="";
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");
			
			sql="select salutation,fname,mname,lname from  personaldetails where cid=?";
			pst=con.prepareStatement(sql);
			pst.setString(1, cid);
			rs=pst.executeQuery();

			while(rs.next())
			{
				String salutation=rs.getString(1);
				String fname=rs.getString(2);
				String mname=rs.getString(3);
				String lname=rs.getString(4);
				if(mname.equalsIgnoreCase("n/a"))
				{
					name=salutation+" "+fname+" "+lname;
				}
				else
				{
					name=salutation+" "+fname+" "+mname+" "+lname;
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

				return name;

			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
		}


		return name;
	}

	public String getAllEmail(String branchcode)
	{

		
		String email="";
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String status="active";
		branchcode=branchcode.trim();
		String sql=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");
			
			sql="select email from customeraccount where status=? and branchcode=?";
			pst=con.prepareStatement(sql);
			pst.setString(1, status);
			pst.setString(2, branchcode);
			rs=pst.executeQuery();

			while(rs.next())
			{
				email+=rs.getString(1)+",";
			}
			email+="bankofbengal.india@gmail.com";
			
			System.out.println(branchcode+" - "+email);
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

	public void updateAccountPassword(String accountno,String OldPassword,String NewPassword)
	{
		Connection con=null;
		PreparedStatement pst=null;
		String sql=null;
		org.bean.PasswordEncryption passEncrypt=new org.bean.PasswordEncryption();
		String OldPasswordEncrypted=passEncrypt.passwordEncryption(OldPassword);
		String NewPasswordEncrypted=passEncrypt.passwordEncryption(NewPassword);
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");

			sql="update customeraccount set password=? where accountno=? and password=?";
			pst=con.prepareStatement(sql);
			pst.setString(1, NewPasswordEncrypted);
			pst.setString(2, accountno);
			pst.setString(3, OldPasswordEncrypted);
			pst.executeUpdate();
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

			sql="update customeraccount set password=? where username=?";
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
	
	public String getEmail(String accountno)
	{
		String retEmail="";
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");

			sql="select email from customeraccount where accountno=?";
			pst=con.prepareStatement(sql);
			pst.setString(1,accountno);
			rs=pst.executeQuery();

			if(rs.next())
			{
				retEmail=rs.getString(1);
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
				return retEmail;
				

			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
		}
		return retEmail;
	}

}
