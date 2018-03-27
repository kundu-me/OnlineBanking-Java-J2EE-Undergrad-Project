<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Forgot Password||Bank Of Bengal</title>
  <link rel="stylesheet" href="css/ChangePasswordStyle.css">
</head>
<body onload="getSecurityQuestion()">
<script type="text/javascript">
function getSecurityQuestion()
{
	var element=document.getElementById("securityQuestion");
	while (element.length>1)
	{
		element.remove(x.length-1);
	}
	
	var question=new Array();
	i=0;
	question[i++]="What was your childhood nickname?";
	question[i++]="What is your oldest cousin's first and last name?";
	question[i++]="What was the name of your elementary / primary school?";
	question[i++]="What is the name of your grandmother's dog?";
	question[i++]="What are the last 5 digits of your driver's license number?";
	question[i++]="Where were you New Year's 2000?";
	question[i++]="Where were you when you first heard about 9/11?";
	question[i++]="What is your youngest brother's birthday?";
		
	for(var i=0;i<question.length;i++)
	{
		element.options[element.options.length]=new Option(question[i],question[i]);
	}
}
 
function formValidation()
{
	var securityAnswer=document.getElementById("securityAnswer").value;
	var securityQuestion=document.getElementById("securityQuestion").value;
	var username=document.getElementById("username").value;
	if(username==null|| username=="")
	{
		alert("Username Cannot be Blank !");
		document.getElementById("username").focus();
		return false;
	}

	if(securityQuestion=="Select A Security Question")
	{
	alert("Select A Security Question !!!");
	document.getElementById("securityQuestion").focus();
	return false;
	}
	if(securityAnswer==null|| securityAnswer=="")
	{
		alert("Security Answer Cannot be Blank !");
		document.getElementById("securityAnswer").focus();
		return false;
	}
	
}

</script>

  <section class="container">
    <div class="login">
      <h1>Get Forgot Password In Registered Email</h1>
      <form method="post" action="ForgotPasswordServlet">
      <table>
      <tr>
      <td width="150">
      <p><h4>UserName*</h4></p>
      </td>
      <td colspan="2">
      <input type="text" name="username" id="username">
      </td>
      </tr>
	</table> 
	 <p>
        <select name="securityQuestion" id="securityQuestion">
        <option value="Select A Security Question">Select A Security Question</option>
        </select>
        <br>
        <input type="text" style="width: 433px;" name="securityAnswer" id="securityAnswer" placeholder="Security Answer">
     </p>
    <p class="submit"><input type="submit" onclick="return formValidation()" name="commit" value="Submit"></p>
      </form>
    </div>
  </section>

 </body>
</html>
