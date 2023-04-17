<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	var webSocket = new WebSocket("<%=application.getInitParameter("CHAT_ADDR")%>/ChatingServer");
	var chatWindow,chatMessage,chatId;
	//채팅창이 열리면 사용할 대화창,메시지 입력창, 대화명 표시란 DOM 객체 저장
	window.onload = function(){
		chatWindow = document.getElementById("chatWindow");
		chatMessage = document.getElementById("chatMessage");
		chatId = document.getElementById("chatId").value;
	} 
	//메시지 전송
	function sendMessage(){
		//대화창에 표시 
		chatWindow.innerHTML += "<div class='myMsg'>"+chatMessage.value+"</div>";
		webSocket.send(chatId+"|"+chatMessage.value);	//서버로 전송
		chatMessage.value="";	//메시지 입력창 초기화
		chatWindow.scrollTop=chatWindow.scrollHeight; //대화창 스크롤
		
	}
</script>
</body>
</html>