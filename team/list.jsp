<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="DTO.BoardDTO" %>
<%
	List boardList = (List)request.getAttribute("boardlist");
	int listcount = ((Integer)request.getAttribute("listcount"));
	int nowpage=((Integer)request.getAttribute("page")).intValue();
	int maxpage=((Integer)request.getAttribute("maxpage")).intValue();
	int startpage=((Integer)request.getAttribute("startpage")).intValue();
	int endpage =((Integer)request.getAttribute("endpage")).intValue();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table width=50% border="0" cellpadding="0" cellspacing="0">
	<tr align="center valign=middle">
		<td colspan="4">게시판</td>
		<td align=right>
		<font size=2>글 개수:${listcount}</font>
		</td>
	</tr>
	
	<tr align="center" valign="middle" bordercolor="#333333">	
		<td style="font-family:Tahoma; font-size:8pt;" width="8%" height="26">
			<div align="center">번호</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="50%">
			<div align="center">작성자</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="17%">
			<div align="center">날짜</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="11%">
			<div align="center">조회수</div>
		</td>
	</tr>
	
	<%
		for(int i=0;i<boardList.size();i++) {
			BoardDTO bl = (BoardDTO)boardList.get(i);
	%>
	<tr align="center" valign="middle" bordercolor="#333333"
		onmouseover="this.style.backgroundColor='F8F8F8'"
		onmouseout="this.style.backgroundColor=">
		<td height="23" style="font-family:Tahoma;font-size:10pt;">
			<%=bl.getBoard_Num()%>
		</td>
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="left">
			<%if(bl.getBoard_Re_Lev()!=0){ %>
				<%for(int a=0;a<=bl.getBoard_Re_Lev()*2;a++) { %>
					&nbsp;
					<%} %>
					▶
					<%}else{ %>
					▶
					<%} %>
					<a href="./BoardDetailAction.do?num=<%=bl.getBoard_Num()%>">
						<%=bl.getBoard_Subject() %>
					</a>
			</div>
		</td>
		
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center"><%=bl.getBoard_Name() %>
			</div>
		</td>	
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center"><%=bl.getBoard_Date() %>
			</div>
		</td>
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center"><%=bl.getBoard_Visitcount() %>
			</div>
		</td>
	</tr>					
	<%} %>	
	<tr align=center height=20>
		<td colspan=7 style=font-family:Tahoma;font-size:10pt>
			<%if(nowpage<=1) {%>
			[이전]&nbsp;
			<%}else{ %>
			<a href="./BoardList.do?page<%=nowpage-1 %>">[이전]</a>&nbsp;
			<%} %>
			
			<% for(int a=startpage;a<=endpage;a++){
				if(a==nowpage){%>
				[<%=a %>]
				<%}else{ %>
				<a href="./BoardList.do?page=<%=a %>">[<%=a %>]</a>&nbsp;
				<% }%>
				<%} %>
			
				<%if(nowpage>=maxpage){ %>
				[다음]
				<%}else{ %>
				<a href="./BoardList.do?page<%=nowpage+1 %>">[다음]</a>
					<%} %>
		</td>
	</tr>	
	<tr align="right">
		<td colspan="5">
			<a href="./BoardWrite.do">[글쓰기]</a>	
		</td>			
	</tr>
</table>
</body>
</html>