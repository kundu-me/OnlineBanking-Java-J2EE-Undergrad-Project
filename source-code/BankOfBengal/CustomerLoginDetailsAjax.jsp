<%@ page language="java" contentType="application/x-www-form-urlencoded; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import="java.util.*" %>
<%
String qString=request.getParameter("w");
String Q="";
String username=(String)session.getAttribute("usernameSession");

org.dao.CustomerLoginDAO loginDAO=new org.dao.CustomerLoginDAO();
ArrayList<org.bean.CustomerLogin> list=null;
list=loginDAO.getLoginDetails(username);
if(list!=null)
{
	for(org.bean.CustomerLogin obj:list)
	{
		String time=obj.getLogintimestamp();
		String ipaddress=obj.getIpaddress();
		Q+=time+"|"+ipaddress+"=";
	}
}
else
{
	Q="x";
}


%>
<%=Q %>