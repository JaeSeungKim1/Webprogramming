package Servlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Board.BoardDAO;
import DTO.BoardDTO;
import board3.Action;

public class BoardDetailAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		
		BoardDAO dao = new BoardDAO();
		BoardDTO dto = new BoardDTO();
		
		int num = Integer.parseInt(req.getParameter("num"));
		dao.setReadCountUpdate(num);
		dto = dao.getDetail(num);
		
		if(dto==null) {
			System.out.println("상세보기 실패");
			return null;
		}
		System.out.println("상세보기 성공");
		
		req.setAttribute("dto", dto);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("../Team/view.jsp");
		
		return forward;
	}

}
