<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Auction History</title>
</head>
<body>
	<form method="post" action="checkHistory.jsp">
		<table>
			<tr>
				<td>Search by Auction ID:</td>
				<td><input type="text" name="AucID"></td>
			</tr>
			<tr>
				<td>Search by user:</td>
				<td><input type="text" name="user"></td>
			</tr>
		</table> 
		
		
		<input type="submit" value="Search">
		<input type="submit" value="View History">
	</form>
	<form method="post" action="showAuc.jsp">
		<input type="submit" value="Return to Auctions" />
	</form>
</body>
</html>