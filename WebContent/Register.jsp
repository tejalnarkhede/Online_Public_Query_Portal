 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Registration</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="css//Reg_Css.css">

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
	
	function ValidateMobile() {
		
		var num = document.register.topic.value;
		if (re.test(num)) {
			window.document.forms.register.topic.style.backgroundColor = 'lightgreen'
		} else {
			window.document.forms.register.mobno.value = ""
			alert('Enter Topic..!')
		}
	}
	
	
	function ValidateMobile() {
		re = /^[0-9]{10}$/
		var num = document.register.mobno.value;
		if (re.test(num)) {
			window.document.forms.register.mobno.style.backgroundColor = 'lightgreen'
		} else {
			window.document.forms.register.mobno.value = ""
			alert('Enter Valid Mobile Number!')
		}
	}
	function ValidateUsername() {
		re = /^[a-zA-Z0-9\_]+$/
		var uname = document.register.uname.value;
		if (re.test(uname)) {
			window.document.forms.register.uname.style.backgroundColor = 'lightgreen'
		} else {
			window.document.forms.register.uname.value = ""
			alert('Username can only contain alpha numeric characters and Underscore as a special symbol!')
		}
	}
	function ValidatePassword() {
		re = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/
		var pass = document.register.pass.value;
		if (re.test(pass)) {
			window.document.forms.register.pass.style.backgroundColor = 'lightgreen'
		} else {
			window.document.forms.register.pass.value = ""
			alert('Enter Password containing: \nMinimum eight characters, at least one uppercase letter, one lowercase letter, one number and one special character!')
		}
	}
	function ValidateAge() {
		var age = document.register.age.value
		if (age < 18) {
			alert("Your age should greater than 18");
			window.document.forms.register.age.value = ""
		} else {
			window.document.forms.register.age.style.backgroundColor = 'lightgreen'
		}
	}
	function ValidateAmount() {
		var amountinbox = document.register.amount.value
		if (amountinbox < 0) {
			alert("Enter Valid amount!!");
			window.document.forms.register.amount.value = ""
		} else {
			window.document.forms.register.amount.style.backgroundColor = 'lightgreen'
		}
	}
	function ShowPassword() {
		var x = document.getElementById("myInput");
		if (x.type === "password") {
			x.type = "text";
		} else {
			x.type = "password";
		}
	}
	function ValidateGender() {

		var gender = document.register.gender.value;
		if (gender = null) {
			alert("Please Fill Your Gender!");
		}
	}
</script>
</head>
<body style="background-image: url('images//trr.jpeg');">

	<h1 style="font-family: verdana">Register Yourself Here</h1>
	<div class="boxed" id="FullRegister">
		<form action="RegisterController" name="register" method="get">
			<table align="center">
				
				<tr>
					<td><label><b>First Name:</b></label></td>
					<td><input type="text" placeholder="Enter First Name"
						name="fname" minlength="2" maxlength="20" onblur="ValidateName()"
						required></td>
				</tr>
				<tr>
					<td><label><b>Last Name</b></label></td>
					<td><input type="text" placeholder="Enter Surname"
						name="sname" minlength="2" maxlength="20" onblur="ValidateSName()"
						required></td>
				</tr>
				<tr>
					<td><label><b>Mobile No</b></label></td>
					<td><input type="number" placeholder="Enter Mobile No"
						name="mobno" minlength="10" maxlength="10"
						onblur="ValidateMobile()" required></td>
				</tr>
				<tr>
					<td><label><b>Age </b></label></td>
					<td><input type="number" placeholder="Enter Age" name="age"
						minlength="2" maxlength="2" onblur="ValidateAge()" required></td>
				</tr>
				<tr>
					<td><label><b>Gender </b></label></td>
					<td><input type="radio" id="male" name="gender" value="male"
						checked> <label>Male</label><input type="radio"
						id="female" name="gender" value="female"> <label>Female</label>
						<input type="radio" id="other" name="gender" value="other">
						<label>Other</label>
				</tr>
				<tr>
					<td><label><b>Topic in which you interested In </b></label></td>
					<td><input type="text" placeholder="Enter Topic" name="topic"
						minlength="2" maxlength="30" onblur="" required></td>
				</tr>
				<tr>
					<td><label><b>Username</b> </label></td>
					<td><input type="text" placeholder="Enter Username"
						name="uname" minlength="5" maxlength="10"
						onblur="ValidateUsername()" required></td>
				</tr>
				<tr>
					<td><label><b>Password</b></label></td>
					<td><input type="password" placeholder="Enter Password"
						id="myInput" name="pass" minlength="8" maxlength="16"
						onblur="ValidatePassword()" required><br> <input
						type="checkbox" onclick="ShowPassword()">Show Password</td>
						</tr>	
			</table>
			<br>
			<center>
				By clicking our Register Button you agree to our <br> <a
					href="#">terms and conditions</a>
			</center>
			<button type="submit" value="Register">Register</button>
			<div class="container" style="background-color: #4ca6a0">
				<h3>
					<span class="psw">Already a user? <a href="Login_Page.jsp">Log
							in</a> Yourself
					</span>
				</h3>
			</div>
		</form>
	</div>
</body>
</html>