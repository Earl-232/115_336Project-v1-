<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"  %>
<%@ page import="javax.servlet.http.*,javax.servlet.*"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
</head>
<h1> Login Page</h1>
	<form method="get" action="login-check.jsp">
		<table>	
			<tr>
				<td>Username:</td><td><input type="text" name = "loguser"></td>
			</tr>
			<tr>
				<td>Password:</td><td><input type="text" name = "logpass"></td>
			</tr>
		</table>
		<input type = "submit" value="login">

	</form>
	<form method="post" action="create_account.jsp">
	<input type="submit" value="create account">
	</form>
	
	<form method="post" action="delete_account.jsp">
	<input type ="submit" value="delete account">
	</form>

<br>
<body>

</body>
</html>