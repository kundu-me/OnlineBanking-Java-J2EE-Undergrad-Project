<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bank Account Statement||Bank Of Bengal</title>
  <link rel="stylesheet" href="css/CustomerTransferMoneyStyle.css">
</head>
<body>
<script type="text/javascript">
function getBranch()
{
	var branchWindow=window.open("BranchChooserWindow.jsp","getBranchWindow","width=700,height=500");
	//var branchcode=branchWindow.document.forms["branchchooser"]["branchcode"].value;
	//branchWindow.opener.document.forms["form1"]["branchcode"].value=branchcode;
}
</script>

  <section class="container">
    <div class="login">
      <h1>Select Branch And Period For Bank Account Statement</h1>
      <form method="post" action="BankTSBranchSelectServlet" name="form1">
      <table>
      <tr>
      		<td>
      		<p><h4>Branch Code</h4></p>
      		</td>
      		<td>
      		<input type="text" name="branchcode" id="branchcode" > <button type="button" id="getbranch" onclick="getBranch()">Click Here To Choose</button> 
      		</td>
      </tr>
       <tr>
      		<td>
      		<p><h4>Branch Name</h4></p>
      		</td>
      		<td>
      		<input type="text" name="branchname" id="branchname" ><input type="hidden" name="branchaddress" id="branchaddress" >  
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
