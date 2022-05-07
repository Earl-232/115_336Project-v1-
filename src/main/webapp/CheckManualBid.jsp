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
	
	//auto bid check 
	List<autoBid> allAutoBids = new ArrayList<autoBid>();
	List<Alert> limitAlerts = new ArrayList<Alert>();

	String checkAB = "SELECT * FROM autoAuc";
	ResultSet res = stmt.executeQuery(checkAB);
	
	//all autoBids
	while(res.next()){
		allAutoBids.add(new autoBid(res.getInt("AucID"),res.getFloat("bidInc"),res.getInt("upLimit"),res.getString("username")));
	}
	
	if(allAutoBids.size()>0){
		
	
	for(int i=0;i<allAutoBids.size();i++){
		/*String checkAB1 = "SELECT max(currPrice) FROM bid WHERE AucID =\"" + allAutoBids.get(i).getAucID();
		res = stmt.executeQuery(checkAB1);
		int highestBid = res.getInt("currPrice");*/
		
		String checkAC = String.format("SELECT * FROM bid WHERE AucID = %d AND username <> %s ORDER BY currPrice DESC ",allAutoBids.get(i).getAucID(),"'"+allAutoBids.get(i).getuname()+"'");
		ResultSet resu = stmt.executeQuery(checkAC);
		resu.next();
		float thisPrice = resu.getFloat("currPrice");
		float incBid = Float.sum(allAutoBids.get(i).getbidInc(),thisPrice);
		int limit = allAutoBids.get(i).getupLimit();
		String uname2 = allAutoBids.get(i).getuname();
		//if autoBid is > currPrice && autoBid < limit, place new bid;
		
		if(incBid>thisPrice&&incBid<=limit){
			
			String updateAuc = "UPDATE currAuc SET currPrice = ?,username=? WHERE AucID=? AND currPrice<? AND status <> \"closed\" AND owner <> ?";
			PreparedStatement pos = con.prepareStatement(updateAuc);
			
			pos.setFloat(1,incBid);
			pos.setString(2,uname2);
			pos.setInt(3,allAutoBids.get(i).getAucID());
			pos.setFloat(4,incBid);
			pos.setString(5,uname2);
			pos.executeUpdate();
			
			String bidQuery = "INSERT INTO bid(AucID, username, currPrice)" + " VALUE(?,?,?)";
			PreparedStatement post = con.prepareStatement(bidQuery);
			
			post.setInt(1,allAutoBids.get(i).getAucID());
			post.setString(2,uname2);
			post.setFloat(3,incBid);
			post.executeUpdate();

		}
		//alert user that upper limit has been exceeded
		if(thisPrice>limit){
			
			limitAlerts.add(new Alert(uname2,allAutoBids.get(i).getAucID()));
			String remAutoAuc = "DELETE FROM autoAuc WHERE aucID = ? AND username = ? ";
			PreparedStatement posty = con.prepareStatement(remAutoAuc);
			posty.setInt(1,allAutoBids.get(i).getAucID());
			posty.setString(2,allAutoBids.get(i).getuname());
			posty.executeUpdate();
			allAutoBids.remove(allAutoBids.get(i));
		}
	}
	}
	
	//send alerts to those whose limits were exceeded
	
	int alertID = 0;
	if(limitAlerts.size()>0){
		
	for(int i=0;i<limitAlerts.size();i++){
		String limitCheck = "SELECT max(alertID) FROM notif";
		ResultSet rest = stmt.executeQuery(limitCheck);
		
		if(rest.next()){
			alertID = rest.getInt(1)+1;
		}
		else{
			alertID = 1;
		}
		
		String msg1 = "Your autoBidding limit has been exceed for Auction: " + limitAlerts.get(i).getAucID();
		String sertNotif = "INSERT INTO notif(alertID,messageTime,AucID,username,subject,message)" + "VALUE(?,?,?,?,?,?)";
		PreparedStatement pres = con.prepareStatement(sertNotif);
		pres.setInt(1,alertID);
		pres.setTimestamp(2,new java.sql.Timestamp(new java.util.Date().getTime()));
		pres.setInt(3,limitAlerts.get(i).getAucID());
		pres.setString(4,limitAlerts.get(i).getuname());
		pres.setString(5,"limit exceeded");
		pres.setString(6,msg1);
		pres.executeUpdate();
		
		
	}
	}
	
	//prepare to send alerts
	String checkBuy = "SELECT * FROM bid WHERE currPrice < + " + bidPrice + " AND AucID = " + bidAucID;
	 res = stmt.executeQuery(checkBuy);
	List<Alert> allAlerts = new ArrayList<Alert>();
	
	
	while(res.next()){
		allAlerts.add(new Alert(res.getString("username"),res.getInt("AucID")));
		
	}
	
	 alertID = 0;
	
	if(allAlerts.size()>0){
	for(int i=0;i<allAlerts.size();i++){
		String temp = "SELECT MAX(alertID) FROM notif";
		
		res =stmt.executeQuery(temp);
		if (res.next()){
				alertID = res.getInt(1)+1;
		}
		else{
				alertID = 1;
		}
		String msg = uname + " has heightend the bid for item" + allAlerts.get(i).getAucID();
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