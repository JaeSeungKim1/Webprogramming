package Servlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Board.BoardDAO;
import DTO.BoardDTO;
import board3.Action;

public class BoardReplyAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		ActionForward forward = new ActionForward();
		
		BoardDAO dao = new BoardDAO();
		BoardDTO dto = new BoardDTO();
		
		int result = 0;
		
		dto.setBoard_Num(Integer.parseInt(req.getParameter("Board_Num")));
		dto.setBoard_Content(req.getParameter("Board_Content"));
		dto.setBoard_Pass(req.getParameter("Board_Pass"));
		dto.setBoard_Name(req.getParameter("Board_Name"));
		dto.setBoard_Subject(req.getParameter("Board_Subject"));
		dto.setBoard_Re_Ref(Integer.parseInt("Board_Re_Ref"));
		dto.setBoard_Re_Seq(Integer.parseInt(req.getParameter("Board_Re_Seq")));
		dto.setBoard_Re_Lev(Integer.parseInt("Board_Re_Lev"));
		
		result = dao.boardReply(dto);
		if(result==0) {
			System.out.println("답장 실패");
			return null;
		}
		System.out.println("답장 완료");
		
		forward.setRedirect(true);
		forward.setPath("/BoardDetailAction.do?num="+result);
		
		return forward;
		
	}

}
