<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change Password||Bank Of Bengal</title>
  <link rel="stylesheet" href="css/ChangePasswordStyle.css">
</head>
<body>
<script type="text/javascript">

function strength(x)
{
  var level = 0;
  var p1 = /[a-z]/;
  var p2 = /[A-Z]/;
  var p3 = /[0-9]/;
  var p4 = /[\!\@\#\$\%\^\&\*\(\)\-\_\=\+\[\{\]\}\|\\\;\:\'\"\,\<\.\>\/\?\`\~]/;
 
  if(x.length>=6)
    level++;
  if(p1.test(x))
    level++;
  if(p2.test(x))
    level++;
  if(p3.test(x))
    level++;
  if(p4.test(x))
    level++;
  document.getElementById("PassLevel").value=level;
  prog_bar(level,0,5,150,5,"#0066FF","#99FFFF");
}

function prog_bar(cur_val,min_val,max_val,width,height,border,fill)
{
var str = "",res = 0;
if(cur_val>=min_val && cur_val<=max_val)
{
  if(min_val<max_val)
  {
    res = ((cur_val-min_val)/(max_val-min_val))*100;
 res = Math.floor(res);
  }
  else
  {
    res = 0;
  }
}
else
{
  res = 0;
}
if(res<=40)
  fill = "#FF0000";
else if(res<=80)
  fill = "#FFFF00";
else
  fill = "#00FF00";
str = str + "<div style=\"border:"+border+" solid thin; width:"+width+"px; height:"+height+"px;\">";
str = str + "<div style=\"background-color:"+fill+"; width:"+res+"%; height:"+height+"px;\">";
str = str + "</div></div>";
if(res<=40)
  str = str + "Weak";
else if(res<=60)
  str = str + "Good";
else if(res<=80)
  str = str + "Strong";
else
  str = str + "Excellent";
document.getElementById("prog_bar").innerHTML = str;
passwordMatched();
}
 
function passwordMatched()
{
	var newPassword=document.getElementById("newPassword").value;
	var confirmPassword=document.getElementById("confirmPassword").value;
	var passwordMatched=document.getElementById("passwordMatched");
	
	if(newPassword!=confirmPassword)
	{
		passwordMatched.innerHTML="Not Matched";
	}
	else
	{
		passwordMatched.innerHTML="Matched";
	}
}
function formValidation()
{
	var newPassword=document.getElementById("newPassword").value;
	var confirmPassword=document.getElementById("confirmPassword").value;
	var CHAR_LIST="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@#$%^&*";
	
	if(newPassword==null|| newPassword=="")
	{
		alert("New Password Cannot be Blank !");
		document.getElementById("newPassword").focus();
		return false;
	}
	if(newPassword.length>0)
	{
		var n=newPassword.length;
		var r=newPassword.split("");
		for(var i=0;i<n;i++)
		{
			
			if(CHAR_LIST.indexOf(r[i])==-1)
			{
				document.getElementById("newPassword").value="";
				document.getElementById("confirmPassword").value="";
				strength("");
				document.getElementById("passwordMatched").innerHTML="";
				alert("Password Cannot Contain Any Other Characters Than Specified !");
				document.getElementById("newPassword").focus();
				return false;
			}
		}
		
	}
	
	if(confirmPassword==null|| confirmPassword=="")
	{
		alert("Confirm Password Cannot be Blank !");
		document.getElementById("confirmPassword").focus();
		return false;
	}
	if(newPassword!=confirmPassword)
	{
		alert("Password Mismatch !");
		document.getElementById("confirmPassword").focus();
		return false;
	}	
	
	if(document.getElementById("PassLevel").value!="5")
	{
		alert("Enter A strong Password");
		document.getElementById("newPassword").focus();
		return false;
	}
	
}
</script>

  <section class="container">
    <div class="login">
      <h1>Change Password</h1>
      <form method="post" action="AdminChangeDefaultPasswordServlet">
      <table>
      <tr>
      <td width="150">
      <p><h4>Username</h4></p>
      </td>
      <td colspan="2">
      <input type="text" name="username" id="username" value="<%=(String)session.getAttribute("AdminUsernameSession") %>" placeholder="Username" readonly="readonly">
      </td>
      </tr>
      <tr>
      <td>
      <p><h4>New Password*</h4></p>
      </td>
      <td>
      <input type="password" name="newPassword" id="newPassword" onkeyup="strength(this.value)" placeholder="Must contain Atleast 6 characters"  title="Must Contain A Capital Letter, A Small Letter, A Special Character !@#$%^&*">
      </td>
      <td width="150">
      <div id="prog_bar"></div>
      <input type="hidden" name="PassLevel" id="PassLevel">
      </td>
      </tr>
      <tr>
      <td width="150">
      <p><h4>Confirm Password*</h4></p>
      </td>
      <td>
      <input type="password" name="confirmPassword" id="confirmPassword" value="" placeholder="Confirm Password" onkeyup="passwordMatched()">
      </td>
      <td>
      <label id="passwordMatched" style="color:red; font-size: 15px;font-family: Times New Roman;"></label>
      </td>
      
      </tr>
      </table>
      <label style="color:red;">*Password Must Contain A Capital Letter, A Small Letter, A Special Character !@#$%^&*</label>
      <p class="submit"><input type="submit" onclick="return formValidation()" name="commit" value="Submit"></p>
      </form>
    </div>
  </section>

 </body>
</html>
