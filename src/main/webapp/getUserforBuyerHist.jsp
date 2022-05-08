<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="checkBuyHistory.jsp">
		<table>
			<tr>
				<td>Enter Buyer you would like to search for:</td>
				<td><input type="text" name="username"></td>
			</tr>
		</table>
		<input type="submit" value="View History">
	</form>
	<form method="post" action="showAuc.jsp">
		<input type="submit" value="Return to Auctions" />
	</form>
</body>
</html>