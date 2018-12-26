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
	String buf;
	int i, j, k, today, next_day, next_next_day;
	
	today = 25;
	next_day = 26;
	next_next_day = 27;
	
	for(i = 0 ; i < 6 ; i++)
	{
		buf = "DROP TABLE station_"+i+";";
		stmt.executeUpdate(buf);
		buf = "CREATE TABLE station_"+i+"(Train char(10), Date char(10), Time char(10), Remain char(10), End char(10));";
		stmt.executeUpdate(buf);
	}
	
	for(i = 0 ; i < 4 ; i++)
	{
		buf = "DROP TABLE Train_"+i+";";
		stmt.executeUpdate(buf);
		buf = "CREATE TABLE Train_"+i+"(Date char(10), Time char(10), Start char(10), End char(10)";
		buf += ", A0 char(20), A1 char(20), A2 char(20), A3 char(20)";
		buf += ", B0 char(20), B1 char(20), B2 char(20), B3 char(20)";
		buf += ", C0 char(20), C1 char(20), C2 char(20), C3 char(20)";
		buf += ", D0 char(20), D1 char(20), D2 char(20), D3 char(20));";
		stmt.executeUpdate(buf);
	}
	
	buf = "DROP TABLE User_Ticket;";
	stmt.executeUpdate(buf);
	buf = "CREATE TABLE User_Ticket(Id char(20), Date char(10), Time char(10), Start char(10), End char(10));";
	stmt.executeUpdate(buf);
	
	for(i = 0 ; i <6 ; i++)
	{
		for(j = today ; j <= next_next_day ; j++)
		{
			buf = "INSERT INTO station_"+i+"(Train, Date, Time, Remain, End) VALUES('0','"+j+"','1200','16','5');";
			stmt.executeUpdate(buf);
			buf = "INSERT INTO station_"+i+"(Train, Date, Time, Remain, End) VALUES('1','"+j+"','1300','16','0');";
			stmt.executeUpdate(buf);
			buf = "INSERT INTO station_"+i+"(Train, Date, Time, Remain, End) VALUES('2','"+j+"','1800','16','5');";
			stmt.executeUpdate(buf);
			buf = "INSERT INTO station_"+i+"(Train, Date, Time, Remain, End) VALUES('3','"+j+"','1900','16','0');";
			stmt.executeUpdate(buf);
		}
	}
	
	for(i = 0 ; i < 4 ; i++)
	{
		for(j = today ; j <= next_next_day ; j++)
		{
			if(i == 0 || i == 2)
			{
				for(k = 0 ; k < 5 ; k++)
				{
					buf = "INSERT INTO Train_"+i+"(Date, Time, Start, End) VALUES('"+j+"','1200','"+k+"','5')";
					stmt.executeUpdate(buf);
				}
			}
			else
			{
				for(k = 5 ; k > 0 ; k--)
				{
					buf = "INSERT INTO Train_"+i+"(Date, Time, Start, End) VALUES('"+j+"','1200','"+k+"','0')";
					stmt.executeUpdate(buf);
				}
			}
		}
	}
%>
</body>
</html>














