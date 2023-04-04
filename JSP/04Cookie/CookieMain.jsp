<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie</title>
</head>
<body>
	<h2>Cookie setting</h2>
<%
	Cookie c = new Cookie("cookie","뉴진스");//쿠키 객체 생성
	c.setPath(request.getContextPath());//쿠키의 적용 경로 설정
	c.setMaxAge(3600); //쿠키의 유지 기간을 설정   초 단위로 들어감 3600(1시간)
	response.addCookie(c);//응답 헤더 쿠키를 추가
%>
	<h2>쿠키 설정 후 쿠키값 확인</h2>
<%
	Cookie[] cookies = request.getCookies(); //요청 헤더에서 모든 쿠기를 얻기
	if(cookies!=null){
		for(Cookie co:cookies){
			String cName =  co.getName();
			String cVal = co.getValue();
			out.println(String.format("%s : %s<br>",cName,cVal));
		}
	}
%>

	<h2>페이지 이동 후 확인</h2>
	<a href="CookieMove.jsp">페이지 이동</a>
</body>
</html>