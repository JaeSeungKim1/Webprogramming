package Servlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Board.BoardDAO;
import DTO.BoardDTO;
import board3.Action;

public class BoardModifyView implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		ActionForward forward = new ActionForward();
		req.setCharacterEncoding("euc-kr");
		
		BoardDAO dao = new BoardDAO();
		BoardDTO dto = new BoardDTO();
		
		int num = Integer.parseInt(req.getParameter("num"));
		dto = dao.getDetail(num);
		
		if(dto==null) {
			System.out.println("(수정)상세보기 실패");
		}
		System.out.println("(수정)상세보기 성공");
		
		req.setAttribute("dto", dto);
		forward.setRedirect(false);
		forward.setPath("../Team/modify.jsp");
		
		return forward;
	}

}
