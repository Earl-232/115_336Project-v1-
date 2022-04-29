<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	String url = "jdbc:mysql://localhost:3306/buyMe";
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection(url,"root","Cranfordgirl8!");
	Statement stmt = conn.createStatement();
	int exsist = 0;
	
	String user = request.getParameter("newuser");
	String pass = request.getParameter("newpass");
	//check if username exsist in DB. IF T-> print "User ID Already Exsist & Redirect to 
	//create_account again
	String user_list = "SELECT username FROM user_list";
	ResultSet all_users = stmt.executeQuery(user_list);
	
	if(user.equals("")){
		out.print("please enter an unsername");
		return;
	}
	if(pass.equals("")){
		out.print("Enter a Password");
		return;
	}
	//each has a unique username
	while(all_users.next()){
		
		if(all_users.getString("username").equals(user)){
			out.print(user + " Username Already Exsist, Choose Another ONE ");
			exsist = 1;
			break;
		}
		
	}
	
	if(exsist == 0 && !pass.equals("")){
	String insert = "INSERT INTO user_list VALUES('"+ user +"','"+pass+"')";
	int result = stmt.executeUpdate(insert);
	
if (result>0){
	out.print("Welcome to BuyMe " + user + "!");
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
<form method="post" action="create_account.jsp">
<input type="submit" value="Back to Create Account">
</form>
<form method="post" action="login.jsp">
<input type="submit" value="Back to Login">
</form>

</body>
</html>