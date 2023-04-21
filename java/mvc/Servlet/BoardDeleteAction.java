package Servlet;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Board.BoardDAO;
import board3.Action;

public class BoardDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		ActionForward forward = new ActionForward();
		req.setCharacterEncoding("UTF-8");
		
		boolean result = false;
		boolean usercheck = false;
		int num = Integer.parseInt(req.getParameter("num"));
		
		BoardDAO dao = new BoardDAO();
		usercheck = dao.isBoardWriter(num,req.getParameter("Board_Pass"));
		
		if(usercheck==false) {
			resp.setContentType("text/html;charset=UTF-8");
			PrintWriter out = resp.getWriter();
			out.println("<script>");
			out.println("alert('삭제할 권한이 없습니다.');");
			out.println("location.href='../Team/List.do';");
			out.println("</script>");
			out.close();
			
			return null;			
		}
		result = dao.boardDelete(num);
		if(result == false) {
			System.out.println("게시판 삭제 실패");
			return null;
		}
		System.out.println("게시판 삭제 성공");
		forward.setRedirect(true);
		forward.setPath("../Team/list.do");
		return forward;
	}

}
