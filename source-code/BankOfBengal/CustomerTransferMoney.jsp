<%@page import="org.bean.ConstraintValues"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Transfer Money||Bank Of Bengal</title>
  <link rel="stylesheet" href="css/CustomerTransferMoneyStyle.css">
</head>
<body>
<%
double chrg=org.bean.ConstraintValues.MONEY_TRANSFER_SERVICE_CHARGE;
String charges=chrg+"";
%>
<script type="text/javascript">
function getAmount()
{
	var amount=document.getElementById("amount").value;
	var charges=document.getElementById("charges");
	var bankcharges=document.getElementById("bankcharges");
	var totalamount=document.getElementById("totalamount");
	var amt=isNaN(amount);
	if(amt==true)
	{
		alert("Enter Only Digits!!!");
		document.getElementById("amount").value="0";
		bankcharges.value="0";
		totalamount.value="0";
		
	}
	else
	{
		var cal=(amount*charges.value)/100;
		bankcharges.value=cal;
		var total=(cal+amount*1);
		totalamount.value=total;
	}
	
}
</script>

  <section class="container">
    <div class="login">
      <h1>Money Transfer</h1>
      <form method="post" action="CustomerTransferMoneyServlet">
      <input type="hidden" name="sender_accountno" id="sender_accountno" value=<%=(String)session.getAttribute("sender_accountnoSession") %>>
      <table>
      <tr>
      		<td>
      		<p><h4>To (Bank)</h4></p>
      		</td>
      		<td>
      		<select name="receiver_bank" id="receiver_bank">
      		<option value="Bank Of Bengal">Bank Of Bengal</option>
      		</select>
      		</td>
      </tr>
      <tr>
      		<td>
      		<p><h4>To (Account No.)</h4></p>
      		</td>
      		<td>
      		<input type="text" name="receiver_accountno" id="receiver_accountno" placeholder="Account No. Of Receiver">
      		</td>
      </tr>
      <tr>
      		<td>
      		<p><h4>Transfer Amount</h4></p>
      		</td>
      		<td>
      		<h4>
      		<input type="text" name="amount" id="amount" onkeyup="getAmount()" placeholder="0.00">INR.
      		</h4>
      		</td>
      </tr>
      <tr>
      		<td>
      		<p><h4>Service Charge @ <%=charges %></h4></p>
      		<input type="hidden" name="charges" id="charges" value=<%=charges %> placeholder="0.00" readonly="readonly">
      		</td>
      		<td>
      		<h4>
      		<input type="text" name="bankcharges" id="bankcharges" placeholder="0.00" readonly="readonly">INR.
      		</h4>
      		</td>
      </tr>
      <tr>
      		<td>
      		<p><h4>Total Amount</h4></p>
      		</td>
      		<td>
      		<h4>
      		<input type="text" name="totalamount" id="totalamount" placeholder="0.00" readonly="readonly">INR.
      		</h4>
      		</td>
      </tr>
      </table>
       <p class="submit"><input type="submit" onclick="return formValidation()" name="commit" value="Transfer"></p>
      </form>
    </div>
  </section>
 </body>
</html>
