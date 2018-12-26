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
	String seat[] = request.getParameterValues("seat");
	String id = (String)session.getAttribute("myId");
	String buf;
	ResultSet rs;
	
	if(departure < destination)
	{
		for(int i = departure ; i < destination ; i++)
		{
			buf = "SELECT * from station_"+i+" WHERE Train ="+Train+" AND Date = "+Train_Date+" AND Time = "+Train_Time+" AND End = '5';";
			rs = stmt.executeQuery(buf);
			rs.next();
			buf = "UPDATE station_"+i+" SET Remain = "+(Integer.parseInt(rs.getString("Remain"))-1)+" WHERE Train ="+Train+" AND Date = "+Train_Date+" AND Time = "+Train_Time+" AND End = '5';";;
			stmt.executeUpdate(buf);
			rs.close();
			for(int j = 0 ; j < seat.length ; j++)
			{
				buf = "INSERT INTO Train_"+Train+"(Date, Time, ,Start, End,Seat,User) VALUES('"+Train_Date+"',"+departure+","+destination+",'"+seat[j]+"','"+id+"');";
				stmt.executeUpdate(buf);			
			}			
		}
	}
	else
	{
		for(int i = destination ; i > departure ; i--)
		{
			for(int j = 0 ; j < seat.length ; j++)
			{
				buf = "UPDATE Train_"+ Train +" SET "+seat[j]+"='"+id+"' WHERE Date = "+Train_Date+" AND Time = "+Train_Time+" AND Start = "+i+";";
				stmt.executeUpdate(buf);			
			}			
		}
	}		
%>
<script language = "JavaScript">
alert("예매가 완료되었습니다.");
location.replace("index.jsp");
</script>
</body>
</html>