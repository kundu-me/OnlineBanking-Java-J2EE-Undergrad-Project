/**
 * 
 */
package org.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.bean.Form2AdditionalDetails;

/**
 * @author Nirmallya Kundu
 *
 */
public class Form2AdditionalDetailsDAO {

	/**
	 * 
	 */
	public Form2AdditionalDetailsDAO() {
		// TODO Auto-generated constructor stub
	}
	public boolean setForm2AdditionalDetails(int applicationno, String cid, String religion, String category,
											String education, String occupation, String organization ,
											String designation, String income, String term,
											double assetvalue, String vehicle, double  lifeinsurancevalue, 
											String lifeinsurance, String loan, String house, String mutualfund,
											String creditcard, String it,String itno, String status)
	{
		Connection con=null;
		PreparedStatement pst=null;
		int value=0;
		String sql=null;
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");
			sql="insert into additionaldetails values(?,?,?,?,?,?,?,?,?,?," +
													 "?,?,?,?,?,?,?,?,?,?," +
													 "?)";
			pst=con.prepareStatement(sql);
			pst.setInt(1,applicationno);
			pst.setString(2,cid);
			pst.setString(3,religion);
			pst.setString(4,category);
			pst.setString(5,education);
			pst.setString(6,occupation);
			pst.setString(7,organization);
			pst.setString(8,designation);
			pst.setString(9,income);
			pst.setString(10,term);
			pst.setDouble(11,assetvalue);
			pst.setString(12,vehicle);
			pst.setDouble(13,lifeinsurancevalue);
			pst.setString(14,lifeinsurance);
			pst.setString(15,loan);
			pst.setString(16,house);
			pst.setString(17,mutualfund);
			pst.setString(18,creditcard);
			pst.setString(19,it);
			pst.setString(20,itno);
			pst.setString(21,status);
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

			sql="select * from additionaldetails where cid=?";
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

	
	public Form2AdditionalDetails getForm2AdditionalDetails(String cid)
	{

		Form2AdditionalDetails form2AdditionalDetails=null;
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql=null;
		try
		{
			
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");

			sql="select * from additionaldetails where cid=? and status=?";
			pst=con.prepareStatement(sql);
			pst.setString(1,cid);
			pst.setString(2,"true");
			rs=pst.executeQuery();

			while(rs.next())
			{
				form2AdditionalDetails=new Form2AdditionalDetails();
				form2AdditionalDetails.setApplicationno(rs.getInt(1));
				form2AdditionalDetails.setCid(rs.getString(2));
				form2AdditionalDetails.setReligion(rs.getString(3));
				form2AdditionalDetails.setCategory(rs.getString(4));
				form2AdditionalDetails.setEducation(rs.getString(5));
				form2AdditionalDetails.setOccupation(rs.getString(6));
				form2AdditionalDetails.setOrganization(rs.getString(7));
				form2AdditionalDetails.setDesignation(rs.getString(8));
				form2AdditionalDetails.setIncome(rs.getString(9));
				form2AdditionalDetails.setTerm(rs.getString(10));
				form2AdditionalDetails.setAssetvalue(rs.getDouble(11));
				form2AdditionalDetails.setVehicle(rs.getString(12));
				form2AdditionalDetails.setLifeinsurancevalue(rs.getDouble(13));
				form2AdditionalDetails.setLifeinsurance(rs.getString(14));
				form2AdditionalDetails.setLoan(rs.getString(15));
				form2AdditionalDetails.setHouse(rs.getString(16));
				form2AdditionalDetails.setMutualfund(rs.getString(17));
				form2AdditionalDetails.setCreditcard(rs.getString(18));
				form2AdditionalDetails.setIt(rs.getString(19));
				form2AdditionalDetails.setItno(rs.getString(20));
				form2AdditionalDetails.setStatus(rs.getString(21));
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

		return form2AdditionalDetails;
		
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
			sql="update additionaldetails set status=? where cid=?";
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
	
	public boolean updateForm2AdditionalDetails(String cid, String religion, String category,
			String education, String occupation, String organization ,
			String designation, String income, String term,
			double assetvalue, String vehicle, double  lifeinsurancevalue, 
			String lifeinsurance, String loan, String house, String mutualfund,
			String creditcard, String it,String itno)
{

		Connection con=null;
		PreparedStatement pst=null;
		int value=0;
		String sql=null;

		try
		{
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");
		sql="update additionaldetails set religion=?,category=?,education=?,occupation=?,organization=?,"+
			"designation=?,income=?,term=?,assetvalue=?,vehicle=?,lifeinsurancevalue=?,lifeinsurance=?,"+
			"loan=?,house=?,mutualfund=?,creditcard=?,it=?,itno=? where cid=? and status=?";
		pst=con.prepareStatement(sql);
		
		pst.setString(1,religion);
		pst.setString(2,category);
		pst.setString(3,education);
		pst.setString(4,occupation);
		pst.setString(5,organization);
		pst.setString(6,designation);
		pst.setString(7,income);
		pst.setString(8,term);
		pst.setDouble(9,assetvalue);
		pst.setString(10,vehicle);
		pst.setDouble(11,lifeinsurancevalue);
		pst.setString(12,lifeinsurance);
		pst.setString(13,loan);
		pst.setString(14,house);
		pst.setString(15,mutualfund);
		pst.setString(16,creditcard);
		pst.setString(17,it);
		pst.setString(18,itno);
		pst.setString(19,cid);
		pst.setString(20,"true");
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
