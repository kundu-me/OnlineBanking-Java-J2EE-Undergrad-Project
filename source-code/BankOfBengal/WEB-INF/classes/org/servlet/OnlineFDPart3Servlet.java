package org.servlet;

import java.io.IOException;
import java.util.AbstractList;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class OnlineFDPart3Servlet
 */
public class OnlineFDPart3Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OnlineFDPart3Servlet() {
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

		HttpSession session=request.getSession(false);
		String branchcode=(String) session.getAttribute("FDbranchcodeSession");
		String cid=(String) session.getAttribute("FDcidSession");
		String fid=(String) session.getAttribute("fidSession");
		String accountno=(String) session.getAttribute("FDaccountnoSession");
		String termN=request.getParameter("termN");
		String termL=request.getParameter("termL");
		String amountString=request.getParameter("amount");
		double amount=Double.parseDouble(amountString);
		int amountInt=(int) amount;
		String email=(String) session.getAttribute("FDemailSession");
		int term=0;
		double interest=0,penalty=0;
		try
		{
			if(termL.equalsIgnoreCase("Days"))
			{
			
				term=Integer.parseInt(termN);
			}
			if(termL.equalsIgnoreCase("Months"))
			{
			
				term=Integer.parseInt(termN)*30;
			}
			if(termL.equalsIgnoreCase("Years"))
			{
			
				term=Integer.parseInt(termN)*365;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		org.dao.Form1PersonalDetailsDAO f1=new org.dao.Form1PersonalDetailsDAO();
		org.dao.CustomerAccountDAO custDAO=new org.dao.CustomerAccountDAO();
		org.dao.FixedDepositDAO fdDAO=new org.dao.FixedDepositDAO();
		org.dao.FixedDepositSchemeDAO scheme=new org.dao.FixedDepositSchemeDAO();
		org.dao.TransactionDetailsDAO transDAO=new org.dao.TransactionDetailsDAO();
		org.bean.SendEmail emailToCustomer=new org.bean.SendEmail();
		
		String sub="MONEY TRANSFERRED";
		String msg="";
		
		String ctype=f1.getCtype(cid);
		String cage=f1.getCage(cid);
		
		ArrayList<org.bean.FixedDepositScheme> list=null;
		list=scheme.getInterestAndPenalty(term, ctype, cage);
		if(list!=null)
		{
			for(org.bean.FixedDepositScheme obj:list)
			{
				interest=obj.getInterest();
				penalty=obj.getPrematurepenalty();
			}
		}
		
		
			boolean validBalance=custDAO.isBalanceAvailable(accountno,amountInt);
			if(validBalance)
			{
				String transactionid=fdDAO.setFixedDepositRequest(fid, accountno, branchcode, email, amountInt, interest, penalty, term);
				String transactiontype="sub";
				String remarks="Money Transfered To Fixed Deposit Account With ID";
				double current_balance=custDAO.updateAccountBalance(accountno, amount, transactiontype);
				
				boolean validUpdate=transDAO.setTransactionDetails(accountno, branchcode, transactionid,
																transactiontype, amount, current_balance, remarks);
				
				if(validUpdate)
				{
					session.setAttribute("tidSession", transactionid);
					RequestDispatcher rd=request.getRequestDispatcher("CustomerTransferMoneySuccessful.jsp");
					rd.forward(request, response);
				}
				else
				{
					response.sendRedirect("CustomerTransferMoney.jsp");
				}
			}
			else
			{
				RequestDispatcher rd=request.getRequestDispatcher("CustomerInsufficientBalance.jsp");
				rd.forward(request, response);
			}
		
	}

}
