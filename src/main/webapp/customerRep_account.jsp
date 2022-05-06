<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Representative Login</title>
</head>
<body>
<h1> Customer Rep Login Page</h1>
	<form method="get" action="customerRep-check.jsp">
		<table>	
			<tr>
				<td>Username:</td><td><input type="text" name = "customerRepUser"></td>
			</tr>
			<tr>
				<td>Password:</td><td><input type="text" name = "customerRepPass"></td>
			</tr>
		</table>
		<input type = "submit" value="login">
	</form>
	
<form method="post" action="login.jsp">
<input type="submit" value="Return to Login">
</form>
</body>
</html>