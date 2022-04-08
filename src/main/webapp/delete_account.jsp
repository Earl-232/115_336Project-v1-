<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Account</title>
</head>
<body>

<h1>Delete Your Account</h1>
<form method="get" action="del_action.jsp">
		<table>	
			<tr>
				<td>Username:</td><td><input type="text" name = "deluser"></td>
			</tr>
			<tr>
				<td>Password:</td><td><input type="text" name = "delpass"></td>
			</tr>
		</table>
		<input type = "submit" value="delete account">
	</form>

</body>
</html>