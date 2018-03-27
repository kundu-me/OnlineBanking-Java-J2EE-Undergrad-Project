<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Admin Panel||Bank Of Bengal</title>
  <link rel="stylesheet" href="css/LoginStyle.css">
</head>
<body>
<script type="text/javascript">
function formValidation()
{
	var loginid=document.getElementById("username").value;
	var password=document.getElementById("password").value;
	if(loginid==null|| loginid=="")
	{
		alert("Login ID Cannot be Blank !");
		document.getElementById("loginid").focus();
		return false;
	}
	if(password==null|| password=="")
	{
		alert("Password Cannot be Blank !");
		document.getElementById("password").focus();
		return false;
	}
	</script>
  <section class="container">
    <div class="login">
      <h1>Admin Panel Login</h1>
      <form method="post" action="AdminLoginServlet">
    
        <p><h3>Login ID :</h3><input type="text" name="username" id="username" value="" placeholder="Admin Login ID"></p>
	
		<p><h3>Password :</h3><input type="password" name="password" id="password" value="" placeholder="Admin Password"></p>
    
        <p class="submit"><input type="submit" name="commit" value="Login"></p>
      </form>
    </div>

    <div class="login-help">
      <p>Forgot your password? <a href="">Click here to reset it</a>.</p>
    </div>
  </section>

 </body>
</html>
