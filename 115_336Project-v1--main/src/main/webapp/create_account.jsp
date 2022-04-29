<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"  %>
<%@ page import="javax.servlet.http.*,javax.servlet.*"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Account</title>
</head>
<h1> Create an Account</h1>
<body>
	<form method="get" action="aftercreate.jsp">
		<table>	
			<tr>
				<td>New Username</td><td><input type="text" name = "newuser"></td>
			</tr>
			<tr>
				<td>New Password</td><td><input type="text" name = "newpass"></td>
			</tr>
		</table>
		<input type = "submit" value="Create Account">
	</form>
<form method="post" action="login.jsp">
<input type="submit" value="Return to Login">

</form>

</body>
</html>