package org.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dao.Form3PersonalIdentificationDAO;
import org.dao.OtherAccountsDAO;

/**
 * Servlet implementation class AdminEditForm3Servlet
 */
public class AdminEditForm3Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminEditForm3Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		OtherAccountsDAO otherAccountsDAO=new OtherAccountsDAO();
		String status="true";
		String cid=request.getParameter("cid"); 
		
		String	poilabel=request.getParameter("poilabel");
		String poino=request.getParameter("poino");
		String poiplace=request.getParameter("poiplace");
		String poidate=request.getParameter("poidate");
		
		String poalabel=request.getParameter("poalabel");
		String poano=request.getParameter("poano");
		String poaplace=request.getParameter("poaplace");
		String poadate=request.getParameter("poadate"); 
		
		boolean success1=otherAccountsDAO.updateOtherAccountsFalse(cid);
		
		int otheraccount=0;
		int noofaccount=0;
		int successNo=0;
		String serial;
		
		String bank="",branch="",accounttype="",accountno="";
		bank=request.getParameter("bank1");
		branch=request.getParameter("branch1");
		accounttype=request.getParameter("accounttype1");
		accountno=request.getParameter("accountno1");
		if(!bank.equalsIgnoreCase("n/a"))
		{
			noofaccount=noofaccount+1;
			serial=cid+noofaccount;
			boolean success=otherAccountsDAO.setOtherAccounts(serial,cid,bank, branch, accounttype, accountno,status);
			if(success)
			{
				successNo=successNo+1;
			}
			
		}
		
		bank="";branch="";accounttype="";accountno="";
		bank=request.getParameter("bank2");
		branch=request.getParameter("branch2");
		accounttype=request.getParameter("accounttype2");
		accountno=request.getParameter("accountno2");
		if(!bank.equalsIgnoreCase("n/a"))
		{
			noofaccount=noofaccount+1;
			serial=cid+noofaccount;
			boolean success=otherAccountsDAO.setOtherAccounts(serial,cid,bank, branch, accounttype, accountno,status);
			if(success)
			{
				successNo=successNo+1;
			}
		}
		
		bank="";branch="";accounttype="";accountno="";
		bank=request.getParameter("bank3");
		branch=request.getParameter("branch3");
		accounttype=request.getParameter("accounttype3");
		accountno=request.getParameter("accountno3");
		if(!bank.equalsIgnoreCase("n/a"))
		{
			noofaccount=noofaccount+1;
			serial=cid+noofaccount;
			boolean success=otherAccountsDAO.setOtherAccounts(serial,cid,bank, branch, accounttype, accountno,status);
			if(success)
			{
				successNo=successNo+1;
			}
		}
		
		bank="";branch="";accounttype="";accountno="";
		bank=request.getParameter("bank4");
		branch=request.getParameter("branch4");
		accounttype=request.getParameter("accounttype4");
		accountno=request.getParameter("accountno4");
		if(!bank.equalsIgnoreCase("n/a"))
		{
			noofaccount=noofaccount+1;
			serial=cid+noofaccount;
			boolean success=otherAccountsDAO.setOtherAccounts(serial,cid,bank, branch, accounttype, accountno,status);
			if(success)
			{
				successNo=successNo+1;
			}
		}
		
		bank="";branch="";accounttype="";accountno="";
		bank=request.getParameter("bank5");
		branch=request.getParameter("branch5");
		accounttype=request.getParameter("accounttype5");
		accountno=request.getParameter("accountno5");
		if(!bank.equalsIgnoreCase("n/a"))
		{
			noofaccount=noofaccount+1;
			serial=cid+noofaccount;
			boolean success=otherAccountsDAO.setOtherAccounts(serial,cid,bank, branch, accounttype, accountno,status);
			if(success)
			{
				successNo=successNo+1;
			}
		}
		
		otheraccount=noofaccount;
		
		Form3PersonalIdentificationDAO form3PersonalIdentificationDAO= new Form3PersonalIdentificationDAO();
		
		
		boolean success2=form3PersonalIdentificationDAO.updateForm3PersonalIdentification(cid, poilabel, poino,	poiplace, poidate,
																			poalabel, poano, poaplace, poadate, otheraccount);
		
		
		if(success2==true)
		{
			RequestDispatcher rd=request.getRequestDispatcher("AdminEditFormSuccess.jsp");
			rd.forward(request, response);
		}
		else
		{
			response.sendRedirect("AdminEditFormPart3.jsp");
		}
		

	}

}
