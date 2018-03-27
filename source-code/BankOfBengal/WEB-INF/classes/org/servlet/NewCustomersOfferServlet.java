package org.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class NewCustomersOfferServlet
 */
public class NewCustomersOfferServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewCustomersOfferServlet() {
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
		String sub=request.getParameter("sub");
		String body=request.getParameter("body");
		
		org.dao.CustomerAccountDAO acc=new org.dao.CustomerAccountDAO();
		String email=acc.getAllEmail(branchcode);
		
		org.bean.SendEmail send=new org.bean.SendEmail();
		send.sendEmailToAll(email, sub, body);
		
		RequestDispatcher rd=request.getRequestDispatcher("EmailSent.jsp");
		rd.forward(request, response);
		
		
	}

}
