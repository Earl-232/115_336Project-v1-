<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create New Account</title>
</head>
<body>
<h1> Enter the credentials for a new account!</h1>
	
	<form method="get" action="addNewCustomerRep.jsp">
		<table>	
			<tr>
				<td>New Account Username</td><td><input type="text" name = "newRepUser"></td>
			</tr>
			<tr>
				<td>New Account Password</td><td><input type="text" name = "newRepPass"></td>
			</tr>
		</table>
		<input type = "submit" value="Create Account">
	</form>
	<br>
	<form method="post" action="customerRepControls.jsp">
	<input type="submit" value="Return to Customer Rep Controls">
	</form>
</body>
</html>