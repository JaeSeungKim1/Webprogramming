<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    out.print("<h2>이것은 doc1.jsp의 내용입니다.</h2>");
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <jsp:include page="./Date.jsp" />
    <jsp:include page="./write.jsp" />
    <jsp:include page="./URL.jsp">    
        <jsp:param name="username" value="jsmith" />    
    </jsp:include>
</body>
</html>