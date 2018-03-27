package org.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AdminMatureFDServlet
 */
public class AdminMatureFDServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMatureFDServlet() {
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
		
		org.dao.FixedDepositMatureDAO fd=new org.dao.FixedDepositMatureDAO();
		double balance=0;
		String fid=request.getParameter("fid");
		String tid=request.getParameter("tid");
		String accountno=request.getParameter("accountno");
		String branchcode=request.getParameter("branchcode");
		String amtS=request.getParameter("amount");
		String intrAmtS=request.getParameter("interestAmount");
		String penaltyAmtS=request.getParameter("penaltyAmount");
		String totalAmtS=request.getParameter("totalAmount");
		
		double amount=0,interestAmount=0,penaltyAmount=0,totalAmount=0;
		try
		{
			amount=Double.parseDouble(amtS);
			interestAmount=Double.parseDouble(intrAmtS);
			penaltyAmount=Double.parseDouble(penaltyAmtS);
			totalAmount=Double.parseDouble(totalAmtS);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		boolean success1=fd.setFixeddepositMature(fid, tid, accountno, branchcode, amount, interestAmount, penaltyAmount, totalAmount);
		
		String remarks="Money Received From e-Fixed Deposit Maturity With ID: "+fid;
		String transactionType="add";
		
		org.dao.CustomerAccountDAO custDAO=new org.dao.CustomerAccountDAO();
		org.dao.BankAccountDAO bank=new org.dao.BankAccountDAO();
		balance=custDAO.updateAccountBalance(accountno, totalAmount, transactionType);

		org.dao.TransactionDetailsDAO transDAO=new org.dao.TransactionDetailsDAO();
		boolean success2=transDAO.setTransactionDetails(accountno, branchcode, tid, transactionType, totalAmount, balance, remarks);

		String status="matured";
		org.dao.FixedDepositDAO fdDAO=new org.dao.FixedDepositDAO();
		boolean success3=fdDAO.updateMatureStatus(tid, status);
		double bankcharges=interestAmount-penaltyAmount;
		boolean success4=bank.setBankAccountCharges(tid, accountno, branchcode, bankcharges, "sub");
		
		if(success1==true && success2==true && success3==true && success4==true)
		{
			RequestDispatcher rd=request.getRequestDispatcher("AdminMatureFDSuccess.jsp");
			rd.forward(request, response);
		}
		else
		{
			response.sendRedirect("AdminMatureFDWindow.jsp");
		}

	}

	
}
