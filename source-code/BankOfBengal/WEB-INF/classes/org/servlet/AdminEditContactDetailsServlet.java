package org.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.dao.ApplicationStatusDAO;
import org.dao.Form1PersonalDetailsDAO;

/**
 * Servlet implementation class AdminEditContactDetailsServlet
 */
public class AdminEditContactDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminEditContactDetailsServlet() {
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
		
		String cid=request.getParameter("cid");
		
		String salutation=request.getParameter("salutation");
		String fname=request.getParameter("fname");
		String mname=request.getParameter("mname");
		String lname=request.getParameter("lname");
		
		
		String homeno=request.getParameter("homeno");
		String street=request.getParameter("street");
		String landmark=request.getParameter("landmark");
		String district=request.getParameter("district");
		String city=request.getParameter("city");
		String state=request.getParameter("state");
		String pincode=request.getParameter("pincode");
		
		String addsame=request.getParameter("addsame");
		
		String xhomeno="";
		String xstreet="";
		String xlandmark="";
		String xdistrict="";
		String xcity="";
		String xstate="";
		String xpincode="";
		
		if(addsame.equalsIgnoreCase("yes"))
		{
			xhomeno=homeno;
			xstreet=street;
			xlandmark=landmark;
			xdistrict=district;
			xcity=city;
			xstate=state;
			xpincode=pincode;
			
		}
		else if(addsame.equalsIgnoreCase("no"))
		{
			xhomeno=request.getParameter("xhomeno");
			xstreet=request.getParameter("xstreet");
			xlandmark=request.getParameter("xlandmark");
			xdistrict=request.getParameter("xdistrict");
			xcity=request.getParameter("xcity");
			xstate=request.getParameter("xstate");
			xpincode=request.getParameter("xpincode");
			
		}
		
		String mcode=request.getParameter("mcode");
		String mobile=request.getParameter("mobile");
		String lcode=request.getParameter("lcode");
		String landline=request.getParameter("landline");
		String eid=request.getParameter("eid");
		String edomain=request.getParameter("edomain");
		String email=request.getParameter("email");
		
		Form1PersonalDetailsDAO f1=new Form1PersonalDetailsDAO();
		
		boolean success=false;
		success=f1.updateContactDetails(cid, salutation, fname, mname, lname, 
					homeno, street, landmark, district, city, state, pincode, addsame,
					xhomeno, xstreet, xlandmark, xdistrict, xcity, xstate, xpincode,
					mcode, mobile, lcode, landline, eid, edomain, email);
		if(success)
		{
			RequestDispatcher rd=request.getRequestDispatcher("AdminEditContactsSuccess.jsp");
			rd.forward(request, response);
		}
		else
		{
			response.sendRedirect("AdminEditContactDetails.jsp");
		}
	}

}
