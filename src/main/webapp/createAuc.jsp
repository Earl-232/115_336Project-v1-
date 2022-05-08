<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Create New Auction</h1>
<form method="post" action="checkAuc.jsp">
	<table>
		<tr>
			<td>Item Name </td>
			<td><input type="text" name="itemName"></td>
		</tr>
		<tr>
			<td> Item Type (Shirt,Pants or Shoe) </td>
			<td><input type="text" name="itemType"></td>
		</tr>
		<tr>
			<td> Item Size </td>
			<td><input type="text" name="itemSize"></td>
		</tr>
		<tr>
			<td> Item Color </td>
			<td><input type="text" name = "itemColor"></td>
		<tr>
			<td> Item Brand </td>
			<td> <input type="text" name="itemBrand"></td>
		</tr>
		<tr>
			<td> Starting Price </td>
			<td> <input type="text" name="startPrice"></td>
		</tr>
		<tr>
			<td> Reserve Amount (0 = None)</td>
			<td><input type="text" name="reserveAmount"></td>
		</tr>
		<tr>
			<td> End Date </td>
			<td><input type="text" name="endDate" placeholder="YYYY-MM-DD"></td>
		</tr>
		<tr>
			<td> End Time </td>
			<td><input type="text" name="endTime" placeholder="HH:MM:SS"></td>
		</tr>
		
				</table>
	<input type="submit" value="Create Auction">
</form>
<form method="post" action="home.jsp">
		<input type ="submit" value="Back to home page">
</form>
</body>
</html>