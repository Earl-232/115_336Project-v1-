<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ page import="java.io.*,java.util.*,java.sql.*"  %>
<%@ page import="javax.servlet.http.*,javax.servlet.*"  %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Checking Reply Credentials</title>
</head>
<body>
<% try {
	
	
	String url = "jdbc:mysql://localhost:3306/buyMe";
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection(url,"root","csdata336");
	Statement stmt = conn.createStatement();
	
	String user = (String)session.getAttribute("uname");
	
	String quer = String.format("SELECT * FROM customerRepLogin WHERE username = %s","'" + user + "'");

	ResultSet res = stmt.executeQuery(quer);
	
	
	if(!res.next()){
		response.sendRedirect("replyCheckFail.jsp");
	}
	else {
		response.sendRedirect("reply.jsp");
	}
		
		conn.close();

	}	
	catch (Exception e){
		out.print(e);

	}
%>

%>
</body>
</html>