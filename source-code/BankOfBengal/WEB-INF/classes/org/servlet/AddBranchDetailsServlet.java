package org.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dao.BranchDetailsDAO;

/**
 * Servlet implementation class AddBranchDetailsServlet
 */
public class AddBranchDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddBranchDetailsServlet() {
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
		String serial_string=request.getParameter("serial");
		int serial=Integer.parseInt(serial_string);
		String branchcode=request.getParameter("branchcode");
		String branchname=request.getParameter("branchname");
		String branchstate=request.getParameter("branchstate");
		String branchcity=request.getParameter("branchcity");
		String branchpincode=request.getParameter("branchpincode");
		String branchaddress=request.getParameter("branchaddress");
				
		BranchDetailsDAO branchDetailsDAO=new BranchDetailsDAO();
		boolean isBranchCode=branchDetailsDAO.isBranchCodeAvailable(branchcode);
		boolean isBranchName=branchDetailsDAO.isBranchNameAvailable(branchname);
		boolean success=false;
		if(isBranchCode ==false && isBranchName==false)
		{
			success=branchDetailsDAO.setBranchDetails(serial, branchcode, branchname, branchstate,
														branchcity, branchpincode, branchaddress, status);
			if(success)
			{
				RequestDispatcher rd=request.getRequestDispatcher("AddBranchDetailsSuccessful.jsp");
				rd.forward(request, response);
			}
			else
			{
				response.sendRedirect("AddBranchDetailsWindow.jsp");
			}
		}
		else
		{
			response.sendRedirect("AddBranchDetailsWindow.jsp");
		}
		
	}

}