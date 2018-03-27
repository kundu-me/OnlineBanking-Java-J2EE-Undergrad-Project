package org.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateConstraintsServlet
 */
public class UpdateConstraintsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateConstraintsServlet() {
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
		
		org.dao.BankConstraintsDAO  bank=new org.dao.BankConstraintsDAO();
		String value1=request.getParameter("value1");
		String type1=request.getParameter("type1");
		boolean s1=bank.updateBranchConstraints(1, value1, type1);
		
		String value2=request.getParameter("value2");
		String type2=request.getParameter("type2");
		boolean s2=bank.updateBranchConstraints(2, value2, type2);
		if(s1 && s2)
		{
			RequestDispatcher rd=request.getRequestDispatcher("UpdateBankConstraintsSuccess.jsp");
			rd.forward(request, response);
		}
		else
		{
			response.sendRedirect("UpdateBankConstraints.jsp");
		}

	}

}
