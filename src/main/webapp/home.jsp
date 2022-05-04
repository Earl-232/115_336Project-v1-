<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"  %>
<%@ page import="javax.servlet.http.*,javax.servlet.*"  %>
<%@ page import="com.cs336.pkg.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
</head>
<body>
<% 
HttpSession sesh = request.getSession(true);

%>
<h1>Home Page</h1>
<p> This is the Home Page, Welcome to BuyMe <b> <%out.print((String)sesh.getAttribute("uname")); %></b></p>

<form method="post" action = "logout.jsp">
<input type="submit" value = "loggout">
</form>
<form method="post" action ="createAuc.jsp">
<input type = "submit" value = "Create New Auction">
</form>
<form method="post" action ="showNotif.jsp">
<input type = "submit" value = "Show Notifications">
</form>
<form method="post" action ="showAuc.jsp">
<input type = "submit" value = "Show Auctions">
</form>
<% try{
	
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	
	Statement stmt = con.createStatement();
	PreparedStatement ps = null;
	
	Timestamp currTime = new java.sql.Timestamp(new java.util.Date().getTime());
	
	//delete all closed auctions from currAuc
	String aucClose = "SELECT * FROM currAuc WHERE endDate <= \"" + currTime + "\" AND status = \"open\"";
	ResultSet result = stmt.executeQuery(aucClose);
	
	List<Winner> closedAuctions = new ArrayList<Winner>();
	
	while(result.next()){
		closedAuctions.add(new Winner(result.getString("username"),result.getInt("AucID"),result.getFloat("reserveAmount"),result.getFloat("currPrice")));	
	}
	
	for(int i=0;i<closedAuctions.size();i++){
		String updateAuc = "UPDATE currAuc SET status = ? WHERE AucID = ?";
		ps = con.prepareStatement(updateAuc);
		
		ps.setString(1,"closed");
		ps.setInt(2,closedAuctions.get(i).getAucID());
		ps.executeUpdate();
		
		String sub = "";
		
		if(closedAuctions.get(i).getWinner()){
			sub="Winner!";
			}
		else{
			sub="none";
		}
	
	
	String sertPurchase = "INSERT INTO purchased(username,AucID,isWinner) VALUES(?,?,?)";
	ps = con.prepareStatement(sertPurchase);
	
	ps.setString(1,closedAuctions.get(i).getuname());
	ps.setInt(2,closedAuctions.get(i).getAucID());
	ps.setString(3,sub);
	ps.executeUpdate();
	
	int notifID = 0;
	
	String temp = "SELECT MAX(alertID) from notif";
	
	result = stmt.executeQuery(temp);
	if(result.next()){
		notifID = result.getInt(1)+1;
		}
	else{
		notifID = 1;
	}
	String msg = "You won an auction! AucID: " + closedAuctions.get(i).getAucID();
	String sertNotif = "INSERT INTO notif(alertID,messageTime ,AucID ,username,subject,message) VALUES(?,?,?,?,?,?)";
	ps=con.prepareStatement(sertNotif);
	
	ps.setInt(1,notifID);
	ps.setTimestamp(2,new java.sql.Timestamp(new java.util.Date().getTime()));
	ps.setInt(3,closedAuctions.get(i).getAucID());
	ps.setString(4,closedAuctions.get(i).getuname());
	ps.setString(5,sub);
	ps.setString(6,msg);
	ps.executeUpdate();
	
	}
	
	//check if autoBidders upLimit has been exceeded (might add to checkManualBid)
	
	
	
	
	
	db.closeConnection(con);
	
	
}
catch(Exception e){
	out.print(e);	
}


	%>

</body>
</html>