<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.io.*" %>
<%@ page import="thinkonweb.util.ConnectionContext" %>
<%@ page import="java.sql.*" %>

<%
	Connection conn = ConnectionContext.getConnection();
	Statement stmt = conn.createStatement();
	String buf = "SELECT count(*) AS recordCount FROM User where Id = " + "'" + request.getParameter("id") + "'"+";";
	try{
		out.println();
	ResultSet rs = stmt.executeQuery(buf);
	while(rs.next())
	{
		int recordCount = rs.getInt("recordCount");
		if(recordCount != 1)
		{
			PreparedStatement pstmt = conn.prepareStatement("INSERT INTO User(Id, Password, Name, Age, Gender) VALUES(?,?,?,?,?);");
			pstmt.setString(1,request.getParameter("id"));
			pstmt.setString(2,request.getParameter("password"));
			pstmt.setString(3,request.getParameter("name"));
			pstmt.setString(4,request.getParameter("age"));
			pstmt.setString(5,request.getParameter("gender"));
			pstmt.executeUpdate();
%>
<script language = "JavaScript">
alert("Sign Up Success");
location.replace("login.html")
</script>
<%			
		}
		else
		{		
%>
<script language="JavaScript">
alert("ID is already exist!!");
location.replace("SignUp.jsp")
</script>
<%
		}
	}
	}catch(Exception e){out.print(e.toString());}
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>