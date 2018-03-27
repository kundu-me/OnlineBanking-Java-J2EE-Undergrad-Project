<%@ page language="java" contentType="application/x-www-form-urlencoded; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%  
	
	String addsame=request.getParameter("w");
	String homeno=request.getParameter("homeno");
	String street=request.getParameter("street");
	String landmark=request.getParameter("landmark");
	String district=request.getParameter("district");
	String state=request.getParameter("state");
	String city=request.getParameter("city");
	String pincode=request.getParameter("pincode");
	
	String permanentAddressString="";
	
	permanentAddressString=homeno+","+street+","+landmark+","+district+","+state+","+city+","+pincode;
%>
<%= permanentAddressString %>

    