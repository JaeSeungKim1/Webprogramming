<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String popupMode="on";

	Cookie[] cookies = request.getCookies();
	if(cookies!=null){
		for(Cookie c:cookies){
			String cName=c.getName();
			if(cName.equals("popupMode")){
				popupMode=c.getValue();
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팝업창 관리</title>
<style>
	#popup{
		position : absolute; top:100px; left:50px;
		color:yellow; width:270px; height:100px; background-color:gray;
	}
	#popup>div{
		position:relative; background-color:white; top:0px;
		border:1px solid gray; padding:10px; color:black;
	}
		
</style>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity></script>
<script>
$(function(){
	 $("#closeBtn").click(function(){
	        $("#popup").hide();
	        //쿠키 설정(하루동안 볼지 안볼지 설정하는 것)
	        var chk = $('#inactiveToday:checked').val();
	        if(chk=='1'){
	        	//외부에서 실행하게 해주는 것 ajax 
	        	//이 안에서 cookie를 실행하면 그것을 먼저 실행해서 값을 날려버린 상태에서 실행하기 때문에 무의미
	        	$.ajax({
	        		url:'./PopupCookie.jsp',
	        			type : 'get',
	        			data : {inective:chk},
	        			datatype:'text',
	        			success : function(resData){
	        				if(resData!=''){
	        					console.log(resData);
	        					location.reload();
	        				}
	        			}
	        	});
	        }
	    });
});
</script>
</head>
<body>
	<h2>팝업 메인 페이지</h2>
<%
	if(popupMode.equals("on")){
%>
	<div id="popup">
		<h2 align="center">공지사항</h2>
		<div align="right">
			<form name="popform">
				<input type="checkbox" id="inactiveToday" value="1"/>
				하루동안 안 열기
				<input type="button" value="닫기" id="closeBtn"/>		
			</form>
		</div>
	</div>
<%
	}
%>
</body>
</html>