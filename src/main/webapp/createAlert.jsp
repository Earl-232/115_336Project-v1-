<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Create an Alert</h1>
	<form method="post" action="checkCreateAlert.jsp">
		<table>
		<tr>
				<td>Name</td>
				<td><input type="text" name="itemName"></td>
			</tr>
			<tr>
				<td>Category (Shirt/Shoe/Pants)</td>
				<td><input type="text" name="itemType"></td>
			</tr>			
		</table>
		<input type="submit" value="Search">
	</form>
	
</body>
</html>