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
 * Servlet implementation class Form1PersonalDetailsServlet
 */
public class Form1PersonalDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Form1PersonalDetailsServlet() {
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
		String remarks="n/a";
		
		String applicationno_string="0";
		applicationno_string=request.getParameter("applicationno");
		int applicationno=Integer.parseInt(applicationno_string);
		
		String cid=request.getParameter("cid");
		String branchcode=request.getParameter("branchcode");
		String ctype=request.getParameter("ctype");
		String cage=request.getParameter("cage");
		String salutation=request.getParameter("salutation");
		String fname=request.getParameter("fname");
		String mname=request.getParameter("mname");
		String lname=request.getParameter("lname");
		String guardian=request.getParameter("guardian");
		String gsalutation=request.getParameter("gsalutation");
		String gname=request.getParameter("gname");
		
		String dd=request.getParameter("dd");
		String mm=request.getParameter("mm");
		String yyyy=request.getParameter("yyyy");
		String dob=yyyy+"-"+mm+"-"+dd;
		
		String gender=request.getParameter("gender");
		String nationality=request.getParameter("nationality");
		String maiden=request.getParameter("maiden");
		String marital=request.getParameter("marital");
		
		String uidno1=request.getParameter("uidno1");
		String uidno2=request.getParameter("uidno2");
		String uidno="";
		String uidlabel="";
		if(uidno1.length()>0)
		{
			uidno=uidno1;
			uidlabel="applicant";
		}
		else if(uidno2.length()>0)
		{
			uidno=uidno2;
			uidlabel="father/mother";
		}
		else if(uidno1.length()<0 && uidno2.length()<0)
		{
			uidno="n/a";
			uidlabel="n/a";
		}
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
		String dor=request.getParameter("dor");
		Form1PersonalDetailsDAO form1PersonalDetailsDAO=new Form1PersonalDetailsDAO();
		ApplicationStatusDAO applicationStatusDAO=new ApplicationStatusDAO();
		boolean success1=false,success2=false;
		status="true";
		success1=form1PersonalDetailsDAO.setForm1PersonalDetails(applicationno, cid, branchcode, ctype, cage, 
				salutation, fname, mname, lname, guardian, gsalutation, gname, dob, gender, nationality, maiden, marital,
				uidlabel, uidno, homeno, street, landmark, district, city, state, pincode, addsame, xhomeno, xstreet, 
				xlandmark, xdistrict, xcity, xstate, xpincode, mcode, mobile, lcode, landline, 
				eid, edomain, email, dor, status);
		
		status="verification pending";
		remarks="n/a";
		success2= applicationStatusDAO.setApplicationStatus(applicationno,cid,email,branchcode, status, remarks);
		
		if(success1==true && success2==true)
		{
			HttpSession session=request.getSession(true);
			session.setAttribute("aidSession",applicationno_string);
			session.setAttribute("cidSession",cid);
			session.setAttribute("nameSession",fname);
			session.setAttribute("emailSession",email);
			RequestDispatcher rd=request.getRequestDispatcher("OnlineAccOpenFormPart2.jsp");
			rd.forward(request, response);
		}
		else
		{
			response.sendRedirect("OnlineAccOpenPart1.jsp");
		}
	}

}
