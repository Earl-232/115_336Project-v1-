<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bid Failed.</title>
</head>
<body>
<h1>Invalid Bid.</h1>
<%
out.print("Please enter a valid bid amount for an existing auction and try again.");
%>
<form method ="get" action="showAuc.jsp">
<input type ="submit" value="Return to Auctions">
</form>
<form method ="get" action="home.jsp">
<input type ="submit" value="Return to Home">
</form>
</body>
</html>