<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"  %>
<%@ page import="javax.servlet.http.*,javax.servlet.*"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Question Search</title>
</head>
<body>
<label>Results:</label>
<% try{
	String url = "jdbc:mysql://localhost:3306/buyMe";
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection(url,"root","csdata336");
	Statement stmt = conn.createStatement();
	
	String searchBy = request.getParameter("key");
	
	if(searchBy.length() == 0){
		response.sendRedirect("searchFail.jsp");
		return; 
	}
	String quer = String.format("SELECT * FROM questions WHERE question LIKE %s","'%" + searchBy + "%'");
	ResultSet res1 = stmt.executeQuery(quer);
	if(!res1.next()){
		out.print("Your search yielded no results.");
		return; 
	}
	ResultSet res = stmt.executeQuery(quer);
%>

<table style="padding: 2em">
		<tr>
			<td style="padding: 1em">Question #</td>
			<td style="padding: 1em">Posted By</td>
			<td style="padding: 1em">Question</td>
			<td style="padding: 1em">Answer</td>
		</tr>
		<% while (res.next()){ %>
		<tr style="padding: 1em">
			<td style="padding: 1em"><%= res.getInt("qID") %></td>
			<td style="padding: 1em"><%= res.getString("username")%></td>
			<td style="padding: 1em"><%= res.getString("question")%></td>
			<td style="padding: 1em"><%= res.getString("reply")%></td>
			<td>
				<form method="post" action="reply.jsp">
				<input type="submit" value="Add reply">
				</form>
			</td>
		</tr>
		<%} 
		
		%>
</table>
<%} 
catch (Exception e){
			out.print(e);
		}
	%>
<form method="post" action="questions.jsp">
<input type="submit" value="Return to question page">
</form>
</body>
</html>