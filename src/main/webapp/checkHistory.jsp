<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Auction History</title>
</head>
<body>
	<form method="post" action="showHistory.jsp">
		<input type="submit" value="Search Again" />
	</form>
	<form method="post" action="showAuc.jsp">
		<input type="submit" value="Back to All Auctions" />
	</form>

	<% try {
	
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		
			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			String AucID = (String)request.getParameter("AucID");
			String user = (String)request.getParameter("user"); 
			String quer = null; 
			
			if(AucID.equals("")){
				quer = String.format("SELECT * FROM bid WHERE username = %s","'" + user + "'");
			}else if(user.equals("")){
				quer = String.format("SELECT * FROM bid WHERE AucID = %s","'" + AucID + "'");
			}else{
				quer = String.format("SELECT * FROM bid WHERE AucID = %s AND username = %s","'" + AucID + "'","'" + user + "'");
			}
			
			
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(quer);
		%>

	<!--  Make an HTML table to show the results in: -->
	<table style="padding: 2em">
		<tr>
			<td style="padding: 1em">User</td>
			<td style="padding: 1em">Bid</td>
			<td style="padding: 1em">Auction</td>
		</tr>
		<%
			//parse out the results
			while (result.next()) { %>
		<tr style="padding: 1em">
			<td style="padding: 1em"><%= result.getString("username")%></td>
			<td style="padding: 1em"><%= result.getString("currPrice")%></td>
			<td style="padding: 1em"><%= result.getString("AucID")%></td>
		</tr>


		<% }
			//close the connection.
			db.closeConnection(con);
			%>
	</table>


	<%} catch (Exception e) {
		response.sendRedirect("aucHistSearchFail.jsp");
		}%>
</body>
</html>