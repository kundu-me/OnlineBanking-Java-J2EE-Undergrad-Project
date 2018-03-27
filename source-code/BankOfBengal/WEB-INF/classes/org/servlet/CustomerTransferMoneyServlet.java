package org.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CustomerTransferMoneyServlet
 */
public class CustomerTransferMoneyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerTransferMoneyServlet() {
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
		String branchcode=(String) session.getAttribute("sender_branchcodeSession");
		String sender_accountno=request.getParameter("sender_accountno");
		String receiver_accountno=request.getParameter("receiver_accountno");
		String receiver_bank=request.getParameter("receiver_bank");
		
		String amountString=request.getParameter("amount");
		double amount=Double.parseDouble(amountString);
				
		String bankchargesString=request.getParameter("bankcharges");
		double bankcharges=Double.parseDouble(bankchargesString);
		
		String totalamountString=request.getParameter("totalamount");
		double totalamount=Double.parseDouble(totalamountString);
		int totalamountInt=(int)totalamount;
		
				
		org.dao.CustomerAccountDAO custDAO=new org.dao.CustomerAccountDAO();
		org.dao.Form1PersonalDetailsDAO f1=new org.dao.Form1PersonalDetailsDAO();
		org.dao.BankAccountDAO bankDAO=new org.dao.BankAccountDAO();
		org.dao.MoneyTransferDAO moneyTransferDAO=new org.dao.MoneyTransferDAO();
		org.dao.TransactionDetailsDAO transDAO=new org.dao.TransactionDetailsDAO();
		
		String email=custDAO.getEmail(sender_accountno);
		boolean validBalance=custDAO.isBalanceAvailable(sender_accountno,totalamountInt);
			if(validBalance)
			{
				String transactionid=moneyTransferDAO.setMoneyTransferRequest(branchcode, email,sender_accountno,
															receiver_accountno, receiver_bank, amount,bankcharges,totalamount);
				String transactiontype="sub";
				double current_balance=custDAO.updateAccountBalance(sender_accountno, amount, transactiontype);
				
				String remarks="INR. "+amount+ " Transfered To Account No. "+receiver_accountno+" Of "+receiver_bank;
				boolean validUpdate1=transDAO.setTransactionDetails(sender_accountno, branchcode, transactionid,
																transactiontype, amount, current_balance, remarks);
				
				current_balance=custDAO.updateAccountBalance(sender_accountno, bankcharges, transactiontype);
				
				remarks="INR. "+bankcharges+ " Bankcharges To Transfer Amount to"+receiver_accountno+" Of "+receiver_bank;
				boolean validUpdate2=transDAO.setTransactionDetails(sender_accountno, branchcode, transactionid,
						transactiontype, bankcharges, current_balance, remarks);
				bankDAO.setBankAccountCharges(transactionid, sender_accountno, branchcode, bankcharges,"add");
				if(validUpdate1==true && validUpdate2==true)
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
