<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Auctions:</title>
</head> 
<body>


<h1>Search</h1>
	<form method="post" action="checkSearch.jsp">
		
			<select name="sortname" id="items">
			  <option value="Shirt">Shirt</option>
			  <option value="Pants">Pants</option>
			  <option value="Shoes">Shoes</option>
			  <option value="Open">Open Auctions</option>
			  <option value="Closed">Closed Auctions</option>
			  <option value="Highest to Lowest">Highest to Lowest Bids</option>
			  <option value="Lowest to Highest">Lowest to Highest Bids</option>
		</select>
		<input type="submit" value="Search">
	</form>


</body>
</html>