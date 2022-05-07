<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Representative Controls</title>
</head>
<body>
	<h1>Customer Representative Controls</h1>
	<p> Here are your customer representative controls:</p>
	
	<form method="post" action="createAccountCustomerRep.jsp">
	<input type ="submit" value="Add a new account">
	</form>
	<br>
	<form method="post" action="deleteAccountCustomerRep.jsp">
	<input type ="submit" value="Delete an existing account">
	</form>
	<br>
	<form method="post" action="questions.jsp">
	<input type ="submit" value="View customer questions">
	</form>
	<br>
	<form method="post" action="login.jsp">
	<input type ="submit" value="Back to main login page">
	</form>
</body>
</html>