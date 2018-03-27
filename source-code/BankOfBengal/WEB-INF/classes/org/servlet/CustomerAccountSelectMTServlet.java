package org.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CustomerAccountSelectMTServlet
 */
public class CustomerAccountSelectMTServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerAccountSelectMTServlet() {
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
		
		String sender_accountno=request.getParameter("sender_accountno");
		String password=request.getParameter("password");
		
		org.dao.CustomerAccountDAO custDAO=new org.dao.CustomerAccountDAO();
		org.dao.MoneyTransferDAO moneyTransferDAO=new org.dao.MoneyTransferDAO();
		org.dao.TransactionDetailsDAO transDAO=new org.dao.TransactionDetailsDAO();
		String sender_branchcode="";
		String sender_cid="";
		boolean validAccount=custDAO.isAccountValid(sender_accountno, password);
		
		if(validAccount)
		{
			sender_branchcode=custDAO.getBranchCode(sender_accountno);
			session.setAttribute("sender_accountnoSession",sender_accountno);
			session.setAttribute("sender_branchcodeSession",sender_branchcode);
			session.setAttribute("sender_cidSession",sender_cid);
			RequestDispatcher rd=request.getRequestDispatcher("CustomerTransferMoney.jsp");
			rd.forward(request, response);
			
		}
		else
		{
			RequestDispatcher rd=request.getRequestDispatcher("CustomerPasswordMismatch.jsp");
			rd.forward(request, response);
		}
	}

}