<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    buffer="none" autoFlush="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>buffer 지시어</title>
</head>
<body>
<%
	for(int i=1;i<100;i++) {
		out.println("print repeat"+i);
	}
%>
</body>
</html>