
<%@ page import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
try {
	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();
	
	Statement stmt = con.createStatement();
	
	int bidAucID = Integer.parseInt(request.getParameter("bidAucID"));
	float bidPrice = Float.valueOf(request.getParameter("bidPrice"));
	String uname = (String) session.getAttribute("uname");
	
	String updateCurrAuc = "UPDATE currAuc SET currPrice = ?,username=? WHERE AucID=? AND currPrice<? AND status <> \"closed\" AND owner <> ?";
	PreparedStatement ps = con.prepareStatement(updateCurrAuc);
	
	ps.setFloat(1,bidPrice);
	ps.setString(2,uname);
	ps.setInt(3,bidAucID);
	ps.setFloat(4,bidPrice);
	ps.setString(5,uname);
	ps.executeUpdate();
	
	//insert into BID table with prep-statement
	String bidQuer = "INSERT INTO bid(AucID, username, currPrice)" + " VALUE(?,?,?)";
	ps = con.prepareStatement(bidQuer);
	
	ps.setInt(1,bidAucID);
	ps.setString(2,uname);
	ps.setFloat(3,bidPrice);
	ps.executeUpdate();
	
	//prepare to send alerts
	String checkBuy = "SELECT * FROM bid WHERE currPrice < + " + bidPrice + " AND AucID = " + bidAucID;
	ResultSet res = stmt.executeQuery(checkBuy);
	List<Alert> allAlerts = new ArrayList<Alert>();
	
	int alertID = 0;
	
	for(int i=0;i<allAlerts.size();i++){
		String temp = "SELECT MAX(alertID) FROM notif";
		
		res =stmt.executeQuery(temp);
		if (res.next()){
				alertID = res.getInt(1)+1;
		}
		else{
				alertID = 1;
		}
		String msg = uname + "has heightend the bid for item" + allAlerts.get(i).getAucID();
		String newNotif = "INSERT INTO notif(alertID,messageTime,AucID,username,subject,message)" + "VALUE(?,?,?,?,?,?)";
		
		ps = con.prepareStatement(newNotif);
		
		ps.setInt(1,alertID);
		ps.setTimestamp(2,new java.sql.Timestamp(new java.util.Date().getTime()));
		ps.setInt(3,allAlerts.get(i).getAucID());
		ps.setString(4,allAlerts.get(i).getuname());
		ps.setString(5,"outbid");
		ps.setString(6,msg);
		ps.executeUpdate();
	}
	
	con.close();
	response.sendRedirect("showAuc.jsp");
	
}
catch (Exception e){
		out.print(e);
}









%>

</body>
</html>