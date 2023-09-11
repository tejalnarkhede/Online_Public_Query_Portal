<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Your Advice</title>
<link rel="stylesheet" href="css/advice_css.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body style="background-image: url('images//cc2.jpeg');">
<div class="loginbox">
<br>
<h2>Here,We go with ADVICE!!</h2>
<form action="adviceController" method="post">
<p>First Name:</p>
<input type="text" name="fname1" >
<p>Last name:</p>
<input type="text" name="sname1" >
<p>Query ID:</p>
<input type="number" name="qid" placeholder="Enter Query ID">
<p>Your Advice:</p>
<textarea rows="9" cols="40" name="advice" placeholder="Enter Your Advice.."></textarea>
<input type="Submit" name=" " id="but" value="Submit">
</form>
</div>
</body>
</html>