<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*, java.sql.Timestamp, java.time.LocalDateTime, java.time.format.DateTimeFormatter"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="com.cs336.pkg.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% try{
	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();
	
	Statement stmt = con.createStatement();
	
	String itemName = request.getParameter("itemName");
	String itemType = request.getParameter("itemType");
	String username = (String) session.getAttribute("uname");
	String isAvailable = "No";
	
	String insert = "INSERT INTO alerts(itemName,itemType,username,isAvailable)" + "VALUES (?,?,?,?)";
	PreparedStatement ps = con.prepareStatement(insert);
	
	ps.setString(1,itemName);
	ps.setString(2,itemType);
	ps.setString(3,username);
	ps.setString(4,isAvailable);
	ps.executeUpdate();
	
	con.close();
	
	response.sendRedirect("showNotif.jsp");
	
	
}
catch(Exception e){
	out.print(e);
}
%>
</body>
</html>