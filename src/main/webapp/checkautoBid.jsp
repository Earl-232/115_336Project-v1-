<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="com.cs336.pkg.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Place Automatic Bid</title>
</head>
<body>
<%
try {
ApplicationDB db = new ApplicationDB();	
Connection con = db.getConnection();		

Statement stmt = con.createStatement();


//update autoAuc
int autoAucID = Integer.parseInt(request.getParameter("AucID"));
int upLim = Integer.parseInt(request.getParameter("upperLimit"));
int bidInc = Integer.parseInt(request.getParameter("bidInc"));
String uname = (String)session.getAttribute("uname");
out.print(uname);

String updateAuto = "INSERT into autoAuc(AucID,username,upLimit,bidInc)" + "VALUE(?,?,?,?)";
PreparedStatement ps = con.prepareStatement(updateAuto);
ps.setInt(1,autoAucID);
ps.setString(2,uname);
ps.setInt(3,upLim);
ps.setInt(4,bidInc);
ps.executeUpdate();

con.close();
response.sendRedirect("bidSuccess.jsp");
}
catch(Exception e){
	response.sendRedirect("bidFail.jsp");
}

%>

</body>
</html>