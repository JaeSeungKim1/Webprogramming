package board3;

import javax.servlet.http.*;

import Servlet.ActionForward;

public interface Action {
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp)
	throws Exception;
}
