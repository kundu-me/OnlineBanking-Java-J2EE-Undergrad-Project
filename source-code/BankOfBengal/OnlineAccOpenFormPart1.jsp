<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Online Account Open Form Part1</title>
 <link rel="stylesheet" href="css/CustomerInputStyle.css">
 <link rel="stylesheet" href="css/CustomerFormStyle.css">
 <script>

function getBranch()
{
	var branchWindow=window.open("BranchChooserWindow.jsp","getBranchWindow","width=700,height=500");
	//var branchcode=branchWindow.document.forms["branchchooser"]["branchcode"].value;
	//branchWindow.opener.document.forms["form1"]["branchcode"].value=branchcode;
}

function form1Validation()
{
	var errorElement=document.getElementById("errormsg");
	var errorMessage=" **Error : ";
	var a=document.forms["form1"]["branchcode"].value;
	var b=document.forms["form1"]["branchname"].value;
	var c=document.forms["form1"]["branchaddress"].value;
	if(a==null || a=="" || b==null || b=="" || c==null || c=="" )
		{
		alert("Choose a Correct Branch Code !");
		var text="Choose A Correct Branch Code From The Available Branches";
		var error=errorMessage+text;
		errorElement.innerHTML=error;
		errorElement.style.color="red";
		window.scrollTo(0,0);
		return false;
		}
	var d=document.forms["form1"]["fname"].value;
	if(d==null || d=="")
		{
		alert("First Name Cannot be Blank !");
		var text="Enter Your First Name";
		var error=errorMessage+text;
		errorElement.innerHTML=error;
		errorElement.style.color="red";
		document.getElementById("fname").focus();
		return false;
		}
	var e=document.forms["form1"]["lname"].value;
	if(e==null || e=="")
		{
		alert("Last Name Cannot be Blank !");
		var text="Enter Your Last Name";
		var error=errorMessage+text;
		errorElement.innerHTML=error;
		errorElement.style.color="red";
		document.getElementById("lname").focus();
		return false;	
		}

	var f=document.forms["form1"]["gname"].value;
	if(f==null || f=="")
		{
		alert("Guardian Name Cannot be Blank !");
		var text="Enter Your Guardian's Name";
		var error=errorMessage+text;
		errorElement.innerHTML=error;
		errorElement.style.color="red";
		document.getElementById("gname").focus();
		return false;
		}
	
	var g=document.getElementById("dd");
	var h=document.getElementById("mm");
	var i=document.getElementById("yyyy");;
	var dd1=g.options[g.selectedIndex].text;
	var mm1=h.options[h.selectedIndex].text;
	var yyyy1=i.options[i.selectedIndex].text;
	if(dd1=="DD" || mm1=="MM" || yyyy1=="YYYY")
		{
		if(dd1=="DD")
			{
			alert("Select Correct Date in Date Of Birth !");
			var text="Select Correct Date in Date Of Birth";
			var error=errorMessage+text;
			errorElement.innerHTML=error;
			errorElement.style.color="red";
			document.getElementById("dd").focus();
			return false;
			}
		if(mm1=="MM")
			{
			alert("Select Correct Month in Date Of Birth !");
			var text="Select Correct Month in Date Of Birth";
			var error=errorMessage+text;
			errorElement.innerHTML=error;
			errorElement.style.color="red";
			document.getElementById("mm").focus();
			return false;
			}
		if(yyyy1=="YYYY")
			{
			alert("Select Correct Year in Date Of Birth !");
			var text="Select Correct Year in Date Of Birth";
			var error=errorMessage+text;
			errorElement.innerHTML=error;
			errorElement.style.color="red";
			document.getElementById("yyyy").focus();
			return false;
			}
		}
	
	var j=document.forms["form1"]["maiden"].value;
	if(j==null || j=="")
		{
		alert("Mother's Maiden Name Cannot be Blank !");
		var text="Enter Your Mother's Maiden Name";
		var error=errorMessage+text;
		errorElement.innerHTML=error;
		errorElement.style.color="red";
		document.getElementById("maiden").focus();
		return false;
		}
		
	var k=document.getElementById("marital");
	var k1=k.options[k.selectedIndex].text;
	if(k1=="--Select--")
		{
		alert("Select Your Marital Status !");
		var text="Select Your Marital Status";
		var error=errorMessage+text;
		errorElement.innerHTML=error;
		errorElement.style.color="red";
		document.getElementById("marital").focus();
		return false;	
		}
	
	var l=document.forms["form1"]["street"].value;
	if(l==null || l=="")
		{
		alert("Correspondence Address: Street Address Cannot be Blank !");
		var text="Enter Your Street Address of Correspondence Address (Current Residential/Office)";
		var error=errorMessage+text;
		errorElement.innerHTML=error;
		errorElement.style.color="red";
		document.getElementById("street").focus();
		return false;
		}
	
	var m=document.forms["form1"]["district"].value;
	if(m==null || m=="")
		{
		alert("Correspondence Address: District Name Cannot be Blank !");
		var text="Enter Your District of Correspondence Address (Current Residential/Office)";
		var error=errorMessage+text;
		errorElement.innerHTML=error;
		errorElement.style.color="red";
		document.getElementById("district").focus();
		return false;
		}
	
	var n=document.getElementById("state");
	var o=document.getElementById("city");
	var n1=n.options[n.selectedIndex].text;
	var o1=o.options[o.selectedIndex].text;
	if(n1=="--Select--")
		{
		alert("Correspondence Address: Select Your State !");
		var text="Select Your State of Correspondence Address (Current Residential/Office)";
		var error=errorMessage+text;
		errorElement.innerHTML=error;
		errorElement.style.color="red";
		document.getElementById("state").focus();
		return false;
		}
	if(o1=="--Select--")
		{
		alert("Correspondence Address: Select Your City !");
		var text="Select Your City of Correspondence Address (Current Residential/Office)";
		var error=errorMessage+text;
		errorElement.innerHTML=error;
		errorElement.style.color="red";
		document.getElementById("city").focus();
		return false;
		}
	var p=document.forms["form1"]["pincode"].value;
	if(p==null || p=="")
		{
		alert("Correspondence Address: Pincode Cannot be Blank !");
		var text="Enter Your Pincode of Correspondence Address (Current Residential/Office)";
		var error=errorMessage+text;
		errorElement.innerHTML=error;
		errorElement.style.color="red";
		document.getElementById("pincode").focus();
		return false;
		}
	var xl=document.forms["form1"]["xstreet"].value;
	if(xl==null || xl=="")
		{
		alert("Permanent Address: Street Address Cannot be Blank !");
		var text="Enter Your Street Address of Permanent Address";
		var error=errorMessage+text;
		errorElement.innerHTML=error;
		errorElement.style.color="red";
		document.getElementById("xstreet").focus();
		return false;
		}
	
	var xm=document.forms["form1"]["xdistrict"].value;
	if(xm==null || xm=="")
		{
		alert("Permanent Address: District Name Cannot be Blank !");
		var text="Enter Your District of Permanent Address";
		var error=errorMessage+text;
		errorElement.innerHTML=error;
		errorElement.style.color="red";
		document.getElementById("xdistrict").focus();
		return false;
		}
	
	var xn=document.getElementById("xstate");
	var xo=document.getElementById("xcity");
	var xn1=xn.options[xn.selectedIndex].text;
	var xo1=xo.options[xo.selectedIndex].text;
	if(xn1=="--Select--")
		{
		alert("Permanent Address: Select Your State !");
		var text="Select Your State of Permanent Address";
		var error=errorMessage+text;
		errorElement.innerHTML=error;
		errorElement.style.color="red";
		document.getElementById("xstate").focus();
		return false;
		}
	if(xo1=="--Select--")
		{
		alert("Permanent Address: Select Your City !");
		var text="Select Your City of Permanent Address";
		var error=errorMessage+text;
		errorElement.innerHTML=error;
		errorElement.style.color="red";
		document.getElementById("xcity").focus();
		return false;
		}
	var xp=document.forms["form1"]["xpincode"].value;
	if(xp==null || xp=="")
		{
		alert("Permanent Address: Pincode Cannot be Blank !");
		var text="Enter Your Pincode of Permanent Address";
		var error=errorMessage+text;
		errorElement.innerHTML=error;
		errorElement.style.color="red";
		document.getElementById("xpincode").focus();
		return false;
		}
		
	var q=document.getElementById("mcode");
	var q1=q.options[q.selectedIndex].text;
	if(q1=="Country Code")
		{
		alert("Select Country Code !");
		var text="Select Your Country Code For Mobile Number";
		var error=errorMessage+text;
		errorElement.innerHTML=error;
		errorElement.style.color="red";
		document.getElementById("mcode").focus();
		return false;
		}
	
	var r=document.forms["form1"]["mobile"].value;
	var r1=false;
	if(r==null|| r=="")
	{
	alert("Mobile Number Cannot be Blank !");
	var text="Enter Your Mobile Number";
	var error=errorMessage+text;
	errorElement.innerHTML=error;
	errorElement.style.color="red";
	document.getElementById("mobile").focus();
	return false;
	}
	if(r!=null || r!="")
		{
		r1=isNaN(r);
		}
	if(r.length!=10|| r1==true)
	{
		alert("Incorrect Mobile Number !");
		var text="Enter Correct Mobile Number";
		var error=errorMessage+text;
		errorElement.innerHTML=error;
		errorElement.style.color="red";
		document.getElementById("mobile").focus();
		return false;
	}
	
	var s=document.forms["form1"]["lcode"].value;
	var s1=false;
	if(s==null|| s=="")
	{
		alert("STD Code Cannot be Blank !");
		var text="Enter Your STD Code for Landline";
		var error=errorMessage+text;
		errorElement.innerHTML=error;
		errorElement.style.color="red";
		document.getElementById("lcode").focus();
		return false;
	}
	if(s!=null||s!="")
	{
		s1=isNaN(s);
	}

	if(s1==true)
	{
		alert("Incorrect STD Code !");
		var text="Enter Correct STD Code for Landline";
		var error=errorMessage+text;
		errorElement.innerHTML=error;
		errorElement.style.color="red";
		document.getElementById("lcode").focus();
		return false;
	}

	var t=document.forms["form1"]["landline"].value;
	var t1=false;
	if(t==null|| t=="")
	{
		alert("Landline Number Cannot be Blank !");
		var text="Enter Your Landline Number";
		var error=errorMessage+text;
		errorElement.innerHTML=error;
		errorElement.style.color="red";
		document.getElementById("landline").focus();
		return false;
	}

	if(t!=null||t!="")
	{
		t1=isNaN(t);
	}
	if(t1==true)
	{
		alert("Incorrect Landline Number !");
		var text="Enter Correct Landline Number";
		var error=errorMessage+text;
		errorElement.innerHTML=error;
		errorElement.style.color="red";
		document.getElementById("landline").focus();
		return false;
	}
	var u=document.forms["form1"]["eid"].value;
	var u1=atpos=u.indexOf("@");
	if(u==null || u=="")
		{
		alert("Email ID Cannot be Blank !");
		var text="Enter Your Email ID (Only The ID)";
		var error=errorMessage+text;
		errorElement.innerHTML=error;
		errorElement.style.color="red";
		document.getElementById("eid").focus();
		return false;
		}
	if(u1>=0)
		{
		alert("Incorrect Email ID !");
		var text="Enter Your Email ID (Only The ID)";
		var error=errorMessage+text;
		errorElement.innerHTML=error;
		errorElement.style.color="red";
		document.getElementById("eid").focus();
		return false;
		}
	
	
	var v=document.getElementById("edomain");
	var v1=v.options[v.selectedIndex].text;
	if(v1=="Select Domain")
		{
		alert("Select Domain For Your Email Id !");
		var text="Select Domain For Your Email Id ";
		var error=errorMessage+text;
		errorElement.innerHTML=error;
		errorElement.style.color="red";
		document.getElementById("edomain").focus();
		return false;
		}
	var w=document.forms["form1"]["email"].value;
	var w1=u+"@"+v1;
	if(w==null || w=="")
	{
		alert("Re-Enter Your Full Email Id !");
		var text="Re-Enter Your Full Email Id ";
		var error=errorMessage+text;
		errorElement.innerHTML=error;
		errorElement.style.color="red";
		document.getElementById("email").focus();
		return false;
	}
	if(w1!=w)
	{
		alert("Email Id Mismatch !");
		var text="Re-Enter Your Full Email Id ";
		var error=errorMessage+text;
		errorElement.innerHTML=error;
		errorElement.style.color="red";
		document.getElementById("email").focus();
		return false;		
	}
	
	var mname=document.getElementById("mname1");
	if(mname.value==null||mname.value=="")
	{
		document.getElementById("mname").value="n/a";
	}
	else
	{
		document.getElementById("mname").value=mname.value;
	}
	var homeno=document.forms["form1"]["homeno"].value;
	var landmark=document.forms["form1"]["landmark"].value;
	if(homeno==null|| homeno=="")
	{
		document.forms["form1"]["homeno"].value="n/a";
	}
	if(landmark==null|| landmark=="")
	{
		document.forms["form1"]["landmark"].value="n/a";
	}
	
	GetCid();
			
}
function xmlhttpPost(strURL,element,nextElement)
{
	var errorElement=document.getElementById("errormsg");
	var errorMessage=" **Error : ";
	var k=document.getElementById(element);
	var k1=k.options[k.selectedIndex].text;
	var removeXElement=document.getElementById(nextElement);
	var x = removeXElement;
	while (x.length>1)
	{
		x.remove(x.length-1);
	}
	if(k1=="--Select--")
	{
		alert("Select Correct State !");
		var text="Select Correct State";
		var error=errorMessage+text;
		errorElement.innerHTML=error;
		errorElement.style.color="red";
		document.getElementById(element).focus();
		return false;	
	}
	else
	{
		var xmlHttpReq = false;
		var self = this;
	
		// Mozilla/Safari
		if (window.XMLHttpRequest)
		{
			self.xmlHttpReq = new XMLHttpRequest();
		}
	
		// IE
		else if (window.ActiveXObject) 
		{
			self.xmlHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
		}
	
		self.xmlHttpReq.open('POST', strURL, true);
		self.xmlHttpReq.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		self.xmlHttpReq.onreadystatechange = function()
		{
			if (self.xmlHttpReq.readyState == 4) 
			{
				updatepage(self.xmlHttpReq.responseText,nextElement);
			}
		};
		self.xmlHttpReq.send(getquerystring(element));
	}
}

