<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create Customer Rep</title>
</head>
<body>
	<h1> Enter the credentials for a new Customer Representative!</h1>
	
	<form method="get" action="addNewCustomerRep.jsp">
		<table>	
			<tr>
				<td>New Customer Rep Username</td><td><input type="text" name = "newRepUser"></td>
			</tr>
			<tr>
				<td>New Customer Rep Password</td><td><input type="text" name = "newRepPass"></td>
			</tr>
		</table>
		<input type = "submit" value="Create Account">
	</form>
	<br>
	<form method="post" action="admin-controls.jsp">
	<input type="submit" value="Return to Admin Controls">
	</form>

</body>
</html>