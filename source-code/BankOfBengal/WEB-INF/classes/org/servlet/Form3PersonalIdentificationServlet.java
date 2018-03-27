package org.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.bean.SendEmail;
import org.dao.Form3PersonalIdentificationDAO;
import org.dao.OtherAccountsDAO;

/**
 * Servlet implementation class Form3PersonalIdentificationServlet
 */
public class Form3PersonalIdentificationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Form3PersonalIdentificationServlet() {
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
		
		String status="true";
		HttpSession session=request.getSession();
		String to=(String) session.getAttribute("emailSession");
		String name=(String) session.getAttribute("nameSession");;
		String sub="";
		String msg="";
		
		OtherAccountsDAO otherAccountsDAO=new OtherAccountsDAO();
		String applicationno_string=request.getParameter("applicationno");
		int applicationno=Integer.parseInt(applicationno_string);
		String cid=request.getParameter("cid"); 
		String	poilabel=request.getParameter("poilabel");
		String poino=request.getParameter("poino");
		String poiplace=request.getParameter("poiplace");
		String poidate=request.getParameter("poidate");
		String poalabel=request.getParameter("poalabel");
		String poano=request.getParameter("poano");
		String poaplace=request.getParameter("poaplace");
		String poadate=request.getParameter("poadate"); 
		
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
		
		
		boolean success1=form3PersonalIdentificationDAO.setForm3PersonalIdentification(applicationno, cid, poilabel, poino,
										poiplace, poidate, poalabel, poano, poaplace, poadate, otheraccount, status);
		
		
		if(success1==true && otheraccount==successNo)
		{
			sub="APPLICATION UNDER PROCESSING";
			msg="Dear "+name+",\n"+"We have received your appliction.\n Your Customer ID is "+cid+".\n"
					+"And your Application is under processing";
			SendEmail email=new SendEmail();
			email.sendEmail(to, sub, msg);
			RequestDispatcher rd=request.getRequestDispatcher("OnlineAccOpenFormConfirm.jsp");
			rd.forward(request, response);
		}
		else
		{
			
		}
		
	}

}
