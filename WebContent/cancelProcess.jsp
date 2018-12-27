<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.io.*" %>
<%@ page import="thinkonweb.util.ConnectionContext" %>
<%@ page import="java.sql.*" %>
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
	ResultSet rs;
	String requestBuf[] = request.getParameterValues("ticket");
	String Date, Time, Seat;
	int Start, End;
	String buf;
	for(int i = 0 ; i < requestBuf.length ; i++)
	{
		Date = requestBuf[i].substring(0,2);
		Time = requestBuf[i].substring(2,6);
		Start = Integer.parseInt(requestBuf[i].substring(6,7));
		End = Integer.parseInt(requestBuf[i].substring(7,8));
		Seat = requestBuf[i].substring(8);	
		buf = "DELETE FROM User_Ticket WHERE Date = '"+Date+"' AND Time = '"+Time+"' AND Start =  "+Start+" AND End = "+End+" AND Seat = '"+Seat+"';";
		stmt.executeUpdate(buf);
		if(Time.equals("1200"))
		{
			buf = "DELETE FROM Train_0 WHERE Date = '"+Date+"' AND Time = '"+Time+"' AND Seat = '"+Seat+"';";
			stmt.executeUpdate(buf);
		}
		else if(Time.equals("1300"))
		{
			buf = "DELETE FROM Train_1 WHERE Date = '"+Date+"' AND Time = '"+Time+"' AND Seat = '"+Seat+"';";
			stmt.executeUpdate(buf);
		}
		else if(Time.equals("1800"))
		{
			buf = "DELETE FROM Train_2 WHERE Date = '"+Date+"' AND Time = '"+Time+"' AND Seat = '"+Seat+"';";	
			stmt.executeUpdate(buf);
		}
		else if(Time.equals("1900"))
		{
			buf = "DELETE FROM Train_3 WHERE Date = '"+Date+"' AND Time = '"+Time+"' AND Seat = '"+Seat+"';";	
			stmt.executeUpdate(buf);
		}
		
		if(Start < End)
		{
			for(int j = Start ; j <= End ; j++)
			{
				buf = "SELECT * FROM station_"+j+" WHERE Date = '"+Date+"' AND Time = '"+Time+"' AND End = '5';";
				rs = stmt.executeQuery(buf);
				rs.next();				
				buf = "UPDATE station_"+j+" Set Remain = "+(Integer.parseInt(rs.getString("Remain"))+1)+" WHERE Date = '"+Date+"' AND Time = '"+Time+"' AND End = '5';";
				stmt.executeUpdate(buf);
				rs.close();
			}
		}
		else
		{
			for(int j = Start ; j >= End ; j--)
			{
				buf = "SELECT * FROM station_"+j+" WHERE Date = '"+Date+"' AND Time = '"+Time+"' AND End = '0';";
				rs = stmt.executeQuery(buf);
				rs.next();				
				buf = "UPDATE station_"+j+" Set Remain = "+(Integer.parseInt(rs.getString("Remain"))+1)+" WHERE Date = '"+Date+"' AND Time = '"+Time+"' AND End = '5';";
				stmt.executeUpdate(buf);
				rs.close();
			}
		}		
	}
	
%>
</body>
</html>