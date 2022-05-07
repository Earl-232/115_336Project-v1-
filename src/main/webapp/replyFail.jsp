<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reply Failed</title>
</head>
<body>
<h1>Invalid Reply</h1>
<%
out.print("Please submit a valid question number and a reply containing no more than 200 characters to an unanswered question.");
%>
<form method ="get" action="questions.jsp">
<input type ="submit" value="Return to questions">
</form>
</body>
</html>