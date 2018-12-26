<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.io.*" %>
<%@ page import="thinkonweb.util.ConnectionContext" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%!
String strBuf = null;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script language = "JavaScript">

</script>
</head>
<body>
<%
	Connection conn = ConnectionContext.getConnection();
	Statement stmt = conn.createStatement();
	
	int departure, destination, personnel;
	int month, date, time;
	int recordCount = 0;
	departure = Integer.parseInt(request.getParameter("departure"));
	destination = Integer.parseInt(request.getParameter("destination"));
	personnel = Integer.parseInt(request.getParameter("personnel"));
	session.setAttribute("departure", request.getParameter("departure"));
	session.setAttribute("destination", request.getParameter("destination"));
	session.setAttribute("personnel", request.getParameter("personnel"));

	/*********************************************************/
	/***time 을 DB에서 가져오는것이 아닌 Aplication에서 가져오게 변경***/
			String buf = "SELECT * FROM Time;";
			ResultSet rs = stmt.executeQuery(buf);
			rs.next();
			month = Integer.parseInt(rs.getString("Month")); 
			date = Integer.parseInt(rs.getString("Date"));
			time = Integer.parseInt(rs.getString("Time"));
			rs.close();
	/*********************************************************/		
			if(departure < destination) // ->
			{
				for(int i = departure ; i < destination ; i++)
				{
					buf = "SELECT count(*) As recordCount FROM station_"+i+" WHERE Remain >= " + personnel + " AND End = '5' AND Date >= "+ date + ";";
					rs = stmt.executeQuery(buf);
					rs.next();
					recordCount = rs.getInt("recordCount");
					rs.close();
					if(recordCount == 0) break;
				}
			}
			else if(departure > destination) // <-
			{
				for(int i = destination ; i > departure ; i--)
				{
					buf = "SELECT count(*) As recordCount FROM station_"+i+" WHERE Remain >= " + personnel + " AND End = '0' AND Date >= "+ date + ";";
					rs = stmt.executeQuery(buf);
					rs.next();
					recordCount = rs.getInt("recordCount");
					rs.close();
					if(recordCount == 0) break;
				}
			}
			else
			{
%>
<script language = "JavaScript">
alert("departure == destination");
location.replace("reservation.jsp");
</script>
<%
			}
			
			if(recordCount == 0)
			{
%>
<script language = "JavaScript">
alert("No Ticket");
location.replace("reservation.jsp");
</script>		
 <%			
			}
			else
			{
				String Train, Train_Date, Train_Time;
				
				if(departure < destination)
				{
					buf = "SELECT * FROM station_"+ departure + " WHERE Remain >= " + personnel + " AND End = '5' AND Date >= "+ date + ";";
					rs = stmt.executeQuery(buf);
					strBuf = "<form name = 'form_rv' action = 'reservationSeat.jsp' method = 'post'>";
					while(rs.next())
					{
						Train = rs.getString("Train");
						Train_Date = rs.getString("Date");
						Train_Time = rs.getString("Time");
						strBuf += "<input type = 'radio' name = 'train' value = '"+Train+Train_Date+Train_Time+"'> Train : "+Train+" Date : "+Train_Date+" Time : "+Train_Time+"<br/>";
					}	
					rs.close();
					strBuf += "<input type = 'submit' name = 'submit' value = 'submit'> <br/>";
					strBuf += "</form>";
					out.println(strBuf);
				}
				else
				{
					buf = "SELECT * FROM station_"+ departure + " WHERE Remain >= " + personnel + " AND End = '0' AND Date >= "+ date + ";";
					rs = stmt.executeQuery(buf);
					strBuf = "<form name = 'form_rv' action = 'reservationSeat.jsp' method = 'post'>";

					while(rs.next())
					{
						Train = rs.getString("Train");
						Train_Date = rs.getString("Date");
						Train_Time = rs.getString("Time");
						strBuf += "<input type = 'radio' name = 'train' value = '"+Train+Train_Date+Train_Time+"'> Train : "+Train+" Date : "+Train_Date+" Time : "+Train_Time+"<br/>";
					}
					rs.close();
					strBuf += "<input type = 'submit' name = 'submit' value = 'submit'> <br/>";
					strBuf += "</form>";
					out.println(strBuf);	
				}			
			}	
%>
</body>
</html>