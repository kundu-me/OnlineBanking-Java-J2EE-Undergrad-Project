package org.servlet;

import java.io.IOException;
import java.lang.ProcessBuilder.Redirect;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.dao.CustomerAccountDAO;

/**
 * Servlet implementation class CustomerLoginServlet
 */
public class CustomerLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerLoginServlet() {
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
		
		org.dao.CustomerAccountDAO accDAO=new org.dao.CustomerAccountDAO();
		org.dao.CustomerLoginDAO loginDAO=new org.dao.CustomerLoginDAO();
		
		boolean valid=accDAO.isCustomerValid(username, password);
			
		if(valid)
		{
			String details=accDAO.getLoginDetails(username);
			String[] str=details.split(",");
			String accountno=str[0];
			String cid=str[1];
			String branchcode=str[2];
			String email=str[3];
			String name=str[4];
			HttpSession session=request.getSession(true);
			session.setAttribute("usernameSession",username);
			session.setAttribute("accountnoSession",accountno);
			session.setAttribute("cidSession",cid);
			session.setAttribute("nameSession",name);
			session.setAttribute("branchcodeSession",branchcode);
			session.setAttribute("emailSession",email);
			boolean is1stLogin=loginDAO.is1stLogin(username);
			
			boolean success=loginDAO.setCustomerLogin(username, accountno, ipaddress);
			
			if(!success)
			{
				session.invalidate();
				response.sendRedirect("CustomerLogin.jsp");
			}
			if(is1stLogin)
			{
				RequestDispatcher rd=request.getRequestDispatcher("ChangeDefaultPassword.jsp");
				rd.forward(request, response);
			}
			else
			{
				RequestDispatcher rd=request.getRequestDispatcher("CustomerHomeT.jsp");
				rd.forward(request, response);
			}
		}
		else
		{
			response.sendRedirect("CustomerLogin.jsp");
		}
	}

}
