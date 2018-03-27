<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">


<title>Admin Home</title>
<link rel="stylesheet" href="css/SmallButtonStyleCSS.css">
<link href="css/AdminHometemplatemo_style.css" rel="stylesheet"
	type="text/css" />
<style TYPE="text/css">
<!--
A:link {
	text-decoration: none;
	color: #ffffff
}

a:visited {
	text-decoration: none;
	color: #fffff
}

a:active {
	text-decoration: none;
	color: #ffffff
}

a:hover {
	color: #FF0000
}
-->
</style>

</head>
<%
String checkSessionValue=(String)session.getAttribute("AdminUsernameSession");
if(checkSessionValue==null)
{
	response.sendRedirect("AdminLogin.jsp");
}
%>
<body bgcolor="#ff9900" onload="ref()">
	<script>
		function ref()
		{
			var x=document.getElementById("Rcheck").value;
			if(x!=null && x.length>1)
			{
				document.getElementById("Rcheck").value="";
			}
			else
			{
				window.location.reload(true);
			}
		}
		function getChangePasswordWindow() {
			var applicationStatusWindow = window.open(
					"AdminChangePassword.jsp", "getBranchWindow",
					"width=750,height=650");
		}
		function getStatus() {
			var applicationStatusWindow = window.open("ApplicationStatus.jsp",
					"getBranchWindow", "width=500,height=400");

		}
		function getNewsUpdateWindow() {
			var applicationStatusWindow = window.open(
					"AdminUpdateLatestNews.jsp", "getBranchWindow",
					"width=500,height=500");
		}
		function getSendEmailWindow() {
			var applicationStatusWindow = window.open("AdminSendEmail.jsp",
					"getBranchWindow", "width=650,height=650");
		}
		function getNewBranchWindow() {
			var applicationStatusWindow = window.open(
					"AddBranchDetailsWindow.jsp", "getBranchWindow",
					"width=500,height=600");
		}
		function getContactWindow() {
			var applicationStatusWindow = window.open(
					"AdminEditContactDetails.jsp", "getBranchWindow",
					"width=750,height=600");
		}
		function getNewBranchManagerWindow() {
			var applicationStatusWindow = window.open(
					"AddBranchManagerWindow.jsp", "getBranchWindow",
					"width=500,height=600");
		}
		function getBankConstraintsWindow() {
			var applicationStatusWindow = window.open(
					"UpdateBankConstraints.jsp", "getBranchWindow",
					"width=600,height=400");
		}
		function getOffersWindow() {
			var applicationStatusWindow = window.open("NewCustomersOffer.jsp",
					"getBranchWindow", "width=650,height=650");
		}
		function changeMousePointer(elementID) {
			document.getElementById(elementID).style.cursor = "pointer";
		}
	</script>

	<div id="templatemo_header" style="text-align: center;">
		<div id="templatemo_logo" style="text-align: center;">
			<img src="images/logo.gif" alt="Logo" />
			<div id="templatemo_sitetitle"
				style="font-family: Times New Roman; font-size: 30; color: #ffffff; text-align: center;">
				Bank Of Bengal
				<marquee
					style="font-family: Gregoria; font-size: 15px; color: white; text-decoration: bold;">
					Bank Of Bengal Welcomes You!</marquee>
			</div>
		</div>
	</div>
	<%
		org.dao.AdminAccountDAO admin = new org.dao.AdminAccountDAO();
		String username = (String) session.getAttribute("AdminUsernameSession");
		String name = admin.getName(username);
	%>
	<h3 style="color: white; font-family: Gregoria; text-align: right;">
		Welcome,
		<%=name%></h3>
		<input type="hidden" id="Rcheck" value=<%=name %>>
	<div>
		<marquee
			style="font-family: Gregoria; font-size: 20px; color: white; text-decoration: bold;">
			Welcome To The Administrator Portal Of Bank Of Bengal !</marquee>
	</div>
	<div align="center">
		<center>
			<table border="0" width="90%" cellspacing="0" cellpadding="0">
				<tr>
					<td width="25%" valign="top">
						<table border="1" width="100%" bgcolor="#FF0000" cellspacing="0"
							cellpadding="0" bordercolor="#000000">
							<tr>
								<td width="100%"><b><font color="#FFFFFF" face="Arial"
										size="2">&nbsp; Upcoming News & Promotions </font></b></td>
							</tr>
						</table>
						<p align="left">
							<img border="0" src="img/bullet.gif" width="10" height="12"><font
								face="Arial" size="2">&nbsp; <u><a
									class="smallbuttons" id="addNews"
									onclick="getNewsUpdateWindow()"
									onmouseover="changeMousePointer(this.id)">Update News</a><br>

									<img border="0" src="img/bullet.gif" width="10" height="12"></u>&nbsp;
								<u><a class="smallbuttons" href="AdminViewLatestNews.jsp"
									target="_blank">View All News</a><br> <img border="0"
									src="img/bullet.gif" width="10" height="12"></u>&nbsp; <u><a
									class="smallbuttons" href="AdminDeleteLatestNews.jsp"
									target="_blank">Delete News</a><br> </u> &nbsp;
							</font>
						<table border="1" width="100%" bgcolor="#FF0000" cellspacing="0"
							cellpadding="0" bordercolor="#000000">
							<tr>
								<td width="100%"><b><font color="#FFFFFF" face="Arial"
										size="2">&nbsp; SB Account Verification & Update </font></b></td>
							</tr>
						</table>
						<p align="left">
							<font face="Arial" size="2"><u> <img border="0"
									src="img/bullet.gif" width="10" height="12"></u>&nbsp; <u><a
									class="smallbuttons" href="AdminVerifyApplications.jsp"
									target="_blank">Verify Applications</a><br> <img
									border="0" src="img/bullet.gif" width="10" height="12"></u>&nbsp;
								<u><a class="smallbuttons" href="AdminEditFormPart1.jsp"
									target="_blank">Edit Application</a><br> <img border="0"
									src="img/bullet.gif" width="10" height="12"></u>&nbsp; <u><a
									class="smallbuttons" id="appstatus" onclick="getStatus()"
									onmouseover="changeMousePointer(this.id)">Application
										Status</a><br> <img border="0" src="img/bullet.gif"
									width="10" height="12"></u>&nbsp; <u><a
									class="smallbuttons" href="AdminEditContactDetails.jsp"
									target="_blank">Edit Contact Details</a><br> </u> &nbsp;</font>
						<table border="1" width="100%" bordercolor="#000000"
							cellspacing="0" cellpadding="0" bgcolor="#FF0000">
							<tr>
								<td width="100%"><b><font color="#FFFFFF" face="Arial"
										size="2">&nbsp; Complaints And Solution Box </font></b></td>
							</tr>
						</table>
						<p align="left">
							<font face="Arial" size="2"><u> <img border="0"
									src="img/bullet.gif" width="10" height="12"></u>&nbsp; <u><a
									class="smallbuttons" id="emailWindow"
									onclick="getSendEmailWindow()"
									onmouseover="changeMousePointer(this.id)">Compose Email</a><br>

									<img border="0" src="img/bullet.gif" width="10" height="12"></u>&nbsp;
								<u><a class="smallbuttons" id="offerWindow"
									onclick="getOffersWindow()"
									onmouseover="changeMousePointer(this.id)">BranchWise
										Notification</a><br> <img border="0" src="img/bullet.gif"
									width="10" height="12"></u>&nbsp; <u><a
									class="smallbuttons" href="ComplainReply.jsp" target="_blank">View
										& Reply Complain</a><br> </u></font>
						<p>&nbsp;</p>
						<p>&nbsp;</p>
						<p>&nbsp;</p>
						<p>&nbsp;
					</td>
					</center>
					<td width="50%" valign="top">
						<div align="center">
							<table border="0" bordercolor="#000000" width="95%" bgcolor="#ffffff" cellspacing="0"
								cellpadding="0">
								<tr>
									<td>
										<p align="left">
											<b><font face="Arial" color="#000000" size="2">&nbsp;
													Search The Web</font></b>
									</td>
								</tr>
							</table>
						</div>
						<center>
							<div align="center">
								<center>
									<table border="1" width="95%" bordercolor="#ffffff"
										cellspacing="0" cellpadding="0" bgcolor="#ff9900">
										<tr>
											<td width="100%">
												<form method="GET" action="http://www.google.com/?"
													TARGET="_blank">
													<center>
														<table cellpadding="0" cellspacing="0" border="0"
															bordercolor="#000000" bgcolor="#ff9900" width="75%">
															<tr>
																<td>&nbsp;
																	<table cellpadding="0" cellspacing="0" border="0"
																		bgcolor="#ff9900" width="100%">
																		<tr>
																			<td align="left"> </td>
																			<td><input name="query" size="25"
																				maxlength="800"> </td>
																			<td>
																				<p align="center">
																					<input type="submit" class="smallbuttons"
																						border="0" hspace="4" alt="Go!" name="submit"
																						id="submit"
																						onmouseover="changeMousePointer(this.id)">
																				</p>
																			</td>
																		</tr>
																		</center>
																		</center>
																		</center>
																		<tr>
																			<td align="left" colspan="3"><div align="center">
																					<p align="left">
																						<font face="Verdana, Arial" size="%%BOX_FONT_SIZE"
																							color="#000000"><input type="radio"
																							value="3861b1cd58561fe8" checked name="crid"><small>This
																								Site</small> <input type="radio" name="crid" value="web"><small>The
																								Web</small></font>
																				</div></td>
																		</tr>
																	</table>
																</td>
															</tr>
														</table>
												</form>


												<table border="0" width="100%" cellspacing="0"
													cellpadding="0" bgcolor="#ff9900">
													<tr>
														<td width="100%">
															<p align="left">
																<b><i><font face="Arial" size="1"
																		color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
																	</font><font face="Arial" color="#000000" size="3">&nbsp;
																			Administrator Details</font><font face="Times New Roman"
																		size="3" color="#000000"><br> </font><font
																		color="#000000" face="Arial" size="1">&nbsp;</font></i></b>
														</td>
													</tr>
												</table>
												<table border="0" width="100%" cellspacing="0"
													bgcolor="#ff9900" cellpadding="0">
													<tr>
														<td valign="top">
															<blockquote>
																<p>
																	<font face="Times New Roman" size="5" color="white"><u>
																			Name Of Administrator : <%=name%><br> User ID :
																			<%=username%><br> Branch : <%=admin.getBranchCode(username)%><br>
																			Email ID: <%=admin.getEmail(username)%>
																	</u></font>
																</p>
															</blockquote>
														</td>

													</tr>
												</table>
												<center>
													<center>
														<center>
															<center></center>
														</center>
													</center>
												</center>
											</td>
										</tr>
									</table>
							</div>
							<table border="0" width="100%" cellspacing="0" cellpadding="0">
								<tr>
									<td width="100%">&nbsp;</td>
								</tr>
							</table>
							<div align="center">
								<center>
									<table border="1" width="95%" bgcolor="#FF0000"
										bordercolor="#000000" cellspacing="0" cellpadding="0">
										<tr>
											<td width="100%"><b><font color="#FFFFFF"
													face="Arial" size="2">&nbsp; Administrator Functions
												</font></b></td>
										</tr>
									</table>
								</center>
							</div>
							<p align="center" style="margin-left: 10; margin-right: 10">
								<font face="Times New Roman" size="5" color="#ffffff"> <a
									class="smallbuttons" href="AdminLogout.jsp">Logout</a>
									&nbsp;&nbsp;&nbsp;&nbsp;
									<button type="button" class="smallbuttons" id="chpass"
										onclick="getChangePasswordWindow()"
										onmouseover="changeMousePointer(this.id)">Change
										Password</button> &nbsp;
								</font>
							<div align="center">
								<center>
									<table border="1" width="95%" bordercolor="#000000"
										cellspacing="0" cellpadding="0" bgcolor="#FF0000">
										<tr>
											<td width="100%"><b><font color="#FFFFFF"
													face="Arial" size="2">&nbsp; Administrator Portal
														Information </font></b></td>
										</tr>
									</table>
								</center>
							</div>
							<p align="justify" style="margin-left: 10; margin-right: 10">
								<font face="Arial" size="2"> This is the Administrator
									Portal Of Bank Of Bengal. It is the Aministrator Portal that
									provides facilities to Update, Verify, Modify each and every
									minute details of the Bank as well as the Customer. &nbsp;<br>&nbsp;
								</font>
					</td>
					<center>
						<td width="25%" valign="top">
							<table border="1" width="100%" bgcolor="#FF0000" cellspacing="0"
								cellpadding="0" bordercolor="#000000">
								<tr>
									<td width="100%"><b><font color="#FFFFFF" face="Arial"
											size="2">&nbsp; </font><font color="#000000"><font
												face="Arial" size="2"> </font></font><font face="Arial"
											color="#FFFFFF" size="2">Transaction Statement</font></b></td>
								</tr>
							</table>
							<p align="left">
								<font face="Arial" size="2"><u> <img border="0"
										src="img/bullet.gif" width="10" height="12"></u>&nbsp; <u><a
										class="smallbuttons"
										href="AdminTransactionStatementBranchSelect.jsp"
										target="_blank">All Transaction</a><br> <img border="0"
										src="img/bullet.gif" width="10" height="12"></u>&nbsp; <u><a
										class="smallbuttons"
										href="BankTransactionStatementBranchSelect.jsp"
										target="_blank">Bank Account</a><br> <img border="0"
										src="img/bullet.gif" width="10" height="12"></u>&nbsp; <u><a
										class="smallbuttons" href="AdminCustomerAccountSelectTS.jsp"
										target="_blank">Customer Account</a><br> </u>&nbsp;</font>
							<table border="1" width="100%" bgcolor="#FF0000" cellspacing="0"
								cellpadding="0" bordercolor="#000000">
								<tr>
									<td width="100%"><b><font color="#FFFFFF" face="Arial"
											size="2">&nbsp; Verify Account Activity </font></b></td>
								</tr>
							</table>
							<p align="left">
								<font face="Arial" size="2"><u> <img border="0"
										src="img/bullet.gif" width="10" height="12"></u>&nbsp; <u><a
										class="smallbuttons" href="AdminVerifyMoneyTransfer.jsp"
										target="_blank">Money Transfer</a><br> <img border="0"
										src="img/bullet.gif" width="10" height="12"></u>&nbsp; <u><a
										class="smallbuttons" href="AdminVerifyFD.jsp" target="_blank">e-FD
											Application</a><br> <img border="0" src="img/bullet.gif"
										width="10" height="12"></u>&nbsp; <u><a
										class="smallbuttons" href="AdminMatureFD.jsp" target="_blank">e-FD
											Maturity</a><br> <img border="0" src="img/bullet.gif"
										width="10" height="12"></u>&nbsp; <u><a
										class="smallbuttons" href="AdminVerifyAccountClose.jsp"
										target="_blank">Verify Account Closing</a><br> </u>&nbsp;</font>
							<table border="1" width="100%" bordercolor="#000000"
								cellspacing="0" cellpadding="0" bgcolor="#FF0000">
								<tr>
									<td width="100%"><b><font color="#ffffff" face="Arial"
											size="2">&nbsp; Update New Details Related To Bank </font></b></td>
								</tr>
							</table>
							<p>
								<font face="Arial" size="2"><u> <img border="0"
										src="img/bullet.gif" width="10" height="12"></u>&nbsp; <u><a
										class="smallbuttons" id="branchWindow"
										onclick="getNewBranchWindow()"
										onmouseover="changeMousePointer(this.id)">Add New Branch</a><br>

										<img border="0" src="img/bullet.gif" width="10" height="12"></u>&nbsp;
									<u><a class="smallbuttons" id="branchManagerWindow"
										onclick="getNewBranchManagerWindow()"
										onmouseover="changeMousePointer(this.id)">Assign Branch
											Manager</a><br> <img border="0" src="img/bullet.gif"
										width="10" height="12"></u>&nbsp; <u><a
										class="smallbuttons" id="UpdateBankConstraintsWindow"
										onclick="getBankConstraintsWindow()"
										onmouseover="changeMousePointer(this.id)">Update Bank
											Constraints</a><br> </u>&nbsp;</font>
							</p>
							<p>&nbsp;
						</td>
				</tr>
			</table>
		</center>
	</div>
	<hr color="#FF0000" size="3" width="90%">
	<p align="center">
		<font face="Arial" size="1" color="#000000"><strong><b>©
					Copyright 2000 All Rights Reserved Bank Of Bengal</b></strong></font>
	</p>


</body>
</html>