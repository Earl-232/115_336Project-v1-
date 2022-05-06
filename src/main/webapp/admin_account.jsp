<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Login</title>
</head>
<body>
<h1> Admin Login Page</h1>
	<form method="get" action="admin-check.jsp">
		<table>	
			<tr>
				<td>Username:</td><td><input type="text" name = "loguseradmin"></td>
			</tr>
			<tr>
				<td>Password:</td><td><input type="text" name = "logpassadmin"></td>
			</tr>
		</table>
		<input type = "submit" value="login">
	</form>
	
<form method="post" action="login.jsp">
<input type="submit" value="Return to Login">
</form>
	
</body>
</html>