function getquerystring(element)
{
	var k=document.getElementById(element);
	var k1=k.options[k.selectedIndex].text;
	var word = k1;
	qstr = 'w=' + escape(word); // NOTE: no '?' before querystring
	return qstr;
}

function updatepage(str,nextElement)
{
	var cityString = str.split(",");
	var l=cityString.length;
	var n=0;
	var selectElement;
	if(nextElement=="city")
	{
		selectElement=document.form1.city;
		for (n=0; n<l-1; n++)
		{
			selectElement.options[selectElement.options.length]=new Option(cityString[n],cityString[n]);
		}
	}
	if(nextElement=="xcity")
	{
		selectElement=document.form1.xcity;
		for (n=0; n<l-1; n++)
		{
			selectElement.options[selectElement.options.length]=new Option(cityString[n],cityString[n]);
		}
	}

}

function GetCid()
{
	document.getElementById("getbranch").removeAttribute("onclick");
	var applicationno1=document.forms["form1"]["applicationno"].value;
	var branchcode1=document.forms["form1"]["branchcode"].value;
	var cid="BOB";
	if(branchcode1.length==1)
	{
		cid+="000"+branchcode1;
	}
	else if(branchcode1.length==2)
	{
		cid+="00"+branchcode1;
	}
	else if(branchcode1.length==3)
	{
		cid+="0"+branchcode1;
	}
	else if(branchcode1.length==4)
	{
		cid+=branchcode1;
	}
	else if(branchcode1.length>=5)
	{
		cid+=branchcode1;
	}
	
	if(applicationno1.length==1)
	{
		cid+="00000"+applicationno1;
	}
	else if(applicationno1.length==2)
	{
		cid+="0000"+applicationno1;
	}
	else if(applicationno1.length==3)
	{
		cid+="000"+applicationno1;
	}
	else if(applicationno1.length==4)
	{
		cid+="00"+applicationno1;
	}
	else if(applicationno1.length==5)
	{
		cid+="0"+applicationno1;
	}
	else if(applicationno1.length==6)
	{
		cid+=applicationno1;
	}
	else if(applicationno1.length>=7)
	{
		cid+=applicationno1;
	}

	document.getElementById("cid").value=cid;
	var cidElement=document.getElementById("customeridmessage");
	var message=" **Your Customer ID: "+cid+" . Please Note The CID for future references.";
	cidElement.innerHTML=message;
	cidElement.style.color="red";
	
	var cell1=document.getElementById("proceedandsubmit");
	
	var x=document.getElementById("proceed");
    cell1.removeChild(x);
    
	var element1 = document.createElement("input");
    element1.setAttribute("type", "Submit");
    element1.setAttribute("value", "Save And Proceed");
    element1.setAttribute("name", "Submit");
    cell1.appendChild(element1);
    
    
    //cell1.removeChild("proceed");
	
}

