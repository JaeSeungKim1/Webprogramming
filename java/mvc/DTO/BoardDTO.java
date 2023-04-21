package DTO;

import java.sql.Date;

public class BoardDTO {
	private int Board_Num;
	private String Board_Name;
	private String Board_Pass;
	private String Board_Subject;
	private String Board_Content;
	private String Board_File;
	private int Board_Visitcount;
	private Date Board_Date;
	private int Board_Re_Ref;
	private int Board_Re_Lev;
	private int Board_Re_Seq;
	public int getBoard_Num() {
		return Board_Num;
	}
	public void setBoard_Num(int board_Num) {
		Board_Num = board_Num;
	}
	public String getBoard_Name() {
		return Board_Name;
	}
	public void setBoard_Name(String board_Name) {
		Board_Name = board_Name;
	}
	public String getBoard_Pass() {
		return Board_Pass;
	}
	public void setBoard_Pass(String board_Pass) {
		Board_Pass = board_Pass;
	}
	public String getBoard_Subject() {
		return Board_Subject;
	}
	public void setBoard_Subject(String board_Subject) {
		Board_Subject = board_Subject;
	}
	public String getBoard_Content() {
		return Board_Content;
	}
	public void setBoard_Content(String board_Content) {
		Board_Content = board_Content;
	}
	public String getBoard_File() {
		return Board_File;
	}
	public void setBoard_File(String board_File) {
		Board_File = board_File;
	}
	public int getBoard_Visitcount() {
		return Board_Visitcount;
	}
	public void setBoard_Visitcount(int board_Visitcount) {
		Board_Visitcount = board_Visitcount;
	}
	public Date getBoard_Date() {
		return Board_Date;
	}
	public void setBoard_Date(Date board_Date) {
		Board_Date = board_Date;
	}
	public int getBoard_Re_Ref() {
		return Board_Re_Ref;
	}
	public void setBoard_Re_Ref(int board_Re_Ref) {
		Board_Re_Ref = board_Re_Ref;
	}
	public int getBoard_Re_Lev() {
		return Board_Re_Lev;
	}
	public void setBoard_Re_Lev(int board_Re_Lev) {
		Board_Re_Lev = board_Re_Lev;
	}
	public int getBoard_Re_Seq() {
		return Board_Re_Seq;
	}
	public void setBoard_Re_Seq(int board_Re_Seq) {
		Board_Re_Seq = board_Re_Seq;
	}
	
}