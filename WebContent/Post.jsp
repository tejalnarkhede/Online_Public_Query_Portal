<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Post</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="css//post_css.css">
<script language="Javascript" type="text/javascript">
	
	function ValidateName() {
		re = /^[A-Za-z]+$/
		var fname = document.register.fname.value;
		if (re.test(fname)) {
			window.document.forms.register.fname.style.backgroundColor = 'lightgreen'
		} else {
			window.document.forms.register.fname.value = ""
			alert('Enter Valid First Name!\nEg: Zayn')
		}
	}
	
	function ValidateSName() {
		re = /^[A-Za-z]+$/
		var sname = document.register.sname.value;
		if (re.test(sname)) {
			window.document.forms.register.sname.style.backgroundColor = 'lightgreen'
		} else {
			window.document.forms.register.sname.value = ""
			alert('Enter Valid Surname!\nEg: Malik')
		}
	}
	
	function confirmComplete() {
		var answer = confirm("Are you sure you want to Post it?");
		if (answer == true) {
			return true;
		} else {
			return false;
		}
		
	}
	
/*	var s=confirmComplete();
	    if(s==true)
		{
			var ans=confirm("Do you want to see your posted Query ?");
			if(ans==true)
			window.location="see.jsp";
		}
	*/
	
</script>
</head>
<body>
<div id="heading">
	<h1 style="font-family: verdana">You Can Post Your Query Here...</h1>
	</div>
	<div class="boxed" id="FullPost">
		<form action="postController" name="postQuery" method="get">
			<table align="center">
				
				<tr>
					<td><label><b>First Name:</b></label></td>
					<td><input type="text" placeholder="Enter First Name"
						name="fname" minlength="2" maxlength="20" onblur="ValidateName()"
						required></td>
				</tr>
				<tr>
					<td><label><b>Last Name :</b></label></td>
					<td><input type="text" placeholder="Enter Surname"
						name="sname" minlength="2" maxlength="20" onblur="ValidateSName()"
						required></td>
				</tr>
				<tr>
					<td><label><b>Query :</b></label></td>
					<td><textarea rows="6" cols="100" placeholder="Enter Your Query.." name="query" style="text-transform:uppercase" required></textarea></td>
				</tr>
				<tr>
					<td><label><b>Status : </b></label></td>
					<tr><td><input type="radio" name="status" value="Pending"/>Pending</td></tr>
						  <tr><td><input type="radio" name="status" value="Executed"/>Executed</td></tr>
						  
				</tr>
				
				
			</table>
			<br>

			<center>
			<button type="submit" value="Post">Post</button>
			<div class="container" style="background-color: #4ca6a0"></div>
			</center>
			</div>
		</form>
</body>
</html>