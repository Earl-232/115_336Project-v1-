<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"  %>
<%@ page import="javax.servlet.http.*,javax.servlet.*"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Adding new Customer Rep</title>
</head>
<body>
<% try {
	
	String url = "jdbc:mysql://localhost:3306/buyMe";
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection(url,"root","csdata336");
	Statement stmt = conn.createStatement();
	int exists = 0;
	
	String user = request.getParameter("newRepUser");
	String pass = request.getParameter("newRepPass");
	
	String customerRepLogin = "SELECT username FROM customerRepLogin";
	ResultSet all_users = stmt.executeQuery(customerRepLogin);
	
	if(user.equals("")){
		out.print("Please enter a username");
		return;
	}
	if(pass.equals("")){
		out.print("Please enter a password");
		return;
	}
	//each has a unique username
	while(all_users.next()){
		
		if(all_users.getString("username").equals(user)){
			out.print("The username " + user + " already exists! Please choose another one.");
			exists = 1;
			break;
		}
	}
	
	if(exists == 0 && !pass.equals("")){
		String insert = "INSERT INTO customerRepLogin VALUES('"+ user +"','" + pass + "')";
		int result = stmt.executeUpdate(insert);
		
		if (result > 0){
			out.print("New customer representative " + user + " created!");
		}
	}
	

	all_users.close();
	stmt.close();
	conn.close();

	
}	
catch (Exception e){
	out.print(e);
}
%>
<form method="post" action="createCustomerRep.jsp">
<input type="submit" value="Create another customer representative account">
</form>

<form method="post" action="admin-controls.jsp">
<input type="submit" value="Back to admin controls">
</form>

</body>
</html>