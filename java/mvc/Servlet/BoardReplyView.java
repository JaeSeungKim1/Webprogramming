package Servlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Board.BoardDAO;
import DTO.BoardDTO;
import board3.Action;

public class BoardReplyView implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		ActionForward forward =  new ActionForward();
		
		BoardDAO dao = new BoardDAO();
		BoardDTO dto =  new BoardDTO();
		
		int num = Integer.parseInt(req.getParameter("num"));
		
		dto = dao.getDetail(num);
		
		if(dto==null) {
			System.out.println("답장 페이지 이동 실패");
			return null;
		}
		System.out.println("답장 페이지 이동 완료");
		
		req.setAttribute("dto", dto);
		
		forward.setRedirect(false);
		forward.setPath("../Team/reply.jsp");
		return forward;
	}

}
