<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Invalid Search</title>
</head>
<body>
<h1>Invalid Search Criteria</h1>
<%
out.print("Please enter a valid keyword to search.");
%>
<form method ="get" action="questions.jsp">
<input type ="submit" value="Return to questions">
</form>
</body>
</html>