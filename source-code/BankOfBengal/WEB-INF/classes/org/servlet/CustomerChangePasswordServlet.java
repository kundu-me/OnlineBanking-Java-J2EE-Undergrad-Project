package org.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CustomerChangePassword
 */
public class CustomerChangePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerChangePasswordServlet() {
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
		org.dao.CustomerSettingsDAO custDAO=new org.dao.CustomerSettingsDAO();
		org.dao.CustomerAccountDAO accDAO=new org.dao.CustomerAccountDAO();
	
		String username=request.getParameter("username");
		String oldpassword=request.getParameter("oldPassword");
		String newpassword=request.getParameter("newPassword");
		
		String settings="";
		
		boolean isValid=accDAO.isCustomerValid(username, oldpassword);
		if(isValid)
		{
			boolean success1=accDAO.updatePassword(username,newpassword);
			boolean success2=custDAO.updatePassword(username,newpassword);
				
			if(success1==true && success2==true)
			{
				RequestDispatcher rd=request.getRequestDispatcher("CustomerWelcome.jsp");
				rd.forward(request, response);
			}
			else
			{
				response.sendRedirect("CustomerChangePassword.jsp");
			}
		}
		else
		{
			response.sendRedirect("CustomerChangePassword.jsp");
		}
	}

}
