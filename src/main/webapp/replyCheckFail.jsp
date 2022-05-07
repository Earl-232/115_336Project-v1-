<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reply Fail</title>
</head>
<body>
<h1>Invalid Credentials</h1>
<%
out.print("Only customer representatives may reply to users' questions.");
%>
<form method ="get" action="questions.jsp">
<input type ="submit" value="Return to questions">
</form>
</body>
</html>