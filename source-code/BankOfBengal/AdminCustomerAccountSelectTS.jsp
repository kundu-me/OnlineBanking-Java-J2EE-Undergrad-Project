<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Account Statement|Bank Of Bengal</title>
  <link rel="stylesheet" href="css/CustomerTransferMoneyStyle.css">
</head>
<body onload='xmlhttpPost("CustomerAccountSelectAjax.jsp")'>
<script type="text/javascript">

</script>
  <section class="container">
    <div class="login">
      <h1>Select Customer Account And Period For Transaction Statement</h1>
      <form method="post" action="AdminCustomerAccountSelectTSServlet" name="account">
      <table>
      	<tr>
      		<td width="150">
      		<p><h4>Account No.</h4></p>
      		</td>
      		<td>
      		<input type="text" name="accountno" id="accountno">
      		</td>
      </tr>
      <tr>
      		<td>
      		<p><h4>From</h4></p>
      		</td>
      		<td>
      		<input type="date" name="start_date" id="start_date" >
      		</td>
      </tr>
      <tr>
      		<td>
      		<p><h4>To</h4></p>
      		</td>
      		<td>
      		<input type="date" name="end_date" id="end_date" >
      		</td>
      </tr>
      <tr>
      <td colspan="2">
      <label id="msg" style="color: red; font-family: Times New Roman; font-size: 15px"></label>
      </td>
      </tr>
      </table>
       <p class="submit"><input type="submit" onclick="return formValidation()" name="commit" value="Show"></p>
      </form>
    </div>
  </section>
 </body>
</html>
