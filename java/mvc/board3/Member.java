package board3;

import java.sql.*;
import common.JDBConnect;

public class Member extends JDBConnect {
    public void getMemberInfo(int memberId) throws SQLException {
        String sql = "SELECT * FROM members WHERE id = ?";

      
        psmt = con.prepareStatement(sql);
        psmt.setInt(1, memberId);

        rs = stmt.executeQuery(sql);

        if (rs.next()) {
            String name = rs.getString("name");
            String email = rs.getString("email");
        
        }

        // 자원 해제
        rs.close();
        stmt.close();
        con.close();
    }
}