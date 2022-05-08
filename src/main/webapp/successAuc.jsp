<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Auction Created!</title>
</head>
<body>
<h1>Success!</h1>
<%
out.print("Your auction has been successfully created!");
%>
<form method ="get" action="createAuc.jsp">
<input type ="submit" value="Create Another Auction">
</form>
<form method ="get" action="showAuc.jsp">
<input type ="submit" value="View Auctions">
</form>
<form method ="get" action="home.jsp">
<input type ="submit" value="Return to Home">
</form>
</body>
</html>