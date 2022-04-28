<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"  %>
<%@ page import="javax.servlet.http.*,javax.servlet.*"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
</head>
<body>
<% 
HttpSession sesh = request.getSession(true);

%>
<h1>Home Page</h1>
<p> This is the Home Page, Welcome to BuyMe <b> <%out.print((String)sesh.getAttribute("uname")); %></b></p>

<form method="post" action = "logout.jsp">
<input type="submit" value = "loggout">
</form>
<form method="post" action ="createAuc.jsp">
<input type = "submit" value = "Create New Auction">
</form>
<form method="post" action ="showAuc.jsp">
<input type = "submit" value = "Show Auctions">
</form>
</body>
</html>