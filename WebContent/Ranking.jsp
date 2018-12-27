<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.io.*" %>
<%@ page import="thinkonweb.util.ConnectionContext" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Ranking....!</h2>
	<table border="1">
		<tr>
			<td>Rank</td>
			<td>ID</td>
			<td>Quantity</td>
		</tr>
			<%
			Connection conn = ConnectionContext.getConnection();
			Statement stmt = conn.createStatement();
			
			int departure, destination, personnel;
			int month, date,time;
			int recordCount = 0;
			int ticketCount = 0;
			departure = Integer.parseInt(request.getParameter("departure"));
			destination = Integer.parseInt(request.getParameter("destination"));
			personnel = Integer.parseInt(request.getParameter("personnel"));
			month = Integer.parseInt(request.getParameter("month"));
			date = Integer.parseInt(request.getParameter("date"));
			time = Integer.parseInt(request.getParameter("time"));
			
			String buf = "";
			ResultSet rs ;

		
			
			for (int i = 0 ; i < 5 ; i ++) {
				out.print("<tr>");
					out.print("<td>");
						
					out.print("</td>");
					out.print("<td>");
					
					out.print("</td>");
				out.print("</tr>");
			}
		%>
	</table>
</body>
</html>