<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"  %>
<%@ page import="javax.servlet.http.*,javax.servlet.*"  %>
<%@ page import="com.cs336.pkg.*"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Generating total earnings sales report</title>
</head>
<body>

<h1>Total Earnings Summary Sales Report</h1>
<% try {
	
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		
		String query = String.format("SELECT sum(currPrice) as total FROM currAuc");
		
		ResultSet res = stmt.executeQuery(query);
		%>
		<table style="padding: 2em">
		<tr>
			<td style="padding: 1em">Total Earnings:</td>
		</tr>
		<% while (res.next()){ %>
		<tr style="padding: 1em">
			<td style="padding: 1em">$<%= res.getFloat("total")%></td>
		</tr>
		<% } 
			db.closeConnection(con);
		%>
</table>
	<% 
		}	
		catch (Exception e){
			out.print(e);
	
		}
	%>
	<form method="post" action="admin-controls.jsp">
	<input type="submit" value="Return to Admin Controls">
	</form>
	<br>
	<form method="post" action="generateSalesReport.jsp">
	<input type="submit" value="Generate another summary sales report">
	</form>
</body>
</html>