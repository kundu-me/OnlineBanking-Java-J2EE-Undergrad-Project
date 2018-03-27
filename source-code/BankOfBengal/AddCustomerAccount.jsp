<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Login||Bank Of Bengal</title>
  <link rel="stylesheet" href="css/CustomerStyle.css">
</head>
<body>
<script type="text/javascript">
function formValidation()
{
	
	var accountno=document.getElementById("accountno").value;
	var username=document.getElementById("username").value;
	var password=document.getElementById("password").value;
	if(accountno==null|| accountno=="")
	{
		alert("Account No. Cannot be Blank !");
		document.getElementById("accountno").focus();
		return false;
	}
	if(password==null|| password=="")
	{
		alert("Password Cannot be Blank !");
		document.getElementById("password").focus();
		return false;
	}
	if(username==null|| username=="")
	{
		alert("Login ID Cannot be Blank !");
		document.getElementById("username").focus();
		return false;
	}
	if(password==null|| password=="")
	{
		alert("Password Cannot be Blank !");
		document.getElementById("password").focus();
		return false;
	}
}
</script>

  <section class="container">
    <div class="login">
      <h1>Add Another Account</h1>
      <form method="post" action="AddCustomerAccountServlet">
      <input type="text" name="user" value=<%=(String)session.getAttribute("usernameSession") %>>
		<p><h3>Account No To Add:</h3><input type="text" name="accountno" id="accountno" placeholder="Account No."></p>
		      
        <p><h3>Login ID Of The Account:</h3><input type="text" name="username" id="username" placeholder="Username"></p>

       <p><h3>Password Of The Account:</h3><input type="password" name="password" id="password" placeholder="Password"></p>
       
        <p class="submit"><input type="submit" onclick="return formValidation()" name="commit" value="Add"></p>
      </form>
    </div>
  </section>

 </body>
</html>
