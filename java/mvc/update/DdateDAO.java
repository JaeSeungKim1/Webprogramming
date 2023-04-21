package update;

import java.io.IOException;
import java.sql.*;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.JDBConnPool;


public class DdateDAO extends JDBConnPool  {
	
	public DdateDAO(String driver, String url, String uid, String upw) {
		super();
	}

	public void setDate(DdateDTO dto) {
		String sql = "select * from  start=?, end=?, WHERE id=?";
		
		try (
			PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setDate(1, dto.getStart());
			pstmt.setDate(2, dto.getEndDay());
			pstmt.setInt(3, dto.getId());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String startYear = request.getParameter("startYear");
	    String startMonth = request.getParameter("startMonth");
	    String startDay = request.getParameter("startDay");
	    String endYear = request.getParameter("endYear");
	    String endMonth = request.getParameter("endMonth");
	    String endDay = request.getParameter("endDay");

	    DdateDTO dto = new DdateDTO();
	    dto.setStart(Date.valueOf(startYear + "-" + startMonth + "-" + startDay));
	    dto.setEndDay(Date.valueOf(endYear + "-" + endMonth + "-" + endDay));
	    dto.setId(Integer.parseInt(request.getParameter("id")));

	    DdateDAO dao = new DdateDAO("com.mysql.jdbc.Driver", "jdbc:mysql://localhost:3306/mydb", "root", "root");
	    dao.setDate(dto);

	    RequestDispatcher dispatcher = request.getRequestDispatcher("updated.jsp");
	    dispatcher.forward(request, response);
	}
}