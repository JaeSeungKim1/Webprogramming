package Servlet;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Board.BoardDAO;
import DTO.BoardDTO;
import board3.Action;

public class BoardModifyAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();
		boolean result = false;
		
		int num = Integer.parseInt(req.getParameter("Board_Num"));
		
		BoardDAO dao = new BoardDAO();
		BoardDTO dto = new BoardDTO();
		
		boolean usercheck = dao.isBoardWriter(num, req.getParameter("Board_Pass"));
		if(usercheck==false) {
			resp.setContentType("text/html;charset=euc-kr");
			PrintWriter out= resp.getWriter();
			out.println("<script>");
			out.println("alert('수정할 권한이 없습니다.');");
			out.println("location.href='../Team/List.do';");
			out.println("</script>");
			out.close();
			
			return null;
		}
		try {
			dto.setBoard_Num(num);
			dto.setBoard_Subject(req.getParameter("Board_Subject"));
			dto.setBoard_Content(req.getParameter("Board_Content"));
			
			
			result = dao.boardModify(dto);
			if(result==false) {
				System.out.println("게시판 수정 실패");
				return null;
			}
			System.out.println("게시판 수정 완료");
			
			forward.setRedirect(true);
			forward.setPath("/BoardDetailAction.do?num="+dto.getBoard_Num());
			return forward;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
