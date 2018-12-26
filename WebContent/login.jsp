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
login
<form name = "login_form" action = "loginProcess.jsp" method = "post">
id : <input type = "text" name = "id"> <br/>
password : <input type = "password" name = "password"> <br/>
<input type = "submit" name = "submit" value = "login"> <br/>
</form>
</body>
</html>