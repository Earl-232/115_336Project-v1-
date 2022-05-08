<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import ="com.cs336.pkg.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="createAlert.jsp">
	<input type="submit" value="Create Notification">
</form>
<form method="post" action="home.jsp">
		<input type ="submit" value="Back to home page">
</form>
<%
try{
	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();
	
	Statement stmt = con.createStatement();
	
	String uname = (String) session.getAttribute("uname");
	String temp = "SELECT * FROM notif WHERE username = \"" + uname + "\" AND subject <> \"none\"";	
	ResultSet result = stmt.executeQuery(temp);

%>
<h3>Auction Notifications</h3>
		<table style="padding: 2em">
			<tr>
				<td style="padding: 1em">Date and Time</td>
				<td style="padding: 1em">Subject</td>
				<td style="padding: 1em">Message</td>
			</tr>
			<%
			//parse out the results
			while (result.next()) {
			%>
			<tr style="padding: 1em">
				<td style="padding: 1em"><%=result.getString("subject")%></td>
				<td style="padding: 1em"><%=result.getString("message")%></td>
				<td style="padding: 1em"><%=result.getTimestamp("messageTime")%></td>
			</tr>
			
			<br>
			<%
			}
			%>
</table>
<h3>Your Alerts</h3>
<%
String showAlerts = String.format("SELECT * FROM alerts WHERE username=%s","'"+uname+"'");
result = stmt.executeQuery(showAlerts);
%>
<table style="padding: 2em">
			<tr>
				<td style="padding: 1em">Name</td>
				<td style="padding: 1em">Type</td>
				<td style="padding: 1em">Availability</td>
			</tr>
			<%while (result.next()){%>
			<tr style="padding: 1em">
				<td style="padding: 1em"><%=result.getString("itemName")%></td>
				<td style="padding: 1em"><%=result.getString("itemType")%></td>
				<td style="padding: 1em"><%=result.getString("isAvailable")%></td>
			</tr>
			<br>
			
			<% 
			}
			%>
</table>
<% con.close();
}
catch(Exception e){
			out.print(e);
			
		}
%>
</body>
</html>