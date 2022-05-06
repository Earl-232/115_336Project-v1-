<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"  %>
<%@ page import="javax.servlet.http.*,javax.servlet.*"  %>
<%@ page import="com.cs336.pkg.*"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Generating total earnings sales report</title>
</head>
<body>

<h1>Total Earnings Sales Report</h1>
<% try {
	
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		
		String query = String.format("SELECT sum(xxxx) as total FROM xxxx");
		
		ResultSet res = stmt.executeQuery(query);
		
		if(res.equals(null)){
			response.sendRedirect("salesReportErr.jsp");
		} else {
			%>
			<table>	
			<tr>
				<td>Total Earnings: </td><td>res</td>
			</tr>
		</table> 
		<% 
		}	
			con.close();
	
		}	
		catch (Exception e){
			out.print(e);
	
		}
	%>
</body>
</html>