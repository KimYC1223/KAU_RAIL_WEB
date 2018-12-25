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
<form name = "signupForm" action="SignUpProcess.jsp" method="post">
	ID :       <input type = "text" name = "id"> <br/>
	Password : <input type = "text" name = "password"> <br/>
	Name :     <input type = "text" name = "name"> <br/>
	age :      <input type = "text" name = "age"> <br/>
	Gender :   <input type = "text" name = "gender"> <br/>
	<input type = "submit" name = "submit" value = "submit"> <br/>
</form>
</body>
</html></html>