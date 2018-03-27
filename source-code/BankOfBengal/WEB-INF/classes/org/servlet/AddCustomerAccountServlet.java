package org.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AddCustomerAccountServlet
 */
public class AddCustomerAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCustomerAccountServlet() {
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
		String user=request.getParameter("user");
		
		
		org.dao.CustomerAccountDAO accDAO=new org.dao.CustomerAccountDAO();
		org.dao.AddCustomerAccountDAO addAccDAO=new org.dao.AddCustomerAccountDAO();
		boolean valid=accDAO.isUsernameAccountValid(accountno,username, password);
			
		if(valid)
		{
			boolean success1=addAccDAO.addCustomerAccount(user, accountno);
			
			if(success1)
			{
				RequestDispatcher rd=request.getRequestDispatcher("AddCustomerAccountSuccessful.jsp");
				rd.forward(request, response);
			}
			else
			{
				response.sendRedirect("AddCustomerAccount.jsp");
			}
			
		}
		else
		{
			response.sendRedirect("AddCustomerAccount.jsp");
		}
	}

}
