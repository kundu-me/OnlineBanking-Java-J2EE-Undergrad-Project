package org.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionBindingEvent;

/**
 * Servlet implementation class ChangeDefaultPasswordServlet
 */
public class ChangeDefaultPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final ServletRequest request = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeDefaultPasswordServlet() {
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
		String accountno=(String)session.getAttribute("accountnoSession");
		String password=request.getParameter("newPassword");
		String question=request.getParameter("securityQuestion");
		String answer=request.getParameter("securityAnswer");
		String twostepverification=request.getParameter("twostepverification");
		String settings="";
		boolean success1=custDAO.setCustomerSettings(username, accountno, password, question, answer, twostepverification, settings);
		boolean success2=accDAO.updatePassword(username,password);
		if(success1==true && success2==true)
		{
			RequestDispatcher rd=request.getRequestDispatcher("CustomerHome.jsp");
			rd.forward(request, response);
		}
		else
		{
			response.sendRedirect("ChangeDefaultPassword.jsp");

		}
		
	}
	

}
