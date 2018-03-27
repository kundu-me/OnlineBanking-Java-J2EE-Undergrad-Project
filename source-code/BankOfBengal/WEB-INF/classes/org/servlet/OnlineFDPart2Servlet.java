package org.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class OnlineFDPart2Servlet
 */
public class OnlineFDPart2Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OnlineFDPart2Servlet() {
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
		String accountno=request.getParameter("accountno");
		String branchcode=request.getParameter("branchcode");
		String name=request.getParameter("name");
		String ctype=request.getParameter("ctype");
		String cage=request.getParameter("cage");
		String dob=request.getParameter("dob");
		String nationality=request.getParameter("nationality");
		String uidlabel=request.getParameter("uidlabel");
		String uidno=request.getParameter("uidno");
		String caddress=request.getParameter("caddress");
		String paddress=request.getParameter("paddress");
		String mobile=request.getParameter("mobile");
		String landline=request.getParameter("landline");
		String email=request.getParameter("email");
		String it=request.getParameter("it");
		String itno=request.getParameter("itno");
		
		org.dao.FixedDepositDetailsDAO fd=new org.dao.FixedDepositDetailsDAO();
		String fid=fd.setTransactionDetails(accountno, branchcode, ctype, cage, name, dob,
				nationality, uidlabel, uidno, caddress, paddress, mobile, landline, email, it, itno);
		session.setAttribute("fidSession", fid);
		session.setAttribute("FDemailSession", email);
		RequestDispatcher rd=request.getRequestDispatcher("OnlineFDPart3.jsp");
		rd.forward(request, response);
	}

}
