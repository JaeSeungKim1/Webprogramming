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
        alert(name + ' ���� ������Ʈ���� ���ܵǾ����ϴ�.');
        $(id).css('display', 'none');
      },
      error: function() {
    	console.log(name);
    	console.log(btn.type);
        alert('������Ʈ���� ����� �����ϴ� ���� ������ �߻��߽��ϴ�.');
      }
    });
  }
</script>
</head>
<body>
	<h2>������ Ȩ������</h2>
	
	<form method="post" action="SendProcess.jsp">
		<table border="1" style="width:400px; height:400px;">
		<tr>
  			<td id="1">
   			����� �� <input type="button" value="������Ʈ���� ���ܽ�Ű��" onclick="excludeMember(this.value,this.parentNode)" />
  			</td>
		</tr>
		<tr>
  			<td id="2">
   			������ �� <input type="button" id="2" value="������" onclick="excludeMember(this.value,this.parentNode)" />
 		 	</td>
		</tr>
		<tr>
  			<td id="3">
    		���±� �� <input type="button" value="������Ʈ���� ���ܽ�Ű��" onclick="excludeMember(this.value,this.parentNode)" />
  			</td>
		</tr>
		<tr>
 			 <td id="4">
   			������ �� <input type="button" value="������Ʈ���� ���ܽ�Ű��" onclick="excludeMember(this.value,this.parentNode)" />
 			 </td>
		</tr>
		<tr>
 			 <td id="5">
   			����� �� <input type="button" value="������Ʈ���� ���ܽ�Ű��" onclick="excludeMember(this.value,this.parentNode)" />
 			 </td>
		</tr>
		<tr>
 			 <td id="6">
   			������ �� <input type="button" value="������Ʈ���� ���ܽ�Ű��" onclick="excludeMember(this.value,this.parentNode)" />
 			 </td>
		</tr>
		
		</table>
	</form>
</body>
</html>