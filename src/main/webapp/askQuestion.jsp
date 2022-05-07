<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"  %>
<%@ page import="javax.servlet.http.*,javax.servlet.*"  %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Posting Question</title>
</head>
<body>

<%
try {
	String url = "jdbc:mysql://localhost:3306/buyMe";
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection(url,"root","csdata336");

	
	Statement stmt = conn.createStatement();
	
	int qID = 0;
	String str = "SELECT MAX(qID) FROM questions";
	
	ResultSet result = stmt.executeQuery(str);
	
	if(result.next()){
		qID = result.getInt(1)+1;
	}
	else{
		qID = 1;
	}
	
	String userName = (String)session.getAttribute("uname");
	String question = request.getParameter("question");
	String reply = "A customer representative will answer your question shortly!";
	int replyCode = 0; 
	if(question.length() > 200 || question.length() == 0){
		response.sendRedirect("questionFail.jsp");
	}else{
		String quer = "INSERT INTO questions VALUES('"+qID+"','"+userName+"','"+question+"', '"+reply+"', '"+replyCode+"')";
		int result2 = stmt.executeUpdate(quer);
		if (result2>0){
			out.print("Question posted successfully!");
		}
	}

	stmt.close();
	conn.close();
}
catch(Exception e){
	out.print(e);
}


%>

</body>
<form method="post" action="questions.jsp">
<input type="submit" value="Return to question page">
</form>
<br>
<form method="post" action="home.jsp">
<input type="submit" value="Return to home page">
</form>
</body>
</html>