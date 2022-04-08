<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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