function changeColorOnfocus(x)
{
	x.style.background="yellow";
}

function loadPermanentAddress()
{
	var q=document.getElementById("addsame");
	var q1=q.options[q.selectedIndex].text;
	if(q1=="YES")
	{
		var homeno=document.forms["form1"]["homeno"].value;
		var street=document.forms["form1"]["street"].value;
		var landmark=document.forms["form1"]["landmark"].value;
		var district=document.forms["form1"]["district"].value;
		var pincode=document.forms["form1"]["pincode"].value;
		
		var state=document.forms["form1"].state.value;
		var city=document.forms["form1"].city.value;
		
		document.forms["form1"]["xhomeno"].value=homeno;
		document.forms["form1"]["xstreet"].value=street;
		document.forms["form1"]["xlandmark"].value=landmark;
		document.forms["form1"]["xdistrict"].value=district;
		document.forms["form1"]["xpincode"].value=pincode;
		
		document.getElementById("xstate").value=state;
		
		element=document.getElementById("xcity");
		var option = document.createElement("option");
		option.text=city;
		option.value=city;
		element.add(option);
		document.getElementById("xcity").value=city;
		
		document.forms["form1"]["xhomeno"].disabled=true;
		document.forms["form1"]["xstreet"].disabled=true;
		document.forms["form1"]["xlandmark"].disabled=true;
		document.forms["form1"]["xdistrict"].disabled=true;
		document.forms["form1"]["xpincode"].disabled=true;
		
		document.getElementById("xstate").disabled=true;
		document.getElementById("xcity").disabled=true;
		
	}
	if(q1=="NO")
	{
		document.forms["form1"]["xhomeno"].value="";
		document.forms["form1"]["xstreet"].value="";
		document.forms["form1"]["xlandmark"].value="";
		document.forms["form1"]["xdistrict"].value="";
		document.forms["form1"]["xpincode"].value="";
		
		document.getElementById("xstate").selectedIndex=0;
		var element=document.getElementById("xcity");
		var x = element;
		while (x.length>1)
		  {
		  x.remove(x.length-1);
		  }
		
		
		document.getElementById("xcity").selectedIndex=0;
		
		document.forms["form1"]["xhomeno"].disabled=false;
		document.forms["form1"]["xstreet"].disabled=false;
		document.forms["form1"]["xlandmark"].disabled=false;
		document.forms["form1"]["xdistrict"].disabled=false;
		document.forms["form1"]["xpincode"].disabled=false;
		
		document.getElementById("xstate").disabled=false;
		document.getElementById("xcity").disabled=false;
	}
}
function enableMinor()
{
	document.getElementById("uidno2").disabled=false;
	document.forms["form1"]["cage"].value="minor";
}
function disableMinor()
{
	document.getElementById("uidno2").disabled=true;
	document.getElementById("minor").checked=false;
	document.forms["form1"]["cage"].value="general";
}
function enableSenior()
{
	document.getElementById("uidno2").disabled=true;
	document.forms["form1"]["cage"].value="senior";
}
function disableSenior()
{
	document.getElementById("uidno2").disabled=true;
	document.getElementById("senior").checked=false;
	document.forms["form1"]["cage"].value="general";
}

