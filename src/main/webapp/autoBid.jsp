<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="checkautoBid.jsp">
		<table>
			<tr>
				<td> Auction ID</td>
				<td><input type="text" name="AucID"></td>
			</tr>
			<tr>
				<td> Upper Limit </td>
				<td><input type="text" name="upperLimit"></td>
			</tr>
			<tr>
				<td> Bid Increment </td>
				<td><input type="text" name="bidInc"></td>
			</tr>
		</table>
		<input type="submit" value="bid">
	</form>


</body>
</html>