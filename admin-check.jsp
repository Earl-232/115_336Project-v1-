<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"  %>
<%@ page import="javax.servlet.http.*,javax.servlet.*"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Checking Admin Credentials</title>
</head>
<body>
	<% try {
	
	
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		
		String user = request.getParameter("loguseradmin");
		String password = request.getParameter("logpassadmin");
		
		String quer = String.format("SELECT * FROM admin_login WHERE username = %s and password = %s","'" + user + "'", "'" + password + "'");
	
		ResultSet res = stmt.executeQuery(quer);
		
		
		if(!res.next()){
			String web = "http://localhost:3306/cs336Sample/loginFail.jsp";
			response.sendRedirect("loginFail.jsp");
			
		}
		else {
			//change this to go to admin controls page
			response.sendRedirect("admin-controls.jsp");
		}
			
			con.close();
	
		}	
		catch (Exception e){
			out.print(e);
	
		}
%>
</body>
</html>
