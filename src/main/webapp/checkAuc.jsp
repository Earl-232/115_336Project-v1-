<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*, java.sql.Timestamp, java.time.LocalDateTime, java.time.format.DateTimeFormatter"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import= "com.cs336.pkg.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
try {
	ApplicationDB db= new ApplicationDB();
	Connection conn= db.getConnection();
	
	

	
	Statement stmt = conn.createStatement();
	//AucNum = ID# of Auctions & currAuct is all the current auctions
	int newAucID = 0;
	String str = "SELECT MAX(AucID) FROM currAuc";
	
	ResultSet result = stmt.executeQuery(str);
	
	if(result.next()){
			newAucID = result.getInt(1)+1;
	}
	else{
		newAucID = 1;
	}
	//getting parameters for currAuct from createAuc
	String userName = (String)session.getAttribute("uname");
	String itemName = request.getParameter("itemName");
	String itemType = request.getParameter("itemType");
	String itemSize = request.getParameter("iteSize");
	String itemColor = request.getParameter("itemColor");
	String itemBrand = request.getParameter("itemBrand");
	float startPrice = Float.valueOf(request.getParameter("startPrice"));
	float reserveAmount = Float.valueOf(request.getParameter("reserveAmount"));
	String endDate = request.getParameter("endDate");
	String endTime = request.getParameter("endTime");
	String finalDate = endDate+" "+endTime;
	
	//inserting tuple into currAuc table
	String add = "INSERT INTO currAuc(AucID,itemName,itemType,itemSize,itemColor,itemBrand,startPrice,currPrice,reserveAmount,endDate,status,owner,username)"+"VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";
	
	PreparedStatement post = conn.prepareStatement(add);
	
	post.setInt(1,newAucID);
	post.setString(2,itemName);
	post.setString(3,itemType);
	post.setString(4,itemSize);
	post.setString(5,itemColor);
	post.setString(6,itemBrand);
	post.setFloat(7,startPrice);
	post.setFloat(8,startPrice);
	post.setFloat(9,reserveAmount);
	post.setTimestamp(10,Timestamp.valueOf(finalDate));
	post.setString(11,"open");
	post.setString(12,userName);
	post.setString(13,userName);
	post.executeUpdate();
	
	//shutdown
	conn.close();
	response.sendRedirect("showAuc.jsp");
}
catch(Exception e){
	out.print(e);
}




%>
</body>
</html>