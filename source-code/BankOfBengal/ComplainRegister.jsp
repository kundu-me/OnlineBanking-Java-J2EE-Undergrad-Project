<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Complain Register||Bank Of Bengal</title>
  <link rel="stylesheet" href="css/ComplainStyle.css">
</head>
<body>
<script type="text/javascript">

</script>
  <section class="container">
    <div class="login">
      <h1>Register Your Complain</h1>
      <form method="post" action="ComplainEntryServlet" name="account">
      <table>
      	<tr>
      		<td width="150" colspan="2">
      		<p><h4><input type="email" name="email" placeholder="Enter Your Email Address"></h4></p>
      		</td>
      </tr>
	<tr>
      		<td width="150" colspan="2">
      		<p><h4><input type="text" name="subject" id="subject" placeholder="Subject Of Complain"></h4></p>
      		</td>
      </tr>
      <tr>
      		<td width="150" colspan="2">
      		<p><h6><textarea rows="20" cols="50" name="complain" id="complain" placeholder="Give Brief Descrpription Of Your Complain ..."></textarea></h6></p>
      		</td>
      </tr>
      <tr>
      <td colspan="2">
      <label id="msg" style="color: red; font-family: Times New Roman; font-size: 15px"></label>
      </td>
      </tr>
      </table>
       <p class="submit"><input type="submit" name="commit" value="Register Complain"></p>
      </form>
    </div>
  </section>
 </body>
</html>
