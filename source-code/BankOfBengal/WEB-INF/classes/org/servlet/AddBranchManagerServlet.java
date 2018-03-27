package org.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddBranchManagerServlet
 */
public class AddBranchManagerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddBranchManagerServlet() {
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
		
		String branchcode=request.getParameter("branchcode");
		String email=request.getParameter("email");
		String name=request.getParameter("name");
		
		org.dao.AdminAccountDAO admin=new org.dao.AdminAccountDAO();

		String password="";
		org.bean.PasswordGenerator pass=new org.bean.PasswordGenerator();
		password=pass.passwordGenerator();
		boolean success=admin.ifBranchCodeInListUpdateStatus(branchcode, "false");
		String username="";
		if(success)
		{
			username=admin.setAdminAccount(password, branchcode, name, email);
		}
		
		org.bean.SendEmail emailToCustomer=new org.bean.SendEmail();
		
		String to=email;
		String sub="MANAGER ACCOUNT LOGIN DETAILS";
		String msg="Dear "+name+",\n"
				+"Your Login Details is As Follows:\n"
				+"Username OR Login ID : "+username+"\n"
				+"Password : "+password;
		emailToCustomer.sendEmail(to, sub, msg);
				
		RequestDispatcher rd=request.getRequestDispatcher("AddBranchManagerSuccessful.jsp");
		rd.forward(request, response);
	}

}
