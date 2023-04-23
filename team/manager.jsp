<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
  function excludeMember(name,id) {
   
    $.ajax({
      url: '#',
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
</head>
<body>
	<h2>관리자 홈페이지</h2>
	
	<form method="post" action="SendProcess.jsp">
		<table border="1" style="width:400px; height:400px;">
		<tr>
  			<td id="1">
   			이재민 님 <input type="button" value="프로젝트에서 제외시키기" onclick="excludeMember(this.value,this.parentNode)" />
  			</td>
		</tr>
		<tr>
  			<td id="2">
   			강민정 님 <input type="button" id="2" value="강민정" onclick="excludeMember(this.value,this.parentNode)" />
 		 	</td>
		</tr>
		<tr>
  			<td id="3">
    		유태균 님 <input type="button" value="프로젝트에서 제외시키기" onclick="excludeMember(this.value,this.parentNode)" />
  			</td>
		</tr>
		<tr>
 			 <td id="4">
   			유재익 님 <input type="button" value="프로젝트에서 제외시키기" onclick="excludeMember(this.value,this.parentNode)" />
 			 </td>
		</tr>
		<tr>
 			 <td id="5">
   			김재승 님 <input type="button" value="프로젝트에서 제외시키기" onclick="excludeMember(this.value,this.parentNode)" />
 			 </td>
		</tr>
		<tr>
 			 <td id="6">
   			김지훈 님 <input type="button" value="프로젝트에서 제외시키기" onclick="excludeMember(this.value,this.parentNode)" />
 			 </td>
		</tr>
		
		</table>
	</form>
</body>
</html>