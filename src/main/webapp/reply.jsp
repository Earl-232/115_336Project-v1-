<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reply</title>
</head>
<body>
<h1>Reply to a Question</h1>
	<form method="get" action="submitReply.jsp">
		<label>Your Reply:</label>
		<br>
		<label style="font-size:12px;"> Enter question number:</label>
		<input type="text" name="qID"> 
		<br>
		<textarea cols="40" rows="5" name="reply"></textarea>
		<br>
		<input type = "submit" value="Post Reply">
	</form>
	<br>
	<form method="post" action="questions.jsp">
		<input type ="submit" value="Return to questions page">
	</form>
	<form method="post" action="customerRepControls.jsp">
		<input type ="submit" value="Return to customer representative controls">
	</form>
<br>
</body>
</html>