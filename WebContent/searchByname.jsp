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
   String id = (String)session.getAttribute("myId");
   if(id == null)
   {               
%>
<script language = "JavaScript">
alert("please login first");
location.replace("login.jsp");
</script>
<%
   }
   else
   {
      Connection conn = ConnectionContext.getConnection();
      Statement stmt = conn.createStatement();
      String buf = "SELECT * FROM User WHERE Id = '"+id+"';";
      String strBuf;
      ResultSet rs = stmt.executeQuery(buf);
      rs.next();
       
      String password = rs.getString("Password");
      String name = rs.getString("Name");
      String age = rs.getString("Age");
      String gender = rs.getString("Gender");
      rs.close();
      strBuf = "id : "+id+"<br/>";
      strBuf += "name : "+name+"<br/>";
      strBuf += "password :"+password+"<br/>";
      strBuf += "age : "+age+"<br/>";
      strBuf += "gender : "+gender+"<br/>";
      
      buf = "SELECT * FROM User_Ticket WHERE Id = '"+id+"';";
      rs = stmt.executeQuery(buf);
      strBuf += "Tickets <br/>";
      strBuf += "<form name = 'ticketCancel' action = 'cancelProcess.jsp' method = 'post'>";
      while(rs.next())
      {
    	 strBuf += "<input type = 'checkbox' name = 'ticket' value = '"+rs.getString("Date")+rs.getString("Time")+rs.getString("Start")+rs.getString("End")+rs.getString("Seat")+"'>";
         strBuf += "Date : "+rs.getString("Date");
         strBuf += "   Time : "+rs.getString("Time");
         strBuf += "   Start : "+rs.getString("Start");
         strBuf += "   End : "+rs.getString("End");
         strBuf += "   Seat : "+rs.getString("Seat")+"<br/>";
      }
      strBuf += "<input type = 'submit' name = 'submit' value = 'cancle'> <br/>";
      strBuf += "</form>";
      rs.close();
	  out.print(strBuf);
   }
   
%>
</body>
</html>







