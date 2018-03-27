package org.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CustomerAccountSelectTSServlet
 */
public class CustomerAccountSelectTSServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerAccountSelectTSServlet() {
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
			
			String ts_accountno=request.getParameter("ts_accountno");
			String password=request.getParameter("password");
			String start_date=request.getParameter("start_date");
			String end_date=request.getParameter("end_date");
			org.dao.CustomerAccountDAO custDAO=new org.dao.CustomerAccountDAO();
			
			boolean validAccount=custDAO.isAccountValid(ts_accountno, password);
			
			if(validAccount)
			{
				session.setAttribute("TSaccountnoSession",ts_accountno);
				session.setAttribute("TSstart_dateSession", start_date);
				session.setAttribute("TSend_dateSession", end_date);
				RequestDispatcher rd=request.getRequestDispatcher("CustomerTransactionStatement.jsp");
				rd.forward(request, response);
				
			}
			else
			{
				RequestDispatcher rd=request.getRequestDispatcher("CustomerPasswordMismatch.jsp");
				rd.forward(request, response);
			}
		}
		
	}

