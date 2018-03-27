package org.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ForgotPasswordServlet
 */
public class ForgotPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForgotPasswordServlet() {
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
		String question=request.getParameter("securityQuestion");
		String answer=request.getParameter("securityAnswer");
		
		org.dao.CustomerAccountDAO custDAO=new org.dao.CustomerAccountDAO();
		org.dao.CustomerSettingsDAO custSettingsDAO=new org.dao.CustomerSettingsDAO();
		org.bean.PasswordEncryption pass=new org.bean.PasswordEncryption();
		org.bean.SendEmail emailToCustomer=new org.bean.SendEmail();
		org.dao.Form1PersonalDetailsDAO f1=new org.dao.Form1PersonalDetailsDAO();
		
		boolean isUsername=custDAO.isUsernameInList(username);
		if(isUsername==true)
		{
			boolean isValid=custSettingsDAO.isUsernameSecurityQAVAlid(username, question, answer);
			if(isValid==true)
			{
				
				String passwordT=custDAO.getPassword(username);
				String cid=custDAO.getCid(username);
				String password=pass.passwordDecryption(passwordT);
				String name=f1.getFname(cid);
				String to=f1.getEmail(cid);
				
				String sub="ACCOUNT FORGOT PASSWORD ";
				String msg="Dear "+name+",\n"
						+"Your Login Details is As Follows:\n"
						+"Username OR Login ID : "+username+"\n"
						+"Password : "+password;
				emailToCustomer.sendEmail(to, sub, msg);
				
				RequestDispatcher rd=request.getRequestDispatcher("CustomerLogin.jsp");
				rd.forward(request, response);
			}
			else
			{
				response.sendRedirect("CustomerForgotPassword.jsp");
			}
		}
		else
		{
			response.sendRedirect("CustomerForgotPassword.jsp");
		}
	}

}
