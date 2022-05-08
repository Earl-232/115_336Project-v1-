<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"  %>
<%@ page import="javax.servlet.http.*,javax.servlet.*"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Questions</title>
</head>
<body>
<h1>Q and A</h1>
	<form method="post" action="home.jsp">
		<input type ="submit" value="Back to home page">
	</form>
	<br>
	<form method="get" action="askQuestion.jsp">
		<label>Ask a question:</label>
		<br>
		<textarea cols="40" rows="5" name="question"></textarea>
		<br>
		<input type = "submit" value="Post">
	</form>
	<br>
	<form method="post" action="searchQuestions.jsp">
		<label>Search existing questions:</label>
		<br>
		<label style="font-size:12px;"> Enter keyword:</label>
		<input type="text" name="key"> 
		<br>
		<input type ="submit" value="Search">
	</form>
	<br>
<label>All questions:</label>
<% try{
	String url = "jdbc:mysql://localhost:3306/buyMe";
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection(url,"root","csdata336");
	Statement stmt = conn.createStatement();
	
	String str = "SELECT * FROM questions";
	ResultSet res = stmt.executeQuery(str);
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
				<form method="post" action="replyCheck.jsp">
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
</body>
</html>