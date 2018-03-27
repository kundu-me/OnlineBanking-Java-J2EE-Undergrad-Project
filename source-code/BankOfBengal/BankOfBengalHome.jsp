<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bank Of Bengal</title>
<meta name="keywords" content="bank of bengal" />
<meta name="description" content="online banking" />
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />
<!--  Designed by NIRMALLYA KUNDU  -->

<script type="text/javascript">
<%
org.dao.NewsDAO newsDAO= new org.dao.NewsDAO();
String str1= newsDAO.getNewsLatest3();
String str2=newsDAO.getNewsLatest();
String str[]=str1.split("=");
String news[]=str2.split("=");
int count=news.length;
String part1="";
String part2="";
for(int i=0;i<count/2;i++)
{
	part1+=news[i]+"\n";
}
for(int i=count/2;i<count;i++)
{
	part2+=news[i]+"\n";
}
%>

function onloadFunctions()
{
	document.getElementById("news1h").value=<%=str[0]%>;
	document.getElementById("news1p").value=<%=str[1]%>;
	
	document.getElementById("news2h").value=<%=str[2]%>;
	document.getElementById("news2p").value=<%=str[3]%>;
	
	document.getElementById("news3h").value=<%=str[4]%>;
	document.getElementById("news3p").value=<%=str[5]%>;
}


</script>
</head>
<body style='background-image:url("BOBimg/homepage.jpg");background-attachment:fixed;background-position:center;'>
 
<div id="templatemo_container">
	
    <div id="templatemo_topbar">
    	<div id="languagebox">
        	<a href="#"><img src="images/indiaflag.jpg" alt="English" /></a>
        </div>
    </div>
    
    <div id="templatemo_header">
    	<div id="templatemo_logo">
        	<img src="images/logo.gif" alt="Logo" />
            <div id="templatemo_sitetitle">
            <font style="font-family: Times New Roman; color:blue"> Bank Of Bengal</font>
            </div>
      </div>
        
     </div>
     
    <div id="templatemo_menu">
		 	<ul>
			<li><a href="CustomerHome.jsp"  class="current">Home</a></li>
			<li><a href="#">Services</a>
            <ul>
            	<li>
            	<a href="http://www.google.com" target="f1">Bank Services</a>
            	</li>
            </ul>
            </li>
            <li><a href="#">Complain</a>
            <ul>
            	<li>
            	<a id="reg1" href="ComplainRegister.jsp" target="_blank" >Register A Complain</a>
            	</li>
            </ul>
            </li>  
            
            <li><a href="#">Online Application</a>
            <ul>
            	<li>
            	<a href="OnlineAccOpenFormPart1.jsp" target="_blank">SB Account Open Form</a>
            	
            	</li>
            </ul>
            </li>
            <li><a href="#">Status</a>
            <ul>
            	<li>
            	<a id="statusW" href="ApplicationStatus.jsp" target="_blank">SB Application Status</a>
            	</li>
            </ul>
            </li>
              
            <li><a href="CustomerContacts.jsp" class="lastmenu">Contacts</a></li> 
	               
        </ul>  
    
    </div>

    <div id="templatemo_banner">
    	<h1 style="color: blue; font-family: Times New Roman;"> The Bank To Every Indian</h1>
      <p>Bank Of Bengal is a new bank to every Indian established in the year 2014 with an aim to serve every Indian with the best Banking Services. </p>
      <div class="more_button"></div>
    </div>
    
    <div id="templatemo_services">
    	<div class="service_box">
        <center><img src="images/people.png" />
        <h2>Personal Banking</h2>
        <p> Personal Banking portal provides services with complete control over all banking demands online.</p>
        <div class="more_button"><a href="CustomerLogin.jsp">Login</a></div></center>
        </div>
        
        <div class="service_box">
        <center><img src="images/vault128.png" />
        <h2>Banking Administrator</h2>
        <p>Banking Administration application is only for the Administrative Purposes by the Administrators.</p>
        <div class="more_button"><a href="AdminLogin.jsp">Login</a></div></center>
        </div>
        
        <div class="service_box">
        <center><img src="images/world128.png"/>
        <h2>Banking Queries</h2>
        <p>Banking Queries application provides features to Customer to ask any Query. </p>
        <div class="more_button"><a href="ComplainRegister.jsp" target="_blank">Ask Query</a></div></center>
        </div>
        
        
    </div>
  <div id="templatemo_newssection">
  	<h1 style="font-family: Times New Roman; color: blue;">Latest News</h1>
    <div class="newsbox">
    <%
    str[1]=str[1].length()>100?str[1].substring(0,99):str[1];
    str[3]=str[3].length()>100?str[3].substring(0,99):str[3];
    str[5]=str[5].length()>100?str[5].substring(0,99):str[5];
    %>
    <h4 id="news1h"><%=str[0] %></h4>
    <p id="news1p"><%=str[1] %> <a href="#">more...</a> </p>
    </div>
    
    <div class="newsbox">
    <h4 id="news2h"><%=str[2] %></h4> 
    <p id="news2p"><%=str[3]%> <a href="#">more...</a> </p>
    </div>
    
    <div class="newsbox">
    <h4 id="news3h"><%=str[4] %></h4> 
    <p id="news3p"><%=str[5] %> <a href="#">more...</a> </p>
    </div>
    
    <div class="more_button"><a href="CustomerViewNews.jsp" target="_blank">Read All News</a></div>
  </div>
   
   <div id="templatemo_light_blue_row">
    	<div class="templatemo_gallery">
    	<marquee behavior="scroll" direction="up" scrollamount="3" onmouseover="this.stop();" onmouseout="this.start();">
    	<%
    	int j=0;
    	for(int i=0;i<count/2;)
    	{
    		
    	%>
    	<h3 style="font-family: Times New Roman; color: blue; text-decoration: underline;"><%=news[i++] %></h3>
    	<h4 style="font-family: Times New Roman; color: black;"><%=news[i++] %></h4>
    	<%
    	j=i;
    	} 
    	%>
    	</marquee>
    	</div>
	      
		<div class="templatemo_partners">
		<marquee behavior="scroll" direction="up" scrollamount="3" onmouseover="this.stop();" onmouseout="this.start();">
		<%
    	for(int i=j;i<count;)
    	{
    	%>
    	<h3 style="font-family: Times New Roman; color: blue; text-decoration: underline;"><%=news[i++] %></h3>
    	<h4 style="font-family: Times New Roman; color: black;"><%=news[i++] %></h4>
    	<%} %>
    	</marquee>
		</div>
    </div>
   
   <!--  Designed by Nirmallya Kundu  --> 
	<div id="templatemo_footer">
        Copyright © 2000 <a href="BankOfBengalHome.jsp"><strong>Bank Of Bengal</strong></a>
	</div>
</div>
</html>
</body>
</html>