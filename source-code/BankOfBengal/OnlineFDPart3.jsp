<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Fixed Deposit||Bank Of Bengal</title>
  <link rel="stylesheet" href="css/CustomerTransferMoneyStyle.css">
</head>
<body>
<script type="text/javascript">
function validation()
{
	var amount=document.getElementById("amount").value;
	var amt=isNaN(amount);
	if(amt==true)
	{
		alert("Enter Only Digits!!!");
		document.getElementById("amount").value="0";
		return false;
	}
	
	var term=document.getElementById("termN").value;
	var t=isNaN(term);
	if(t==true)
	{
		alert("Enter Only Digits!!!");
		document.getElementById("termN").value="7";
		return false;
	}
}

</script>

  <section class="container">
    <div class="login">
      <h1>Money Transfer</h1>
      <form method="post" action="OnlineFDPart3Servlet">
      <table>
      <tr>
      		<td>
      		<p><h4>Fixed Deposit Amount</h4></p>
      		</td>
      		<td>
      		<h4>
      		<input type="text" name="amount" id="amount" value="" placeholder="0.00" required>INR.
      		</h4>
      		</td>
      </tr>
      <tr>
      		<td>
      		<p><h4>Fixed Deposit Period</h4></p>
      		</td>
      		<td>
      		<h4>
      		<input type="text" name="termN" id="termN" value="" placeholder="No. Of Days/Months/Years" required>&nbsp;&nbsp;
      		<select name="termL" id="termL">
      		<option value="Days">Days</option>
      		<option value="Months">Months</option>
      		<option value="Years">Years</option>
      		</select>
      		</h4>
      		</td>
      </tr>
      <tr>
      <td colspan="2">
      <label id="msg" style="color: red; font-family: Times New Roman; font-size: 15px"></label>
      </td>
      </tr>
      </table>
       <p class="submit"><input type="submit" onclick="return validation()" name="commit" value="Transfer"></p>
      </form>
    </div>
  </section>
 </body>
</html>
