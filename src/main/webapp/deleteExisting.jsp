<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"  %>
<%@ page import="javax.servlet.http.*,javax.servlet.*"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Deleting Account</title>
</head>
<body>

<% try {
	
	String url = "jdbc:mysql://localhost:3306/buyMe";
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection(url,"root","csdata336");	
	Statement stmt = conn.createStatement();
	
	String user = request.getParameter("exUser");
	
	String check_user = "SELECT * FROM user_list";
	int user_exist = 0;
	
	ResultSet all_users = stmt.executeQuery(check_user);
	
	while(all_users.next()){
		if(all_users.getString("username").equals(user)){
			user_exist = 1;
			//deletion of key
			String quer = String.format("DELETE FROM user_list WHERE username = %s","'"+user+"'");
			stmt.executeUpdate(quer);	
			break;
		}
	}
	
	if(user_exist==1){
		//delete 
		out.print("Deletion Successful!");
	}
	
	
	if(user_exist==0){
		out.print("username does not exsist");
	}
	all_users.close();
	stmt.close();
	conn.close();
	
}	
catch (Exception e){
	out.print(e);
	}

%>
<form method="post" action="customerRepControls.jsp">
<input type="submit" value="Return to Customer Rep Controls">
</form>
<form method="post" action="login.jsp">
<input type="submit" value="Back to Login">
</form>
</body>
</html>