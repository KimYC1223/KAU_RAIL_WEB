<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.io.*" %>
<%@ page import="thinkonweb.util.ConnectionContext" %>
<%@ page import="java.sql.*" %>
<%!
String strBuf = null;
int departure, destination, personnel;
%>
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
	String dataBuf, Train, Train_Time, Train_Date;
	departure = Integer.parseInt((String)session.getAttribute("departure"));
	destination = Integer.parseInt((String)session.getAttribute("destination"));
	personnel = Integer.parseInt((String)session.getAttribute("personnel"));
	
%>
<script language = "JavaScript">
var maxChecked = <%=personnel%>;   //선택가능한 체크박스 갯수
var totalChecked = 0; // 설정 끝
var strInfo;

function CountChecked(field) 
{
    if (field.checked) // input check 박스가 체크되면 
        totalChecked += 1; // totalChecked 증가
    else // 체크가 아니면
        totalChecked -= 1; // totalChecked 감소

    if (totalChecked > maxChecked) 
    { // totalchecked 수가 maxchecked수보다 크다면
    	strInfo = "최대 "+<%=personnel%>+"개 까지만 가능합니다.";
        alert (strInfo); // 팝업창 띄움
    	field.checked = false;
    	totalChecked -= 1;
    }  
}

function personCheck(form_seat)
{
	var count = 0;
	var strInfo;
	
	for(var i = 0 ; i < 16 ; i++)
		if(form_seat.seat[i].checked) count++;
	if(count != <%=personnel%>)
	{
		alert("Check all people");
		return false;
	}
}
</script>
<%
	dataBuf = request.getParameter("train");
	Train = dataBuf.substring(0,1);	
	Train_Date = dataBuf.substring(1,3);
	Train_Time = dataBuf.substring(3);
	session.setAttribute("Train", Train);
	session.setAttribute("Train_Date", Train_Date);
	session.setAttribute("Train_Time", Train_Time);
	
	String buf = "SELECT * FROM Train_"+ Train + " WHERE Date = "+Train_Date+" AND Time = "+Train_Time+" AND Start = "+departure+";";
	ResultSet rs = stmt.executeQuery(buf);
	strBuf = "<form name = 'form_seat' action = 'reservation_finish.jsp' method = 'post'>";
	while(rs.next())
	{
		if(rs.getString("A0") == null) strBuf += "<input type = 'checkbox' name = 'seat' value = 'A0' onClick = 'CountChecked(this)'> A0 <br/>";
		if(rs.getString("A1") == null) strBuf += "<input type = 'checkbox' name = 'seat' value = 'A1' onClick = 'CountChecked(this)'> A1 <br/>";
		if(rs.getString("A2") == null) strBuf += "<input type = 'checkbox' name = 'seat' value = 'A2' onClick = 'CountChecked(this)'> A2 <br/>";
		if(rs.getString("A3") == null) strBuf += "<input type = 'checkbox' name = 'seat' value = 'A3' onClick = 'CountChecked(this)'> A3 <br/>";
		if(rs.getString("B0") == null) strBuf += "<input type = 'checkbox' name = 'seat' value = 'B0' onClick = 'CountChecked(this)'> B0 <br/>";
		if(rs.getString("B1") == null) strBuf += "<input type = 'checkbox' name = 'seat' value = 'B1' onClick = 'CountChecked(this)'> B1 <br/>";
		if(rs.getString("B2") == null) strBuf += "<input type = 'checkbox' name = 'seat' value = 'B2' onClick = 'CountChecked(this)'> B2 <br/>";
		if(rs.getString("B3") == null) strBuf += "<input type = 'checkbox' name = 'seat' value = 'B3' onClick = 'CountChecked(this)'> B3 <br/>";
		if(rs.getString("C0") == null) strBuf += "<input type = 'checkbox' name = 'seat' value = 'C0' onClick = 'CountChecked(this)'> C0 <br/>";
		if(rs.getString("C1") == null) strBuf += "<input type = 'checkbox' name = 'seat' value = 'C1' onClick = 'CountChecked(this)'> C1 <br/>";
		if(rs.getString("C2") == null) strBuf += "<input type = 'checkbox' name = 'seat' value = 'C2' onClick = 'CountChecked(this)'> C2 <br/>";
		if(rs.getString("C3") == null) strBuf += "<input type = 'checkbox' name = 'seat' value = 'C3' onClick = 'CountChecked(this)'> C3 <br/>";
		if(rs.getString("D0") == null) strBuf += "<input type = 'checkbox' name = 'seat' value = 'D0' onClick = 'CountChecked(this)'> D0 <br/>";
		if(rs.getString("D1") == null) strBuf += "<input type = 'checkbox' name = 'seat' value = 'D1' onClick = 'CountChecked(this)'> D1 <br/>";
		if(rs.getString("D2") == null) strBuf += "<input type = 'checkbox' name = 'seat' value = 'D2' onClick = 'CountChecked(this)'> D2 <br/>";
		if(rs.getString("D3") == null) strBuf += "<input type = 'checkbox' name = 'seat' value = 'D3' onClick = 'CountChecked(this)'> D3 <br/>";
	}
	strBuf += "<input type = 'submit' name = 'submit' value = 'submit' onClick = 'return personCheck(form_seat)'> <br/>";
	strBuf += "</form>";
	out.println(strBuf);
%>
</body>
</html>