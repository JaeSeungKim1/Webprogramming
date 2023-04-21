package Board;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DTO.BoardDTO;
import common.JDBConnPool;

public class BoardDAO extends JDBConnPool {
	public int getListCount() {
		int x=0;
		try {
			psmt=con.prepareStatement("select count(*)from board");
			rs = psmt.executeQuery();
			if(rs.next()) {
				x = rs.getInt(1);
			}
		}catch(Exception e) {
			System.out.println("getListCount 에러:" +e);
		}finally {
			if(rs!=null) try {rs.close();} catch(SQLException e) {}
			
		}
		return x;
	}
	public List getBoardList(int page, int limit) {
		String board_list_sql = "select * from " + "(select rownum rnum,"
				+ "Board_Num, Board_Name, Board_Subject,"+
				"Board_Content, Board_File, Board_Re_Ref+Board_Re_Lev,"
				+"Board_Re_Seq, Board_Visitcount, Board_Date from"
				+ "(select*from board order by Board_Re_Ref desc, Board_Re_Seq asc))"
				+"where rnum>=?and rnum<=?";
		
			List list = new ArrayList();
			int startrow = (page-1)*10+1;
			int endrow = startrow + limit-1;
			
			try {
				psmt = con.prepareStatement(board_list_sql);
				psmt.setInt(1, startrow);
				psmt.setInt(2, endrow);
				rs = psmt.executeQuery();
				
				while(rs.next()) {
					BoardDTO board = new BoardDTO();
					board.setBoard_Num(rs.getInt("Board_Num"));
					board.setBoard_Name(rs.getString("Board_Name"));
					board.setBoard_Subject(rs.getString("Board_Subject"));
					board.setBoard_Content(rs.getString("Board_Content"));
					board.setBoard_File(rs.getString("Board_File"));
					board.setBoard_Re_Ref(rs.getInt("Board_Re_Ref"));
					board.setBoard_Re_Lev(rs.getInt("Board_Re_Lev"));
					board.setBoard_Re_Seq(rs.getInt("Board_Re_Seq"));
					board.setBoard_Visitcount(rs.getInt("Board_Visitcount"));
					board.setBoard_Date(rs.getDate("Board_Date"));
					list.add(board);
				}
				return list;
			}catch(Exception e) {
				System.out.println();
				
			}finally{
				if(rs!=null) try {rs.close();} catch(SQLException e) {}
				if(psmt!=null) try {psmt.close();} catch(SQLException e) {}
		}	
			return null;
	}	
	public BoardDTO getDetail(int num) throws Exception{
		BoardDTO board= null;
		try {
			psmt = con.prepareStatement("select*from board where Board_Num=?");
			psmt.setInt(1, num);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				board = new BoardDTO();
				board.setBoard_Num(rs.getInt("Board_Num"));
				board.setBoard_Name(rs.getString("Board_Name"));
				board.setBoard_Subject(rs.getString("Board_Subject"));
				board.setBoard_Content(rs.getString("Board_Content"));
				board.setBoard_File(rs.getString("Board_File"));
				board.setBoard_Re_Ref(rs.getInt("Board_Re_Ref"));
				board.setBoard_Re_Lev(rs.getInt("Board_Re_Lev"));
				board.setBoard_Re_Seq(rs.getInt("Board_Seq"));
				board.setBoard_Visitcount(rs.getInt("Board_Visitcount"));
				board.setBoard_Date(rs.getDate("Board_Date"));
				
			}
			return board;
		}catch(Exception e) {
			System.out.println("getDetail 에러: "+ e);
		}finally {
			if(rs!=null) try {rs.close();} catch(SQLException e) {}
			if(psmt!=null) try {psmt.close();} catch(SQLException e) {}
		}
		return null;
	}
	public boolean boardInsert(BoardDTO board) {
		int num=0;
		String sql="";
		
		int result=0;
		try {
			psmt=con.prepareStatement("select max(board_num)from board");
			rs = psmt.executeQuery();
			
			if(rs.next())
				num = rs.getInt(1)+1;
			else
				num=1;
			
			sql= "insert into board(Board_Num,Board_Name,Board_Pass,Board_Subject";
			sql+="Board_Content, Board_File, Board_Re_Ref, Board_Re_Lev, Board_Re_Seq,"
					+" Board_Vis"
					+ "itcount, Board_Date) values(?,?,?,?,?,?,?,?,?,?,sysdate)";
			psmt= con.prepareStatement(sql);
			psmt.setInt(1, num);
			psmt.setString(2, board.getBoard_Name());
			psmt.setString(3, board.getBoard_Pass());
			psmt.setString(4, board.getBoard_Subject());
			psmt.setString(5, board.getBoard_Content());
			psmt.setString(6, board.getBoard_File());
			psmt.setInt(7, num);
			psmt.setInt(8, 0);
			psmt.setInt(9, 0);
			psmt.setInt(10, 0);
			
			result=psmt.executeUpdate();
			if(result==0) return false;
			
			return true;
			
		}catch(Exception e) {
			System.out.println("boardInsert 에러: "+ e);
		}finally {
			if(rs!=null) try {rs.close();} catch(SQLException e) {}
			if(psmt!=null) try {psmt.close();} catch(SQLException e) {}
		}
		return false;
	}
	public int boardReply(BoardDTO board) {
		String board_max_sql="select max(board_num) from board";
		
		String sql="";
		int num=0;
		int result=0;
		
		int re_ref=board.getBoard_Re_Ref();
		int re_lev=board.getBoard_Re_Lev();
		int re_seq=board.getBoard_Re_Seq();
		
		try {
			psmt=con.prepareStatement(board_max_sql);
			rs = psmt.executeQuery();
			if(rs.next())num = rs.getInt(1)+1;
			else num=1;
			
			sql="update board set Board_Re_Seq=Board_Re_Seq+1"
					+ "where Board_Re_Ref=?";
			sql+="and Board_Re_Seq>?";
			
			psmt=con.prepareStatement(sql);
			psmt.setInt(1, re_ref);
			psmt.setInt(2, re_seq);
			result=psmt.executeUpdate();
			
			re_seq = re_seq+1;
			re_lev = re_lev+1;
			
			sql="insert into board(Board_Num, Board_Name,Board_Pass,Board_Subject";
			sql+="Board_Content,Board_File, Board_Re_Ref,Board_Re_Lev,Board_Re_Seq";
			sql+="Board_Visitcount, Board_Date) values(?,?,?,?,?,?,?,?,?,?,sysdate)";
			
			psmt=con.prepareStatement(sql);
			psmt.setInt(1, num);
			psmt.setString(2, board.getBoard_Name());
			psmt.setString(3, board.getBoard_Pass());
			psmt.setString(4, board.getBoard_Subject());
			psmt.setString(5, board.getBoard_Content());
			psmt.setString(6, "");
			psmt.setInt(7, re_ref);
			psmt.setInt(8, re_lev);
			psmt.setInt(9, re_seq);
			psmt.setInt(10, 0);
			psmt.executeUpdate();
			
			return num;
			
			
		}catch(Exception e) {
			System.out.println("boardReply 에러: "+ e);
		}finally {
			if(rs!=null) try {rs.close();} catch(SQLException e) {}
			if(psmt!=null) try {psmt.close();} catch(SQLException e) {}
		}
		return 0;
	}
	public boolean boardModify(BoardDTO mo) throws Exception {
		String sql="update board set Board_Subject=?,Board_Content=? where Board_Num=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, mo.getBoard_Subject());
			psmt.setString(2, mo.getBoard_Content());
			psmt.setInt(3, mo.getBoard_Num());
			psmt.executeUpdate();
			
			return true;
		}catch(Exception e) {
			System.out.println("boardModify 에러 :"+ e);	
		}finally {
			if(rs!=null) try {rs.close();} catch(SQLException e) {}
			if(psmt!=null) try {psmt.close();} catch(SQLException e) {}
		}
		return false;
	}
	public boolean boardDelete(int num) {
		String board_delete_sql = "delete from board where Board_num=?";
		
		int result=0;
		
		try {
			psmt=con.prepareStatement(board_delete_sql);
			psmt.setInt(1, num);
			result=psmt.executeUpdate();
			if(result==0) return false;
			
			return true;
		}catch(Exception e) {
			System.out.println("boardDelete 에러: "+e);
		}finally {
			try {
				if(psmt!=null)psmt.close();
			}catch(Exception e) {}
		}
		return false;
	}
	public void setReadCountUpdate(int num) throws Exception{
		String sql = "update board set Board_Visitcount = "+
			"Board_Visitcount+1 where Board_Num = num";
		
		try {
			psmt=con.prepareStatement(sql);
			psmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("setReadCountUpdate 에러: "+ e);
		}
	}
	public boolean isBoardWriter(int num, String pass) {
		String board_sql="select*from board where Board_Num=?";
		try {
			psmt=con.prepareStatement(board_sql);
			psmt.setInt(1, num);
			rs=psmt.executeQuery();
			rs.next();
			
			if(pass.equals(rs.getString("Board_Pass"))) {
				return true;
			}
		}catch(SQLException e) {
			System.out.println("isBoardWriter 에러: "+e);
		}
		return false;
	}
}
