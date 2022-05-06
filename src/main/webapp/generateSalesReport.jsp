<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Generate a Sales Report</title>
</head>
<body>
<h1>Choose the type of summary sales report you would like to generate:</h1>

	<form method="post" action="totalEarnings.jsp">
	<input type ="submit" value="Total Earnings">
	</form>
	<br>
	<form action="bestSelling.jsp">
  		<label for="bestSellingList">Best Selling:</label>
		  <select name="bestSellingType" id="bestSellingTypeID">
		    <option value="item">item</option>
		    <option value="end-user">end user</option>
		  </select>
  		<br>
  		<input type="submit" value="Submit">
	</form>
	<br>
	<form action="earningsPer.jsp">
  		<label for="earningsPerList">Earnings per:</label>
		  <select name="earningPerType" id="earningPerType">
		    <option value="item">item</option>
		    <option value="item-type">item type</option>
		    <option value="end-user">end user</option>
		  </select>
  		<br>
  		<input type="submit" value="Submit">
	</form>
</body>
</html>