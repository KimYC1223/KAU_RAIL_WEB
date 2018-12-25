<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.io.*" %>
<%@ page import="thinkonweb.util.ConnectionContext" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script language = "JavaScript">

</script>
</head>
<body>
<form name = "form_2" action="reservationProcess.jsp" method="post">
인원수 : 	<select name = "personnel">
			<option value = "1"> 1 </option> 
			<option value = "2"> 2 </option> 
			<option value = "3"> 3 </option> 
			<option value = "4"> 4 </option>
			<option value = "5"> 5 </option>
		</select> <br/> 
	
출발   : 	<select name = "departure">
			<option value = "0"> 화전역 </option> 
			<option value = "1"> 화전 던전역 </option> 
			<option value = "2"> 화전 CU역 </option> 
			<option value = "3"> 테니스장역 </option>
			<option value = "4"> 과학관역 </option>
			<option value = "5"> 항트럴 파크역 </option>
		</select> <br/> 

도착   :   <select name = "destination">
			<option value = "0"> 화전역 </option> 
			<option value = "1"> 화전 던전역 </option> 
			<option value = "2"> 화전 CU역 </option> 
			<option value = "3"> 테니스장역 </option>
			<option value = "4"> 과학관역 </option>
			<option value = "5"> 항트럴 파크역 </option>
		</select> <br/>

<input type = "submit" name = "submit" value = "조회하기"> <br/>
</form>
</body>
</html>