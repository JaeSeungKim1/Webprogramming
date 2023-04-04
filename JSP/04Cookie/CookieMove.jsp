<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 확인</title>
</head>
<body>
	<h2>쿠키 값 확인</h2>
<%
	Cookie[] cookies = request.getCookies();
	if(cookies!=null){
		for(Cookie co:cookies){
			String cName =  co.getName();
			String cVal = co.getValue();
			out.println(String.format("%s : %s<br>",cName,cVal));
		}
	}	
%>
</body>
</html>