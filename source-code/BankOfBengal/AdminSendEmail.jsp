<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Compose Email||Bank Of Bengal</title>
  <link rel="stylesheet" href="css/EmailStyle.css">
</head>
<body onload="getSignature()">
<script type="text/javascript">
function getSignature()
{
	var element=document.getElementById("signature");
	if(element.checked==true)
	{
		var element=document.getElementById("body");
		var name="Mr. Nirmallya Kundu";
		element.value="\n\n\n\n\n-Thanks & Regards\n "+name+"\n Administrator\n Bank Of Bengal";
	}
	else
	{
		var element=document.getElementById("body");
		element.value="";
		
	}
}
</script>
  <section class="container">
    <div class="login">
      <h1>Compose Email To Send</h1>
      <form method="post" action="AdminSendEmailServlet" name="account">
      <table>
      	<tr>
      		<td width="150" colspan="2">
      		<p><h4><input type="email" name="to" placeholder="To"></h4></p>
      		</td>
      </tr>
	<tr>
      		<td width="150" colspan="2">
      		<p><h4><input type="text" name="sub" id="sub" placeholder="Subject"></h4></p>
      		</td>
      </tr>
      <tr>
      		<td width="150" colspan="2">
      		<h6>Signature <input type="checkbox" checked="checked" name="signature" id="signature" onchange="getSignature()">
      		<br>
      		<textarea rows="20" cols="50" name="body" id="body" placeholder="Enter Your Message Here ..."></textarea></h6>
      		</td>
      </tr>
      <tr>
      <td colspan="2">
      <label id="msg" style="color: red; font-family: Times New Roman; font-size: 15px"></label>
      </td>
      </tr>
      </table>
       <p class="submit"><input type="submit" name="commit" value="Send"></p>
      </form>
    </div>
  </section>
 </body>
</html>
