<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 // 아이디와 비밀번호 값이 맞는지 확인하기 위해 만들 폴더
<%@ page import="utils.ManageCookie" %>
<%@ page import="utils.AlertFunc" %>
<%
	String user_id = request.getParameter("user_id");
	user_id = user_id.trim(); //넣는 이유는 공백이 있는거 무시하기 위해서 
	String user_pw = request.getParameter("user_pw").trim();//이렇게 뒤에 .trim해서 사용해도 가능
	String save_check = request.getParameter("save_check");
	
	if("user".equals(user_id) && "1234".equals(user_pw)){
		//로그인 성공
		if(save_check != null && save_check.equals("Y")){
			ManageCookie.makeCookie(response, "loginId", user_id, 86400);
		}else{
			ManageCookie.deleteCookie(response, "loginId");
		}
		AlertFunc.alertLocation("로그인에 성공했습니다.","IdSaveMain.jsp",out);
%>
	<script>
		alert('로그인에 성공했습니다.');
		location.href='IdSaveMain.jsp';
	</script>
<%
	}else{
		//로그인 실패
		AlertFunc.alertBack("로그인에 실패했습니다.",out);
%>
	<script>
		alert('로그인에 실패했습니다.');
		history.back();
	</script>
<%		
	}
%> 