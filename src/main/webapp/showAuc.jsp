
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Auctions</title>
</head>
<body>
<form method="post" action="manualBid.jsp">
		<input type="submit" value="Manually Bid" />
	</form>
	<form method="post" action="AutomaticAuction.jsp">
		<input type="submit" value="Automatically Bid" />
	</form>
	<form method="post" action="showHistory.jsp">
		<input type="submit" value="Show Auction History" />
	</form>
	<form method="post" action="getUserforBuyerHist.jsp">
		<input type="submit" value="Search A Buyer's History" />
	</form>
	<form method="post" action="getUserforSellerHist.jsp">
		<input type="submit" value="Search A Seller's History" />
	</form>
	<form method="post" action="search.jsp">
		<input type="submit" value="Search Auctions" />
	</form>
	<form method="post" action="simhist.jsp">
		<input type="submit" value="Check for Past Similar Auctions" />
	</form>
	
<br>
<% try{
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();		
	
	Statement stmt = con.createStatement();

	
	String str = "SELECT * FROM currAuc";
	
	ResultSet res = stmt.executeQuery(str);
%>
<table style="padding: 2em">
		<tr>
			<td style="padding: 1em">AucID</td>
			<td style="padding: 1em">Item Name</td>
			<td style="padding: 1em">Item Type</td>
			<td style="padding: 1em">Item Color</td>
			<td style="padding: 1em">Item Brand</td>
			<td style="padding: 1em">Item Size</td>
			<td style="padding: 1em">Item Price</td>
			<td style="padding: 1em">End Date and Time</td>
			<td style="padding: 1em">Status</td>
			<td style="padding: 1em">Highest Bidder</td>
		</tr>
		<% while (res.next()){ %>
		<tr style="padding: 1em">
			<td style="padding: 1em"><%= res.getInt("AucID") %></td>
			<td style="padding: 1em"><%= res.getString("itemName")%></td>
			<td style="padding: 1em"><%= res.getString("itemType")%></td>
			<td style="padding: 1em"><%= res.getString("itemColor")%></td>
			<td style="padding: 1em"><%= res.getString("itemBrand")%></td>
			<td style="padding: 1em"><%= res.getString("itemSize")%></td>
			<td style="padding: 1em"><%= res.getFloat("currPrice")%></td>
			<td style="padding: 1em"><%= res.getTimestamp("endDate")%></td>
			<td style="padding: 1em"><%= res.getString("status")%></td>
			<td style="padding: 1em"><%= res.getString("username")%></td>
		</tr>
		<%} 
			db.closeConnection(con);
		%>
</table>
<%} 
catch (Exception e){
			out.print(e);
		}
	%>


</body>
</html>