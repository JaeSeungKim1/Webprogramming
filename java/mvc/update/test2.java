package update;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/NewFile.do")
public class test2 extends HttpServlet {
@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	String startYear = req.getParameter("startYear");
	String startMonth = req.getParameter("startMonth");
	String startDay = req.getParameter("startDay");
	String endYear = req.getParameter("endYear");
	String endMonth = req.getParameter("endMonth");
	String endDay = req.getParameter("endDay");
	
	DdateDTO dto = new DdateDTO();
	
	
	String startDate = req.getParameter("startYear") + "-" + req.getParameter("startMonth") + "-" + req.getParameter("startDay");
	String endDate = req.getParameter("endYear") + "-" + req.getParameter("endMonth") + "-" + req.getParameter("endDay");
	dto.setP_no(startDate);
	dto.setD_date(endDate);
	DdateDAO dao = new DdateDAO();
	int res = dao.setDate(dto);
	req.getRequestDispatcher("../Team/Update.jsp");
	}
	
}

