<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"  %>
<%@ page import="javax.servlet.http.*,javax.servlet.*"  %>
<%@ page import="com.cs336.pkg.*"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Generating sales report</title>
</head>
<body>
<%
String type = request.getParameter("earningsPerType"); 
%>
<h1>Summary Sales Report for earnings per <b> <%out.print(type); %></b> </h1>

<% try {
	
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		
		
		if(type.equals("item")){
			
			//String query = String.format("SELECT itemName, currPrice FROM currAuc");
			String query = String.format("SELECT itemName, currPrice FROM currAuc WHERE status = \'closed\'");
			ResultSet res = stmt.executeQuery(query);
			%>
		<table style="padding: 2em">
		<tr>
			<td style="padding: 1em">Item</td>
			<td style="padding: 1em">Total Earned from Item</td>
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
		} else if (type.equals("end-user")){
			String query = String.format("SELECT username, SUM(currPrice) as totalSpent FROM currAuc WHERE status = \'closed\' GROUP BY username");
			//String query = String.format("SELECT username, SUM(currPrice) as totalSpent FROM currAuc GROUP BY username");
			ResultSet res = stmt.executeQuery(query);
			%>
		<table style="padding: 2em">
		<tr>
			<td style="padding: 1em">User</td>
			<td style="padding: 1em">Total Earnings from User</td>
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
		} else {
			String query = String.format("SELECT itemType, SUM(currPrice) as totalEarned FROM currAuc WHERE status = \'closed\' GROUP BY itemType");
			//String query = String.format("SELECT itemType, SUM(currPrice) as totalEarned FROM currAuc GROUP BY itemType");
			ResultSet res = stmt.executeQuery(query);
			%>
		<table style="padding: 2em">
		<tr>
			<td style="padding: 1em">Item Type</td>
			<td style="padding: 1em">Total Earned from Item Type</td>
		</tr>
		<% while (res.next()){ %>
		<tr style="padding: 1em">
			<td style="padding: 1em"><%= res.getString("itemType")%></td>
			<td style="padding: 1em"><%= res.getFloat("totalEarned")%></td>
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