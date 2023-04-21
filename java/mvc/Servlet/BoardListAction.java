package Servlet;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.*;


import Board.BoardDAO;
import board3.Action;


public class BoardListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		BoardDAO dao = new BoardDAO();
		
		List boardlist = new ArrayList();
		int page=1;
		int limit = 10;
		
		if(req.getParameter("page")!=null) {
			page=Integer.parseInt(req.getParameter("page"));
		}
		int listcount = dao.getListCount();
		boardlist = dao.getBoardList(page, limit);
		int maxpage = (int)((double)listcount/limit+0.95);
		int startpage = (((int) ((double)page / 10+0.9))-1)*10+1;
		int endpage = maxpage;
		
		if(endpage>startpage+10-1) endpage = startpage+10-1;
		req.setAttribute("page", page);
		req.setAttribute("maxpage", maxpage);
		req.setAttribute("startpage", startpage);
		req.setAttribute("endpage", endpage);
		req.setAttribute("listcount", listcount);
		req.setAttribute("boardlist", boardlist);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("../Team/list.do");
		
		return forward;
	}

}
