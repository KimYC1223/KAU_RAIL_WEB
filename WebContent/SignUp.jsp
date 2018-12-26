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

<form name = "signupForm" action="SignUpProcess.jsp" method="post" >
  <div  class="form-group">
    <label>ID</label>
    <input type="email" class="form-control" id="id" name = "id" placeholder="Enter email">
    <small id="idHelp" class="form-text text-muted"></small>
  </div>
  
	<div  class="form-group">
    <label>Password</label>
    <input type="email" class="form-control" id="id" name = "password" placeholder="Enter email">
    <small id="idHelp" class="form-text text-muted"></small>
  </div>
  
  <div  class="form-group">
    <label>ID</label>
    <input type="email" class="form-control" id="id" name = "name" placeholder="Enter email">
    <small id="idHelp" class="form-text text-muted"></small>
  </div>
  
  <div  class="form-group">
    <label>ID</label>
    <input type="number" class="form-control" id="id" name = "age" placeholder="Enter email">
    <small id="idHelp" class="form-text text-muted"></small>
  </div>
  
  <div  class="form-group">
    <label>ID</label>
    <input type="email" class="form-control" id="id" name = "id" placeholder="Enter email">
    <small id="idHelp" class="form-text text-muted"></small>
  </div>

  <button type="submit" class="btn btn-primary">Submit</button>
</form>


<form>
	ID :       <input type = "text" name = "id"> <br/>
	Password : <input type = "text" name = "password"> <br/>
	Name :     <input type = "text" name = "name"> <br/>
	age :      <input type = "text" name = "age"> <br/>
	Gender :   <input type = "text" name = "gender"> <br/>
	<input type = "submit" name = "submit" value = "submit"> <br/>
</form>
</body>
</html></html>