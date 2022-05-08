<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bid Successfully Placed!</title>
</head>
<body>
<h1>Success!</h1>
<%
out.print("Your bid has been successfully placed!");
%>
<form method ="get" action="showAuc.jsp">
<input type ="submit" value="Return to Auctions">
</form>
<form method ="get" action="home.jsp">
<input type ="submit" value="Return to Home">
</form>
</body>
</html>