package org.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class BankTSBranchSelectServlet
 */
public class BankTSBranchSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BankTSBranchSelectServlet() {
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
		

		String start_date=request.getParameter("start_date");
		String end_date=request.getParameter("end_date");
		String branchcode=request.getParameter("branchcode");
	
		session.setAttribute("BankStart_dateSession", start_date);
		session.setAttribute("BankEnd_dateSession", end_date);
		session.setAttribute("BankBranchcodeSession", branchcode);
		
		RequestDispatcher rd=request.getRequestDispatcher("BankTransactionStatement.jsp");
		rd.forward(request, response);
			
	}

}
