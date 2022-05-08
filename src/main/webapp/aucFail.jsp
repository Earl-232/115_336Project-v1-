<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Auction Failed</title>
</head>
<body>
<h1>Invalid Auction</h1>
<%
out.print("Please fill out all required auction fields and try again.");
%>
<form method ="get" action="createAuc.jsp">
<input type ="submit" value="Return to Create Auction">
</form>
</body>
</html>