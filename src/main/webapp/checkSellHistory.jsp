<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="com.cs336.pkg.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Seller History</title>
</head>
<body>
	<!-- <form method="post" action="BidHistory.jsp">
		<input type="submit" value="Back to User History" />
	</form> -->
	<form method="post" action="showAuc.jsp">
		<input type="submit" value="Back to All Auctions" />
	</form>

	<%
	try {
		//Get the database connection
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		//Create a SQL statement
		Statement stmt = con.createStatement();
		String user = request.getParameter("username");
		//Make a SELECT query from Events
		String str = "SELECT * FROM currAuc WHERE owner = \"" + user + "\"";
		//Run the query against the database.
		ResultSet result = stmt.executeQuery(str);
	%>

	<!--  Make an HTML table to show the results in: -->
	<table style="padding: 2em">
		<tr>
			<td style="padding: 1em">Auction Id</td>
			<td style="padding: 1em">Name</td>
			<td style="padding: 1em">Item type</td>
			<td style="padding: 1em">Initial Price</td>
			<td style="padding: 1em">Current/Sold Price</td>
			<td style="padding: 1em">Status</td>
		</tr>
		<%
		//parse out the results
		while (result.next()) {
		%>
		<tr style="padding: 1em">
			<td style="padding: 1em"><%=result.getInt("AucID")%></td>
			<td style="padding: 1em"><%=result.getString("itemName")%></td>
			<td style="padding: 1em"><%=result.getString("itemType")%></td>
			<td style="padding: 1em"><%=result.getFloat("startPrice")%></td>
			<td style="padding: 1em"><%=result.getString("currPrice")%></td>
			<td style="padding: 1em"><%=result.getString("status")%></td>
		</tr>


		<%
		}
		//close the connection.
		db.closeConnection(con);
		%>
	</table>


	<%
	} catch (Exception e) {
	out.print(e);
	}
	%>
</body>
</html>