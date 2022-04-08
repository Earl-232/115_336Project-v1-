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
	
	String url = "jdbc:mysql://localhost:3306/user_details";
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection(url,"root","csdata336");
	Statement stmt = conn.createStatement();
	
	String user = request.getParameter("loguser");
	String password = request.getParameter("logpass");
	
	String check_user = "SELECT * FROM user_list";
	int user_exsist = 0;
	int user_pass = 0;
	
	ResultSet all_userpass = stmt.executeQuery(check_user);
	
	while(all_userpass.next()){
		if(all_userpass.getString("username").equals(user)&&all_userpass.getString("password").equals(password)){
			user_exsist = 1;
			user_pass = 1;
			break;
		}
		if(all_userpass.getString("username").equals(user)&&!all_userpass.getString("password").equals(password)){
			user_exsist = 1;
			user_pass = 0;
		}
	}
	
	if(user_exsist==1&&user_pass==1){
		HttpSession sesh = request.getSession();
		sesh.setAttribute("uname", user);

		out.print("login successful!");
		response.sendRedirect("home.jsp");
		
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

</body>
<form method="post" action="home.jsp">
<input type="submit" value="submit">
</form>
</body>
</html>