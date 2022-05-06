<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sales Report Error</title>
</head>
<body>
<%out.print("Error generating summary sales report!");
%>
<form method="post" action="generateSalesReport.jsp">
<input type="submit" value="Return to Generate a Sales Report">
</form>
</body>
</html>