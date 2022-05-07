<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete an Existing Account</title>
</head>
<body>
<h1> Enter the credentials of the account you would like to delete.</h1>
	
	<form method="get" action="deleteExisting.jsp">
		<table>	
			<tr>
				<td>Account Username</td><td><input type="text" name = "exUser"></td>
			</tr>
			<tr>
				<td>Account Password</td><td><input type="text" name = "exPass"></td>
			</tr>
		</table>
		<input type = "submit" value="Delete Account">
	</form>
	<br>
	<form method="post" action="customerRepControls.jsp">
	<input type="submit" value="Return to Customer Rep Controls">
	</form>
</body>
</html>