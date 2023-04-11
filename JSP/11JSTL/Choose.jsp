<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Core Choose</title>
</head>
<body>
	<c:set var="num" value="99"/>
	<h4>Choose</h4>
	<c:choose>
		<c:when test="${num mod 2 eq 0}">
			${num}은 짝수다!
		</c:when>
		<c:otherwise>
			${num}은 홀수다!
		</c:otherwise>
	</c:choose> 
	
	<h4>영어,수학,과학 점수를 입력받아서 평균을 구하고 학점을 출력</h4>
	<!-- 90이상 수, 80 우, 70 미, 60 양, 50 가 -->
	<form>
		영어:<input type="number" name="eng" min="0" max="100"/><br>
		수학:<input type="number" name="math" min="0" max="100"/><br>
		과학:<input type="number" name="sci" min="0" max="100"/><br>
		<input type="submit" value="학점 구하기">
	</form>
	<c:set var="avg" value="${(param.eng+param.math+param.sci)/3}"/>
	평균: ${avg, '#.##0.00'}
	<c:choose>
		<c:when test="${avg ge 90}">
			수!
		</c:when>
		<c:when test="${avg ge 80}">
			우!
		</c:when>
		<c:when test="${avg ge 70}">
			미!
		</c:when>
		<c:when test="${avg ge 60}">
			양!
		</c:when>
		<c:otherwise>
			가!
		</c:otherwise>
	</c:choose>
</body>
</html>