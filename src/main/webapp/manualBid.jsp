<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="CheckManualBid.jsp">
		<table>
			<tr>
				<td>Auction ID (AucID)</td>
				<td><input type="text" name="bidAucID"></td>
			</tr>
			<tr>
				<td>How much to Bid</td>
				<td><input type="text" name="bidPrice"></td>
			</tr>
		</table>
		<input type="submit" value="Place Bid">
	</form>

</body>
</html>