package org.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ComplainReplyServlet
 */
public class ComplainReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ComplainReplyServlet() {
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
		
		String serial=request.getParameter("serial");
		String to=request.getParameter("email");
		String sub=request.getParameter("subject");
		String message=request.getParameter("solution");
		
		org.dao.ComplainBoxDAO cb=new org.dao.ComplainBoxDAO();
		boolean success=cb.updateReply(serial,message);
		
		org.bean.SendEmail email=new org.bean.SendEmail();
		email.sendEmail(to, sub, message);
		
		RequestDispatcher rd=request.getRequestDispatcher("EmailSent.jsp");
		rd.forward(request, response);
						
	}

}
