<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import = "board.BoardDTO" %>
 <%@ page import = "board.BoardDAO" %>
 <%@ page import = "java.util.List" %>
 <%@ page import = "java.util.Map" %>
 <%@ page import = "java.util.HashMap" %>
 <%@ page import = "utils.PagingUtil" %>
 <%
 	BoardDAO dao = new BoardDAO(application);
 	//dao의 목록을 쭉 불러올거다
 	//dao.connection
 	String findCol = request.getParameter("findCol");
 	String findWord = request.getParameter("findWord");
 	//Object로 넣은 이유는 여러가지를 넣을 수 있기 때문에 Object로 적음
 	Map<String,Object> param = new HashMap<String,Object>();
 	if(findWord!=null){
 		param.put("findCol",findCol);
 		param.put("findWord",findWord);
 	}
 	//페이징 처리를 위한 값
 	int totalCount = dao.getTotalCount(param);
 	int pageSize=Integer.parseInt(application.getInitParameter("PAGE_SIZE"));
 	int blockSize=Integer.parseInt(application.getInitParameter("PAGING_BLOCK"));
 	int totalPage=(int)Math.ceil((double)totalCount/pageSize);
 	//페이지 초기값 및 현재 페이지 값
 	int pageNum=1;
 	String pageTemp=request.getParameter("pageNum");
 	if(pageTemp!=null && !pageTemp.equals("")){
 		pageNum = Integer.parseInt(pageTemp);
 	}
 	//표시할 게시물의 시작과 끝 번호 값 계산
 	int start=(pageNum-1)*pageSize+1;
 	int end = pageNum*pageSize;
 	param.put("start", start);
 	param.put("end", end);
 	
 	List<BoardDTO> boardLists = dao.getListPage(param);
 	dao.close();
 	
 %>   
 	<!--이렇게 하면 가서 수정하고 해야하니까 한개의 값에 넣고 수정할 수 있게 만드는 것이 좋음
 	List<BoardDTO> boardLists = dao.getList(findCol,findWord);-->
 	
 	
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>목록</title>
</head>
<body>
	<jsp:include page="../common/Top.jsp"/> <!-- include를 불러오는 방법 -->
	<h2>목록 보기</h2>
	<!-- 검색 --> <!-- #을 씀으로서 자기 자신에게 돌아오게 함 -->
	<form action="#" method="get">
		<table border="1" width="90%">
			<tr>
				<td align="center">
					<select name="findCol">
						<option value="title">제목</option>
						<option value="content">내용</option>
					</select>
					<input type="text" name="findWord"/>
					<input type="submit" value="검색"/>
				</td>	
			</tr>
		</table>
	</form>
	<!-- 목록 -->
	<table border="1" width="90%">
		<tr>
			<th>번호</th><th>제목</th><th>작성자</th><th>조회수</th><th>작성일</th>
		</tr>
	<% 
		if(boardLists.isEmpty()){ //게시물 없는 경우
			
		
	%>
		<tr>
			<td colspan align = "center">등록된 게시물이 없습니다.</td>
		</tr>
	<% 
		}else{	//게시물 있는 경우
			for(BoardDTO dto:boardLists){
	%>
		<tr align = "center">
			<td align="center"><%=dto.getNum() %></td>
			<td align="left">
				<!-- 제목에 대한 값을 링크하면 넘어가기 위해 링크 걸어줌 -->
				<a href="View.jsp?num=<%=dto.getNum() %>"><%=dto.getTitle() %></a>			
			</td>
			<td align = "center"><%=dto.getId() %></td>
			<td align = "center"><%=dto.getVisitcount() %></td>
			<td align = "center"><%=dto.getPostdate() %></td>
		</tr>
	<%
			}
		}
	%>
	</table>
	<table border="1" width="90%">
	
		<tr align="center">
			<td>
				<%=PagingUtil.pagingBlock(totalCount, pageSize, blockSize, 
						pageNum, request.getRequestURI()) %>
			</td>
		</tr>
	</table>
	<br>		
	<div align="center">
		<button type="button" onclick="location.href='Write.jsp';">글쓰기</button>
	</div>
</body>
</html>