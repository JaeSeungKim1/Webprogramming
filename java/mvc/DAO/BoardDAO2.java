package DAO;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import Board.BoardDTO2;
import common.JDBConnPool;


public class BoardDAO2 extends JDBConnPool {
	
	public int selectCount(Map<String, Object>map) {
	int totalcount = 0;
	String query="SELECT COUNT(*) FROM Board3";
	if(map.get("searchWord") != null) {
		query += " WHERE " + map.get("searchField") + " " + " LIKE '%" + map.get("searchWord") + "%'";
	
	}
	try {
		stmt = con.createStatement();
		rs = stmt.executeQuery(query);
		rs.next();
		
	}catch(Exception e) {
		System.out.println("게시물 카운트 중 예외 발생");
		e.printStackTrace();
	}
	return totalcount;
}
	public List<BoardDTO2> selectListPage(Map<String, Object>map){
		List<BoardDTO2> b = new Vector<BoardDTO2>();
		System.out.println(map.get("searchWord"));
		System.out.println(map.get("searchField"));
		String query="select * from("
				+"	select rownum pnum, s.* from("
				+"		select b.* from board b";	
				
		if(map.get("findWord")!=null) {
			query += " where "+map.get("findCol")+" like '%"
					+map.get("findWord")+"%'";
		}
		query += " 	order by num desc "
				+"	)s"
				+ ")"
				+ "where pnum between ? and ?";
		try {
			psmt=con.prepareStatement(query);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs=psmt.executeQuery();
				while(rs.next()) {
					BoardDTO2 dto = new BoardDTO2();
					
					dto.setWriter(rs.getString("writer"));
					dto.setTitle(rs.getString("title"));
					dto.setContent(rs.getString("content"));
					dto.setOfile(rs.getString("ofile"));
					dto.setNfile(rs.getString("nfile"));
					dto.setBoardDate(rs.getDate("boarddate"));
					dto.setSearch(rs.getInt("search"));
					dto.setNonum(rs.getInt("nonum"));
					
					b.add(dto);
				}
			}catch(Exception e) {
				System.out.println("게시물 조회 중 예외 발생");
				e.printStackTrace();
			}
			return b;
		}
	}

	