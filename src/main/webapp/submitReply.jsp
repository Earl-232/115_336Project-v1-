<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"  %>
<%@ page import="javax.servlet.http.*,javax.servlet.*"  %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Submitting Reply</title>
</head>
<body>
<%
try {
	String url = "jdbc:mysql://localhost:3306/buyMe";
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection(url,"root","csdata336");

	
	Statement stmt = conn.createStatement();
	
	String qID = request.getParameter("qID");
	int replyCode = 0; 
	if(qID.length() == 0){
		response.sendRedirect("replyFail.jsp");
		return; 
	}else{
		String quer = String.format("SELECT replyCode FROM questions WHERE qID = %s","'" + qID + "'");
		ResultSet res = stmt.executeQuery(quer);
		if(!res.next()){
			response.sendRedirect("replyFail.jsp");
			return; 
		}else{
			replyCode = res.getInt("replyCode"); 
		}
	}
	
	String reply = request.getParameter("reply");
	if(reply.length() > 200 || reply.length() == 0 || replyCode == 1){
		response.sendRedirect("replyFail.jsp");
		return; 
	}else{
		String quer = String.format("UPDATE questions SET replyCode = 1 WHERE qID = %s","'" + qID + "'");
		String quer2 = String.format("UPDATE questions SET reply = %s WHERE qID = %s","'" + reply + "'","'" + qID + "'");
				
		int result = stmt.executeUpdate(quer);
		int result2 = stmt.executeUpdate(quer2);
		if (result>0 && result2>0){
			out.print("Reply posted successfully!");
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
<form method="post" action="customerRepControls.jsp">
<input type="submit" value="Return to customer representative controls">
</form>
</body>
</html>