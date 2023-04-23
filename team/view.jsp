<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DTO.BoardDTO" %>
<%
	BoardDTO board = (BoardDTO)request.getAttribute("board data");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table cellpadding="0" cellspacting="0">
	<tr align="center" valign="middle">
		<td colspan="5">게시판</td>
	</tr>
	
	<tr>
		<td style="font-family:돋음; font-size:12">
		<div align="center">제목&nbsp;&nbsp;</div>
		</td>
			
		<td style="font-family:돋음; font-size:12">
		<%=board.getBoard_Subject() %>
		</td>	
	</tr>
	
	<tr bgcolor="cccccc">
		<td colspan="2" style="height:1px;">
		</td>
	</tr>
	
	<tr>
		<td style="font-family:돋음;font-size:12">
			<div align="center">내 용</div>
		</td>
		<td style="font-family:돋음;font-size:12">
			<table border=0 width=490 height=250 style="table-layout:fixed">
				<tr>
					<td valign=top style="font-family:돋음;font-size:12">
					<%=board.getBoard_Content() %>
					</td>
				</tr>
			</table>		
	</tr>
	<tr>
		<td style="font-family:돋음;font-size:12">
			<div align="center">첨부파일</div>
		</td>
		<td style="font-family:돋음;font-size:12">
		<%if(!(board.getBoard_File()==null)){ %>
		<a href="./boardupload/<%=board.getBoard_File() %>">
			<%=board.getBoard_File() %>
		</a>					
		<%} %>
		</td>
	</tr>
	
	<tr bgcolor="cccccc">
		<td colspan="2">&nbsp;</td>
	</tr>
	<tr><td colspan="2">&nbsp;</td></tr>
	
	<tr align="center" valign="middle">
		<td colspan="5">
			<font size=2>
			<a href="./BoardReplyAction.do?num=<%=board.getBoard_Num() %>">
			[수정]
			</a>&nbsp;&nbsp;
			<a href="./BoardDelet.do?num=<%=board.getBoard_Num() %>">
			[삭제]
			</a>&nbsp;&nbsp;
			<a href="./BoardList.do?num=<%=board.getBoard_Num() %>">
			[목록]
			</a>&nbsp;&nbsp;
			</font>	
</table>

</body>
</html>