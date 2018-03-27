package org.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dao.NewsDAO;

/**
 * Servlet implementation class UpdateLatestNewsServlet
 */
public class UpdateLatestNewsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateLatestNewsServlet() {
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
		
		String status="true";
		
		String heading=request.getParameter("heading");
		String details=request.getParameter("details");
		
		NewsDAO newsDAO=new NewsDAO();
		boolean success=false;
		
		success=newsDAO.setNews(heading, details, status);
		
		if(success)
		{
			RequestDispatcher rd=request.getRequestDispatcher("AdminUpdateLatestNewsSuccessful.jsp");
			rd.forward(request, response);
		}
		else
		{
			response.sendRedirect("AdminUpdateLatestNews.jsp");
		}

	}
}

