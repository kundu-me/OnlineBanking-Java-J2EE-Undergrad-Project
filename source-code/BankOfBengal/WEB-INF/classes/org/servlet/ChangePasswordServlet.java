package org.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dao.CustomerAccountDAO;

/**
 * Servlet implementation class ChangePasswordServlet
 */
public class ChangePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePasswordServlet() {
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
		String OldPassword=request.getParameter("OldPassword");
		String NewPassword=request.getParameter("password1");
		String msg="";
		CustomerAccountDAO acc=new CustomerAccountDAO();
		boolean valid=acc.isAccountValid(accountno, OldPassword);
		
		if(valid)
		{
			acc.updateAccountPassword(accountno,OldPassword,NewPassword);
			msg="Password Changed Successfully";
		}
		else
		{
			msg="Password Did Not Match !!!";
		}
	}

}
