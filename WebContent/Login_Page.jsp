 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Page</title>
<link rel="stylesheet" type="text/css" href="css//Login_CSS.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript">
	function ShowPassword() {
		var x = document.getElementById("myInput");
		if (x.type === "password") {
			x.type = "text";
		} else {
			x.type = "password";
		}
	}
</script>
</head>
<body style="background-image: url('images//tt.jpeg');">

	<div class="boxed" id="FullLogin">
		<form action="LoginController" method="post">
		
			<div>
				<h3>LOG IN</h3>
			</div>
			
			<div class="container">
			
				<b>User name:</b> <input type="text" placeholder="Enter Username"
					name="uname" required> <b>Password:</b> <input
					type="password" placeholder="Enter Password" name="psw"
					id="myInput" required><br> <input type="checkbox"
					onclick="ShowPassword()">Show Password
				<button type="submit">Login</button>
				<input type="checkbox" checked="checked" name="remember">
				Remember me
			</div>
			<div class="container" style="background-color: #4ca6a0">
				<span class="psw">New Here? <a href="Register.jsp">Sign
						in</a> Yourself
				</span>
			</div>
		</form>
	</div>
</body>
</html>