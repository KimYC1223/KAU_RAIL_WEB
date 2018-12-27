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
			String buf = "";
			ResultSet rs ;
			
			
			buf = "select Id, COUNT(Id) AS Count from User_Ticket GROUP BY Id ORDER BY COUNT(Id) DESC";
			rs = stmt.executeQuery(buf);
			
			int i = 1;
			while (rs.next() ){
					out.print("<tr>");
						out.print("<td>");
						out.print(i);
						out.print("</td>");
						out.print("<td>");
						out.print(rs.getString("ID"));
						out.print("</td>");
						out.print("<td>");
						out.print(rs.getString("Count"));
						out.print("</td>");
					out.print("</tr>");
				
				if( i == 6 ) break;
				else { i ++; }
				
			}
			
			rs.close();
		%>
	</table>
</body>
</html>