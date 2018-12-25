<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.io.*" %>
<%@ page import="thinkonweb.util.ConnectionContext" %>
<%@ page import="java.sql.*" %>
<%!
int departure, destination, personnel, Train, Train_Date, Train_Time;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Connection conn = ConnectionContext.getConnection();
	Statement stmt = conn.createStatement();
	departure = Integer.parseInt((String)session.getAttribute("departure"));
	destination = Integer.parseInt((String)session.getAttribute("destination"));
	personnel = Integer.parseInt((String)session.getAttribute("personnel"));
	Train = Integer.parseInt((String)session.getAttribute("Train"));
	Train_Date = Integer.parseInt((String)session.getAttribute("Train_Date"));
	Train_Time = Integer.parseInt((String)session.getAttribute("Train_Time"));
	ResultSet rs;
	if(departure < destination)
	{
		for(int i = departure ; i < destination ; i ++)
		{
			String buf = "INSERT INTO Train_"+ Train + "("+") WHERE Date = "+Train_Date+" AND Time = "+Train_Time+" AND Start = "+i+";";
			rs = stmt.executeQuery(buf);
			rs.next();
			
		}
	}
	else
	{
		
	}
	
%>
</body>
</html>