function getYears()
{
	var d = new Date();
	var y = d.getFullYear();
	var element=document.getElementById("yyyy");
	while (element.length>1)
	{
		element.remove(x.length-1);
	}
	for(var i=y;i>=1930;i--)
	{
		element.options[element.options.length]=new Option(i,i);
	}
}
function getDays()
{
	var element=document.getElementById("dd");
	while (element.length>1)
	{
		element.remove(x.length-1);
	}
	for(var d=1;d<=31;d++)
	{
		element.options[element.options.length]=new Option(d,d);
	}
}

function displayDate()
{
	var d = new Date();
	var yyyy=d.getFullYear();
	var mm=d.getMonth()+1;
	if(mm<=9)
	{
		mm="0"+mm;
	}
	var dd=d.getDate();
	if(dd<=9)
	{
		dd="0"+dd;
	}
	var dor=yyyy+"-"+mm+"-"+dd;
	document.forms["form1"]["dor"].value=dor;
	var x = document.getElementById("displaydate");
	x.innerHTML=d.toDateString()+" "+d.toLocaleTimeString();
}
function loadFunctions()
{
	displayDate();	
	getDays();
	getYears();
}
</script>

</head>
<body onload="loadFunctions()">
<%@	page import="java.sql.Connection ,
				     java.sql.DriverManager ,
					 java.sql.PreparedStatement ,
					 java.sql.ResultSet ,
					 java.sql.SQLException"
	 %>
	 <%!
	int SIZE=100;
	Connection con=null;
	PreparedStatement pst=null;
	ResultSet rs=null;
	String sql=null;
	int countState=0,countCity=0;
	int i=-1;
	static int applicationno=0;
	String state[]=new String[SIZE];
	String city[]=new String[SIZE];
	String branchstateValue;
	int value=0;
	%>
	<%
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bobdatabase","root","nirmallya");
		sql="select distinct state from stateandcity order by state";
		pst=con.prepareStatement(sql);
		rs=pst.executeQuery();
		i=-1;
		while(rs.next())
		{
			i=i+1;
			state[i]=rs.getString(1);
		}
		countState=i;
		
		i=0;
		sql="select max(applicationno) from application";
		pst=con.prepareStatement(sql);
		rs=pst.executeQuery();
		if(rs.next())
		{
			i=rs.getInt(1);
		}
		applicationno=i+1;
		
		sql="insert into application(applicationno) values(?)";
		pst=con.prepareStatement(sql);
		pst.setInt(1, applicationno);
		value=pst.executeUpdate();
		
	}
	catch(ClassNotFoundException e)
	{
			e.printStackTrace();
	}
	catch(SQLException e)
	{
		e.printStackTrace();
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	finally
	{
			try
			{
				if(con!=null)
				con.close();

			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
	}
	%>
	 

<form name="form1" action="Form1PersonalDetailsServlet" method="post">
<center>
<table class="CSSFormCustomer" align="center">
<tr>
	<th colspan="3">Personal Details</th>
</tr>
<tr>
	<td colspan="3">
	<p id="instruction"><font color="red"><b>
	Do not Press F5 or Refresh while filling up this form
	</b></font>	</p>
	<p id="errormsg">
	</p>
	</td>
</tr>
<tr bgcolor=#ffffff>
	<td>
	Application No.
	</td>
	<td colspan="1">
	<input type="text" name="applicationno" value="<%=applicationno%>" readonly="readonly">
	</td>
	<td align="center"><font face="Gregoria"><b>
	<label id="displaydate"></label> </b></font>
	<input type="hidden" name="dor" id="dor">
	</td>
</tr>
<tr bgcolor=#d8d8d8>
	<td>
	Branch* <button type="button" id="getbranch" onclick="getBranch()">Click Here To Choose</button> 
	</td>
	<td>
	Branch Code &nbsp;&nbsp;<input type="text" name="branchcode" id="branchcode" readonly="readonly" placeholder="Select Branch Code">
	<br>
	Branch Name <input type="text" name="branchname" id="branchname" readonly="readonly" placeholder="Select Branch Name">
	</td>
	<td>
	<textarea rows="3" cols="40" name="branchaddress" id="branchaddress" readonly="readonly" placeholder="Select Branch Address"></textarea>
	</td>
</tr>

<tr bgcolor=#ffffff>
	<td>
	Customer Type*
	</td>
	<td>
	<input type="radio" name="ctype" value="public" checked="checked">Public
	<input type="radio" name="ctype" value="staff">Staff
	</td>
	<td>
	<input type="radio" name="cage1" value="senior" id="senior" onclick="enableSenior()" ondblclick="disableSenior()">Senior Citizen
	<input type="radio" name="cage1" value="minor" id="minor" onclick="enableMinor()" ondblclick="disableMinor()">Minor
	<input type="hidden" name="cage" value="general">
	</td>
	
</tr>
<tr bgcolor=#d8d8d8>
	<td>
	Name*
	</td>
	<td colspan="2">
	<select name="salutation">
	<option value="Mr.">Mr.</option>
	<option value="Mrs.">Mrs.</option>
	<option value="Others">Others</option>
	</select>
	<input type="text" name="fname" id="fname" placeholder="First Name">
	<input type="text" name="mname1" id="mname1" placeholder="Middle Name">
	<input type="hidden" name="mname" id="mname">
	<input type="text" name="lname" id="lname" placeholder="Last Name">
	</td>
</tr>
<tr bgcolor=#ffffff>
	<td>
	Name Of Guardian*
	</td>
	<td colspan="2">
		<select name="guardian">
	<option value="father">Father</option>
	<option value="husband">Husband</option>
	<option value="mother">Mother</option>
	</select>	  
	
	<select name="gsalutation">
	<option value="Mr.">Mr.</option>
	<option value="Mrs.">Mrs.</option>
	<option value="Others">Others</option>
	</select>
	<input type="text" name="gname" id="gname" placeholder="Full Name">
	</td>
</tr>
<tr bgcolor=#d8d8d8>
	<td>
	Date Of Birth*
	</td>
	<td>
	
	<select name="dd" id="dd">
	<option value="0">DD</option>
	</select>
	<select name="mm" id="mm">
	<option value="0">MM</option>
	<option value="01">Jan</option>
	<option value="02">Feb</option>
	<option value="03">Mar</option>
	<option value="04">Apr</option>
	<option value="05">May</option>
	<option value="06">Jun</option>
	<option value="07">Jul</option>
	<option value="08">Aug</option>
	<option value="09">Sep</option>
	<option value="10">Oct</option>
	<option value="11">Nov</option>
	<option value="12">Dec</option>
	</select>
	
	<select name="yyyy" id="yyyy">
	<option value="0">YYYY</option>
	</select>
	</td>
	<td>
	Gender*
	<input type="radio" name="gender" value="male" checked="checked">Male
	<input type="radio" name="gender" value="female">Female
	</td>
</tr>
<tr bgcolor=#ffffff>
	<td>
	Nationality*
	</td>
	<td colspan="2">
	<select name="nationality">
	<option value="indian">INDIAN</option>
	<option value="others">Others</option>
	</select> 
	</td>
</tr>
<tr bgcolor=#d8d8d8>
	<td>
	Mother's Maiden Name*
	</td>
	<td>
	<input type="text" name="maiden" id="maiden" placeholder="Mother's Maiden Name">
	</td>
	<td>
	Applicant's Marital Status*
	<select name="marital" id="marital">
	<option value="0">--Select--</option>
	<option value="single">Single</option>
	<option value="married">Married</option>
	<option value="others">Others</option>
	</select>
</tr>
<tr bgcolor=#ffffff>
	<td>
	UID of Applicant
	</td>
	<td colspan="2" placeholder="UID Of Applicant">
	<input type="text" name="uidno1" id="uidno1">
	OR UID of Father/Mother
	<input type="text" name="uidno2" id="uidno2" disabled="disabled" placeholder="If Applicant is Minor">
	</td>
</tr>
<tr bgcolor=#888888>
	<th colspan="3" align="left">Correspondence Address (Current Residential/Office)
	</th>
</tr>
<tr bgcolor=#ffffff>
	<td>
	Home No./Flat No.
	</td>
	<td colspan="2">
	<input type="text" name="homeno" placeholder="Home No./Flat No.">
	</td>
</tr>
<tr bgcolor=#d8d8d8>
	<td>
	Street Address*
	</td>
	<td colspan="2">
	<input type="text" name="street" id="street" placeholder="Street Address">
	</td>
</tr>
<tr bgcolor=#ffffff>
	<td>
	Landmark
	</td>
	<td>
	<input type="text" name="landmark" placeholder="Land Mark">
	</td>
	<td>
	District*
	<input type="text" name="district" id="district" placeholder="District">
	</td>
</tr>
<tr bgcolor=#d8d8d8>
	<td>
	State*
	</td>
	<td>
	<select name="state" id="state" onchange='return xmlhttpPost("GetCityFromStateAjax.jsp","state","city")'>
	<option value="0">--Select--</option>
	<%
	for(int j=0;j<=countState;j++)
	{
		String stringValue=state[j];
	 %>
	 <option value="<%=stringValue %>"><%= stringValue %></option>
	<%
	}
	%>
	</select>
	</td>
	<td>
	City*
	<select name="city" id="city">
	<option value="0">--Select--</option>
	</select>
	</td>
</tr>
<tr bgcolor=#ffffff>
	<td>
	PINCODE*
	</td>
	<td colspan="2">
	<input type="text" name="pincode" id="pincode" placeholder="Pin Code">
	</td>
</tr>
<tr bgcolor=#888888>
	<th colspan="3" align="left">Permanent Address
	</th>
</tr>
<tr bgcolor=#ffffff>
	<td colspan="3">
	<center>
	<i>
	<b>
	Same as Correspondence
	</b>
	</i>
	<select name="addsame" id="addsame" onchange="loadPermanentAddress()">
	<option value="no">NO</option>
	<option value="yes">YES</option>
	</select>
	</center>
	</td>
	
</tr>
<tr bgcolor=#d8d8d8>
	<td>
	Home No./Flat No.
	</td>
	<td colspan="2">
	<input type="text" name="xhomeno" placeholder="Home No./Flat No.">
	</td>
</tr>
<tr bgcolor=#ffffff>
	<td>
	Street Address*
	</td>
	<td colspan="2">
	<input type="text" name="xstreet" id="xstreet" placeholder="Street Address">
	</td>
</tr>
<tr bgcolor=#d8d8d8>
	<td>
	Landmark
	</td>
	<td>
	<input type="text" name="xlandmark" placeholder="Land Mark">
	</td>
	<td>
	District*
	<input type="text" name="xdistrict" id="xdistrict" placeholder="District">
	</td>
</tr>
<tr bgcolor=#ffffff>
	<td>
	State*
	</td>
	<td>
	<select name="xstate" id="xstate" onchange='return xmlhttpPost("GetCityFromStateAjax.jsp","xstate","xcity")'>
	<option value="0">--Select--</option>
	<%
	for(int j=0;j<=countState;j++)
	{
		String stringValue=state[j];
	 %>
	 <option value="<%=stringValue %>"><%= stringValue %></option>
	<%
	}
	%>
	</select>
	</td>
	<td>
	City*
	<select name="xcity" id="xcity">
	<option value="0">--Select--</option>
	</select>
	</td>
</tr>
<tr bgcolor=#d8d8d8>
	<td>
	PINCODE*
	</td>
	<td colspan="2">
	<input type="text" name="xpincode" id="xpincode" placeholder="PinCode">
	</td>
</tr>
<tr bgcolor=#888888>
	<th colspan="3" align="left">Contacts
	</th>
</tr>

<tr bgcolor=#ffffff>
	<td>
	Mobile No.*
	</td>
	<td colspan="2">
	<select name="mcode" id="mcode">
	<option value="0">Country Code</option>
	<option value="+91">+91</option>
	</select>
	<input type="text" name="mobile" id="mobile" placeholder="mobile">
	</td>
</tr>
<tr bgcolor=#d8d8d8>
	<td>
	Telephone No.*
	</td>
	<td colspan="2">
	<input type="text" name="lcode" id="lcode" placeholder="STD Code">
	<input type="text" name="landline" id="landline" placeholder="Landline No.">
	</td>
</tr>
<tr bgcolor=#ffffff>
	<td>
	Email ID*
	</td>
	<td colspan="2">
	<input type="text" name="eid" id="eid" placeholder="Only Id">
	@
	<select name="edomain" id="edomain">
	<option value="0">Select Domain</option>
	<option value="gmail.com">gmail.com</option>
	<option value="yahoo.com">yahoo.com</option>
	</select>
	</td>
</tr>
<tr bgcolor=#d8d8d8>
	<td>
	Re-Enter Email ID*
	</td>
	<td colspan="2">
	<input type="text" name="email" id="email" placeholder="eg. someone@abc.com">
	</td>
</tr>
<tr>
	<td colspan="3">
	<input type="hidden" id="cid" name="cid">
	<p id="customeridmessage"><b>
	</b></p>
	</td>
</tr>
<tr>
	<td colspan="3" id="proceedandsubmit" align="center" style="text-align: center">
	<button type="button" id="proceed" onclick="return form1Validation()">Proceed</button>
	</td>
</tr>
</table>
</center>
</form>

</body>
</html>