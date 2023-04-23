<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2 align="center">관리자 홈페이지</h2>
   
      <table border="1" width="50%" align="center">
      <c:forEach items="${memdelList}" var="list" varStatus="stat">
           <c:choose>
           <c:when test="${list.mem_Id eq list.pro_Host}">
           </c:when>
           <c:otherwise>
         <tr align="center">
           <td style="margin-top:500px;">
            ${list.mem_Name} 님 <button type="button" value="${list.mem_Id}" onclick="excludeMember(this.value,this.parentNode)" >제외</button>
            </td>           
         </tr>    
           </c:otherwise>
           </c:choose>
      </c:forEach>

      </table>
         
<script>
  function excludeMember(name,id) {
   
    $.ajax({
      url: '../pro/test.do',
      type: 'post',
      data: { name: name },
      success: function() {
        alert(name + ' 님이 프로젝트에서 제외되었습니다.');
        $(id).css('display', 'none');
      },
      error: function() {
       console.log(name);
       console.log(btn.type);
        alert('프로젝트에서 멤버를 제외하는 동안 오류가 발생했습니다.');
      }
    });
  }
</script>


</body>
</html>