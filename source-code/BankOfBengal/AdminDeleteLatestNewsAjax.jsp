<%@page import="org.dao.NewsDAO"%>
<%@ page language="java" contentType="application/x-www-form-urlencoded; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
org.dao.NewsDAO news=new org.dao.NewsDAO();

String qString=request.getParameter("w");
String Q="";
String serial=qString;
int serial_int=Integer.parseInt(serial);

boolean success=news.deleteNews(serial_int);
if(success==true)
{
	Q="true";
}
else
{
	Q="false";
}
%>
<%=Q %>