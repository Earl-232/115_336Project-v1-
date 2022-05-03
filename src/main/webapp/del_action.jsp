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
	Connection conn = DriverManager.getConnection(url,"root","Cranfordgirl8!");	
	Statement stmt = conn.createStatement();
	
	String user = request.getParameter("deluser");
	String password = request.getParameter("delpass");
	
	String check_user = "SELECT * FROM user_list";
	int user_exsist = 0;
	int user_pass = 0;
	
	ResultSet all_userpass = stmt.executeQuery(check_user);
	
	while(all_userpass.next()){
		if(all_userpass.getString("username").equals(user)&&all_userpass.getString("password").equals(password)){
			user_exsist = 1;
			user_pass = 1;
			//deletion of key
			String quer = String.format("DELETE FROM user_list WHERE username = %s and password = %s","'"+user+"'", "'"+password+"'");
			stmt.executeUpdate(quer);	
			break;
		}
		if(all_userpass.getString("username").equals(user)&&!all_userpass.getString("password").equals(password)){
			user_exsist = 1;
			user_pass = 0;
		}
	}
	
	if(user_exsist==1&&user_pass==1){
		//delete 
		out.print("deletion successful!");
	}
	
	if(user_exsist==1 && user_pass!=1){
		
		out.print("incorrect password");
	}
	
	if(user_exsist==0){
		out.print("username does not exsist");
	}
	all_userpass.close();
	stmt.close();
	conn.close();
	
}	
catch (Exception e){
	out.print(e);
	}

%>
<form method="post" action="delete_account.jsp">
	<input type ="submit" value="delete account">
	</form>
<form method="post" action="login.jsp">
	<input type ="submit" value="Back to Login Page">
</form>
</body>
</html>