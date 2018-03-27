package org.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AdminChangeDefaultPasswordServlet
 */
public class AdminChangeDefaultPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminChangeDefaultPasswordServlet() {
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
		
		org.dao.AdminAccountDAO adminDAO=new org.dao.AdminAccountDAO();
		String username=request.getParameter("username");
		String password=request.getParameter("newPassword");
		
		boolean success=adminDAO.updateAdminAccountPassword(username, password);

		if(success==true)
		{
			RequestDispatcher rd=request.getRequestDispatcher("AdminHome.jsp");
			rd.forward(request, response);
		}
		else
		{
			response.sendRedirect("AdminChangeDefaultPassword.jsp");

		}
	
	}

}
