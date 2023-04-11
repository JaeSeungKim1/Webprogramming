<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="common.Person" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Core Set</title>
</head>
<body>
	<c:set var="aVar" value="200"/>
	<c:set var="elVar" value="${aVar mod 7}"/>
	<c:set var="expVar" value="<%= new Date()%>"/>
	<c:set var="tagVar">태그 내 설정</c:set>
	
	<h3>변수 출력</h3>	
	${pageScope.aVar}<br>${elVar}<br>${expVar}<br>${tagVar}
	
	<h4>자바 빈즈 생성자 사용</h4>
	<c:set var="personVar1" value='<%=new Person("kong",26)%>' scope="request"/> 
	<!-- 왜 큰 따옴표 하면 오류나는거여 작은 따옴표 치면 오류 안나고 -->
	<ul>
		<li>이름: ${requestScope.personVar1.name}</li>
		<li>나이: ${personVar1.age}</li>
	</ul>
	<h4>자바 빈즈 target, property 사용</h4>
	<c:set var="personVar2" value="<%=new Person()%>" scope="request"/>
	<c:set target="${personVar2}" property="name" value="정약용"/>
	<c:set target="${personVar2}" property="age" value="60"/>
	<ul>
		<li>이름: ${requestScope.personVar2.name}</li>
		<li>나이: ${personVar2.age}</li>
	</ul>
	<h2>List</h2>
	<%
		ArrayList<Person> pList = new ArrayList<>();
		pList.add(new Person("james",55));
		pList.add(new Person("william",60));	
	%>
	<c:set var="personList" value="<%=pList%>" scope="request"/>
	<ul>
		<li>이름: ${requestScope.personList[0].name}</li>
		<li>나이: ${personList[0].age}</li>
	</ul>
	
	<h4>Map</h4>
	<%
		Map<String,Person> map = new HashMap<>();
		map.put("personArgs1", new Person("superman",65));
		map.put("personArgs2", new Person("batman",50));
	%>
	<c:set var="personMap" value="<%=map%>" scope="request"/>
	<ul>
		<li>이름: ${requestScope.personMap.personArgs2.name}</li>
		<li>나이: ${personMap.personArgs2.age}</li>
	</ul>
</body>
</html>