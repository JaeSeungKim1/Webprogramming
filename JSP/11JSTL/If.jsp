<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Core If</title>
</head>
<body>
	<c:set var="number" value="100"/>
	<c:set var="string" value="JSP"/>
	
	<c:if test="${number mod 2 eq 0}" var="result" scope="request"> <!-- 짝수 -->
		${number}는 짝수입니다.<br>
	</c:if>
	result:${result}<br>
	<c:if test="100">
		EL이 아닌 정수 지정 false
	</c:if>
	<c:if test="${string eq 'java'}" var="result2">
		문자열은 자바입니다.
	</c:if>
	<c:if test="${not result2}" var="result2">
		문자열은 자바입니다.
	</c:if>
	<c:if test="true" var="result3">
		"true"인 경우
	</c:if>
	<c:if test="TrUe" var="result3">
		"TrUe"인 경우
	</c:if>
	<c:if test="${ true }" var="result4">
		"TrUe"인 경우
	</c:if>
	result: ${result}<br>
	<c:if test="${string eq 'java'}">
		문자열은 자바입니다.<br>
	</c:if>
	<c:if test="${string eq 'JSP'}">
		문자열은 JSP입니다.<br>
	</c:if>
</body>
</html>