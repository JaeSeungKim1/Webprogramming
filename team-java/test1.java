package update;

import java.sql.DriverManager;
import java.sql.SQLException;

import common.JDBConnPool;


public class test1 extends JDBConnPool {
    	public void readDataFromTable() {
    	    con = null;
    	    stmt = null;
    	    rs = null;
    	    String url = "jdbc:mysql://localhost:3306/mydb";
    	    String username = "jae";
    	    String password = "1234";
    	    
    	    try {
    	        con = DriverManager.getConnection(url, username, password);
    	        stmt = con.createStatement();
    	        String sql = "SELECT start_date, end_date FROM mytable WHERE id = 1";
    	        rs = stmt.executeQuery(sql);

    	        while (rs.next()) {
    	            String startDate = rs.getString("start_date");
    	            String endDate = rs.getString("end_date");
    	            System.out.println("시작일: " + startDate);
    	            System.out.println("종료일: " + endDate);
    	        }
    	    } catch (SQLException e) {
    	        System.out.println("데이터베이스 연결 중 에러");
    	        e.printStackTrace();
    	    } finally {
    	        try {
    	            if (rs != null) {
    	                rs.close();
    	            }
    	            if (stmt != null) {
    	                stmt.close();
    	            }
    	            if (con != null) {
    	                con.close();
    	            }
    	        } catch (SQLException e) {
    	            System.out.println("데이터베이스 연결 종료 중 에러");
    	            e.printStackTrace();
    	        }
    	    }
    	}
}