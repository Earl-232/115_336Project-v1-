<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"  %>
<%@ page import="javax.servlet.http.*,javax.servlet.*"  %>
<%@ page import="com.cs336.pkg.*"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Generating best selling sales report</title>
</head>
<body>
<%
String type = request.getParameter("bestSellingType"); 
if (type.equals("item")){
	%>
	<h1>Summary Sales Report for Best Selling Items </h1>
<%} else{
	%> <h1>Summary Sales Report for Best Buyers </h1>
	<%
	}
%>

<% try {
	
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		
		
		if(type.equals("item")){
			
			//String query = String.format("SELECT itemName, currPrice FROM currAuc ORDER BY currPrice DESC");
			String query = String.format("SELECT itemName, currPrice FROM currAuc WHERE status = \'closed\' ORDER BY currPrice DESC");
			ResultSet res = stmt.executeQuery(query);
			%>
		<table style="padding: 2em">
		<tr>
			<td style="padding: 1em">Item</td>
			<td style="padding: 1em">Item Price</td>
		</tr>
		<% while (res.next()){ %>
		<tr style="padding: 1em">
			<td style="padding: 1em"><%= res.getString("itemName")%></td>
			<td style="padding: 1em"><%= res.getFloat("currPrice")%></td>
		</tr>
		<% } 
			db.closeConnection(con);
		%>
</table>
	<% 
		} else{
			String query = String.format("SELECT username, SUM(currPrice) as totalSpent FROM currAuc WHERE status = \'closed\' GROUP BY username ORDER BY totalSpent DESC");
			//String query = String.format("SELECT username, SUM(currPrice) as totalSpent FROM currAuc GROUP BY username ORDER BY totalSpent DESC");
			ResultSet res = stmt.executeQuery(query);
			%>
		<table style="padding: 2em">
		<tr>
			<td style="padding: 1em">Buyer</td>
			<td style="padding: 1em">Total Amount Spent</td>
		</tr>
		<% while (res.next()){ %>
		<tr style="padding: 1em">
			<td style="padding: 1em"><%= res.getString("username")%></td>
			<td style="padding: 1em"><%= res.getFloat("totalSpent")%></td>
		</tr>
		<% } 
			db.closeConnection(con);
		%>
</table>
	<% 
		}
		
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