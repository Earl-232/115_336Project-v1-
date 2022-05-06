<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!DOCTYPE html>
<%@ page import="java.io.*,java.util.*,java.sql.*"  %>
<%@ page import="javax.servlet.http.*,javax.servlet.*"  %>



<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%session.invalidate();
response.sendRedirect("login.jsp");

%>

</body>
</html>