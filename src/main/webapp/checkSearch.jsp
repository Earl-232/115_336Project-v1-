<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"  %>
<%@ page import="javax.servlet.http.*,javax.servlet.*"  %>
<%@ page import="com.cs336.pkg.*"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Auctions:</title>
</head>
<body>

	<form method="post" action="showAuc.jsp">
		<input type="submit" value="Back to All Auctions" />
	</form>
	<form method="post" action="home.jsp">
		<input type="submit" value="Go to Home" />
	</form>
	<br>
	<% try {
	
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		
			//Create a SQL statement
			Statement stmt = con.createStatement();
	
			
			String item = (String)request.getParameter("sortname");
			
			
			//Make a SELECT query from currauc
			String str = "SELECT * FROM currAuc";
			
			if(item.equals("Shirt")){
				str = "SELECT * FROM currAuc WHERE itemType = \"" + item + "\"";
			}else if(item.equals("Shoes")){
				str = "SELECT * FROM currAuc WHERE itemType = \"" + item + "\"";
			}else if(item.equals("Pants")){
				str = "SELECT * FROM currAuc WHERE itemType = \"" + item + "\"";
			}else if(item.equals("Open Auctions")){
				str = "SELECT * FROM currAuc WHERE status = open";
			}else if(item.equals("Closed Auctions")){
				str = "SELECT * FROM currAuc WHERE status = closed";
			}else if(item.equals("Highest to Lowest")){
				str = "SELECT * FROM currAuc ORDER BY currPrice DESC;";
			}else if(item.equals("Lowest to Highest")){
				str = "SELECT * FROM currAuc ORDER BY currPrice ASC;";
			}
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
		%>

	<!--  Make an HTML table to show the results in: -->
	<table style="padding: 2em">
		<tr>
			<td style="padding: 1em">AucID</td>
			<td style="padding: 1em">Name</td>
			<td style="padding: 1em">Type</td>
			<td style="padding: 1em">Price</td>
			<td style="padding: 1em">End Date and Time</td>
			<td style="padding: 1em">Highest Bidder</td>
		</tr>
		<%
			//parse out the results
			while (result.next()) { %>
		<tr style="padding: 1em">
			<td style="padding: 1em"><%= result.getInt("AucID") %></td>
			<td style="padding: 1em"><%= result.getString("itemName")%></td>
			<td style="padding: 1em"><%= result.getString("itemType")%></td>
			<td style="padding: 1em"><%= result.getFloat("currPrice")%>
			</td>
			<td style="padding: 1em"><%= result.getTimestamp("endDate")%></td>
			<td style="padding: 1em"><%= result.getString("username")%></td>
		</tr>


		<% }
			//close the connection.
			db.closeConnection(con);
			%>
	</table>


	<%} catch (Exception e) {
			out.print(e);
		}%>


</body>
</html>