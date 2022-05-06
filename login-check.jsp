<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"  %>
<%@ page import="javax.servlet.http.*,javax.servlet.*"  %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Logging Your Account</title>
</head>
<body>
<% try {
	
	
	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();
	Statement stmt = con.createStatement();
	
	String user = request.getParameter("loguser");
	String password = request.getParameter("logpass");
	
	String quer = String.format("SELECT * FROM user_list WHERE username = %s and password = %s","'"+user+"'", "'"+password+"'");

	ResultSet res = stmt.executeQuery(quer);
	

	
	if(!res.next()){
		String web = "http://localhost:3306/cs336Sample/loginFail.jsp";
		response.sendRedirect("loginFail.jsp");
		
	}
	else{
		session.setAttribute("uname", user);
		String web = "http://localhost:3306/cs336Sample/home.jsp";
		response.sendRedirect("home.jsp");
	}
		
		
		con.close();
	
}	
catch (Exception e){
	out.print(e);
	
	}


%>

</body>
<form method="post" action="home.jsp">
<input type="submit" value="submit">
</form>
</body>
</html>