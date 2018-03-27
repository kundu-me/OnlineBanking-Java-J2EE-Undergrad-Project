package org.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AdminChangePasswordServlet
 */
public class AdminChangePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminChangePasswordServlet() {
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
		
		org.dao.AdminAccountDAO accDAO=new org.dao.AdminAccountDAO();
	
		String username=request.getParameter("username");
		String oldpassword=request.getParameter("oldPassword");
		String newpassword=request.getParameter("newPassword");
		
		String settings="";
		
		boolean isValid=accDAO.isAdminAccountValid(username, oldpassword);
		
		if(isValid)
		{
			boolean success=accDAO.updatePassword(username,newpassword);
							
			if(success==true)
			{
				RequestDispatcher rd=request.getRequestDispatcher("AdminHome.jsp");
				rd.forward(request, response);
			}
			else
			{
				response.sendRedirect("AdminChangePassword.jsp");
			}
		}
		else
		{
			response.sendRedirect("AdminChangePassword.jsp");
		}
	}
	}

