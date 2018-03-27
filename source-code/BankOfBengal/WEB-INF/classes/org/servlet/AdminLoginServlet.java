package org.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AdminLoginServlet
 */
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLoginServlet() {
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
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		
		String ipaddress=request.getRemoteAddr();
		
		org.dao.AdminAccountDAO adminDAO=new org.dao.AdminAccountDAO();
		org.dao.AdminLoginDAO loginDAO=new org.dao.AdminLoginDAO();
		
		boolean valid=adminDAO.isAdminAccountValid(username, password);
			
		if(valid)
		{
			HttpSession session=request.getSession(true);
			session.setAttribute("AdminUsernameSession",username);
			
			boolean is1stLogin=loginDAO.is1stLogin(username);
			
			boolean success=loginDAO.setAdminLogin(username, ipaddress);
			
			if(!success)
			{
				session.invalidate();
				response.sendRedirect("AdminLogin.jsp");
			}
			if(is1stLogin)
			{
				RequestDispatcher rd=request.getRequestDispatcher("AdminChangeDefaultPassword.jsp");
				rd.forward(request, response);
			}
			else
			{
				RequestDispatcher rd=request.getRequestDispatcher("AdminHomeT.jsp");
				rd.forward(request, response);
			}
		}
		else
		{
			response.sendRedirect("AdminLogin.jsp");
		}
	}
	}


