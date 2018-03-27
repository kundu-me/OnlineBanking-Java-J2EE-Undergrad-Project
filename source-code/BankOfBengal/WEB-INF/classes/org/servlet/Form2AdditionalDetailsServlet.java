package org.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dao.Form2AdditionalDetailsDAO;
import org.dao.Form60DAO;

/**
 * Servlet implementation class Form2AdditionalDetailsServlet
 */
public class Form2AdditionalDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Form2AdditionalDetailsServlet() {
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
		/* */
		String applicationno_string=request.getParameter("applicationno");
		int applicationno=Integer.parseInt(applicationno_string);
		String cid=request.getParameter("cid");
		
		String religion=request.getParameter("religion");
		String category=request.getParameter("category");
		String education=request.getParameter("education");
		String occupation=request.getParameter("occupation");
		String organization=request.getParameter("organization");
		String designation=request.getParameter("designation");
		String income=request.getParameter("income");
		String term=request.getParameter("term");
		
		String assetvalue_string=request.getParameter("assetvalue");
		double assetvalue=Double.parseDouble(assetvalue_string);
		
		String vehicle=request.getParameter("vehicle");
		
		String lifeinsurancevalue_string=request.getParameter("lifeinsurancevalue"); 
		double lifeinsurancevalue=Double.parseDouble(lifeinsurancevalue_string);
		
		String lifeinsurance=request.getParameter("lifeinsurance");
		String loan=request.getParameter("loan");
		
		String house=request.getParameter("house");
		
		String mutualfund=request.getParameter("mutualfund");
		
		String creditcard=request.getParameter("creditcard");
				
		String it=request.getParameter("it");
		String itno=request.getParameter("itno");
		
		Form2AdditionalDetailsDAO form2AdditionalDetailsDAO=new Form2AdditionalDetailsDAO();
		Form60DAO form60DAO=new Form60DAO();
		boolean isFormAdditionalDetails=false;
		int isForm60=-1;
		boolean success=false;
		if(it.equalsIgnoreCase("pan"))
		{
			isFormAdditionalDetails=form2AdditionalDetailsDAO.setForm2AdditionalDetails(applicationno, cid, religion, 
									category, education, occupation, organization, designation, income, term, assetvalue, 
									vehicle, lifeinsurancevalue, lifeinsurance, loan, house, mutualfund, creditcard, 
									it, itno, status);
			isForm60=1;
		}
		else
		{
			String fullname=request.getParameter("fullname");
			String address=request.getParameter("address");
			String openingof=request.getParameter("openingof");
			String issueof=request.getParameter("issueof");
			
			String tamount_string=request.getParameter("tamount");
			double tamount=Double.parseDouble(tamount_string);
			
			String tax=request.getParameter("tax");
			String document=request.getParameter("document");
			
			isForm60=form60DAO.setForm60(cid, fullname, address, openingof, issueof, tamount, tax, document, status);
			itno=""+isForm60;
			isFormAdditionalDetails=form2AdditionalDetailsDAO.setForm2AdditionalDetails(applicationno, cid, religion, 
					category, education, occupation, organization, designation, income, term, assetvalue, 
					vehicle, lifeinsurancevalue, lifeinsurance, loan, house, mutualfund, creditcard, 
					it, itno, status);
		}
		
		if(isFormAdditionalDetails==true && isForm60>0)
		{
			success=true;
		}
		
		if(success)
		{
			RequestDispatcher rd=request.getRequestDispatcher("OnlineAccOpenFormPart3.jsp");
			rd.forward(request, response);
		}
		else
		{
			
		}
	}
}
