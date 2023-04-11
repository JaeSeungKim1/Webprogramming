<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="scopeVar" value="Page value" />
<c:set var="scopeVar" value="Request value" scope="request"/>
<c:set var="scopeVar" value="Session Value" scope="session"/>
<c:set var="scopeVar" value="Application Value" scope="application"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Core Remove</title>
</head>
<body>
	<ul>
		<li>scopeVar: ${scopeVar}</li>
		<li>requestScope.scopeVar: ${requestScope.scopeVar}</li>
		<li>sessionScope.scopeVar: ${sessionScope.scopeVar}</li>
		<li>applicationScope.scopeVar: ${applicationScope.scopeVar}</li>
	</ul>
	<c:remove var="scopeVar" scope="session"/> <!-- 세션영역만 지워짐 -->
	<ul>
		<li>scopeVar: ${scopeVar}</li>
		<li>requestScope.scopeVar: ${requestScope.scopeVar}</li>
		<li>sessionScope.scopeVar: ${sessionScope.scopeVar}</li>
		<li>applicationScope.scopeVar: ${applicationScope.scopeVar}</li>
	</ul>
	<c:remove var="scopeVar"/><!-- 싹다 지워짐 -->
	<ul>
		<li>scopeVar: ${scopeVar}</li>
		<li>requestScope.scopeVar: ${requestScope.scopeVar}</li>
		<li>sessionScope.scopeVar: ${sessionScope.scopeVar}</li>
		<li>applicationScope.scopeVar: ${applicationScope.scopeVar}</li>
	</ul>
</body>
</html>