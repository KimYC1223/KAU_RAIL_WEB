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
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	int recordCount;
	ResultSet rs;
	
	buf = "SELECT count(*) AS recordCount FROM User WHERE Id = '"+id+"';";
	rs = stmt.executeQuery(buf);
	rs.next();
	recordCount = rs.getInt("recordCount");
	rs.close();
	if(recordCount != 1)
	{
%>
<script language = "JavaScript">
alert("아이디를 확인하세요.");
location.replace("login.jsp");
</script>
<%
	}
	else
	{
		buf = "SELECT * FROM User WHERE Id = '"+id+"';";
		rs = stmt.executeQuery(buf);
		rs.next();
		if(rs.getString("Password").equals(password))
		{
			session.setAttribute("myId", id);
			rs.close();
%>
<script language = "JavaScript">
alert("로그인 성공!!");
location.replace("index.jsp");
</script>
<%
		}
		else
		{
%>
<script language = "JavaScript">
alert("비밀번호를 확인하세요.");
location.replace("login.jsp");
<%			
		}
	}	
%>
</body>
</html>