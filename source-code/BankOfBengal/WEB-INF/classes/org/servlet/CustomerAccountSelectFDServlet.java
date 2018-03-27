package org.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CustomerAccountSelectFDServlet
 */
public class CustomerAccountSelectFDServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerAccountSelectFDServlet() {
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
		String accountno=request.getParameter("accountno");
		String password=request.getParameter("password");
		
		org.dao.CustomerAccountDAO custDAO=new org.dao.CustomerAccountDAO();
		
		boolean validAccount=custDAO.isAccountValid(accountno, password);
		String branchcode="";
		if(validAccount)
		{
			branchcode=custDAO.getBranchCode(accountno);
			session.setAttribute("FDaccountnoSession",accountno);
			session.setAttribute("FDbranchcodeSession",branchcode);
			RequestDispatcher rd=request.getRequestDispatcher("OnlineFDPart2.jsp");
			rd.forward(request, response);
			
		}
		else
		{
			RequestDispatcher rd=request.getRequestDispatcher("CustomerPasswordMismatch.jsp");
			rd.forward(request, response);
		}

	
	}

}
