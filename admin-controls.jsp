<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Controls</title>
</head>
<body>
	<h1> Administrator Controls</h1>
	<p> Here are your admin controls:</p>
	
	<form method="post" action="createCustomerRep.jsp">
	<input type ="submit" value="Add a new customer representative account">
	</form>
	<br>
	<form method="post" action="generateSalesReport.jsp">
	<input type ="submit" value="Generate a summary sales report">
	</form>
	<br>
	<form method="post" action="login.jsp">
	<input type ="submit" value="Back to main login page">
	</form>
	
	
</body>
</html>