package org.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CustomerAccountCloseServlet
 */
public class CustomerAccountCloseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerAccountCloseServlet() {
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
		
		String accountno=request.getParameter("accountno");
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String question=request.getParameter("securityQuestion");
		String answer=request.getParameter("securityAnswer");
		
		org.dao.CustomerAccountDAO acc=new org.dao.CustomerAccountDAO();
		org.dao.CustomerSettingsDAO settings=new org.dao.CustomerSettingsDAO();
		boolean valid1=acc.isUsernameAccountValid(accountno, username, password);
		boolean valid2=settings.isUsernameSecurityQAVAlid(username, question, answer);
		if(valid1==true && valid2==true)
		{
			boolean valid3=acc.updateAccountStatus(accountno,"closing");
			if(valid3==true)
			{
				RequestDispatcher rd=request.getRequestDispatcher("AccountCloseSuccess.jsp");
				rd.forward(request, response);
			}
			else
			{
				RequestDispatcher rd=request.getRequestDispatcher("AccountCloseFailure.jsp");
				rd.forward(request, response);
			}
		}
		else
		{
			RequestDispatcher rd=request.getRequestDispatcher("AccountCloseFailure.jsp");
			rd.forward(request, response);
		}
	}

}
