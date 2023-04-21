package Board;

import java.sql.Date;

public class BoardDTO2 {
	
	int nonum;
	int search;
	String writer;
	String title;
	String content;
	String sendId;
	String Ofile;
	String Nfile; 
   Date BoardDate;
   public int getNonum() {
      return nonum;
   }
   public void setNonum(int nonum) {
      this.nonum = nonum;
   }
   public int getSearch() {
      return search;
   }
   public void setSearch(int search) {
      this.search = search;
   }
   public String getWriter() {
      return writer;
   }
   public void setWriter(String writer) {
      this.writer = writer;
   }
   public String getTitle() {
      return title;
   }
   public void setTitle(String title) {
      this.title = title;
   }
   public String getContent() {
      return content;
   }
   public void setContent(String content) {
      this.content = content;
   }
  
   public String getOfile() {
      return Ofile;
   }
   public void setOfile(String ofile) {
      Ofile = ofile;
   }
   public String getNfile() {
      return Nfile;
   }
   public void setNfile(String nfile) {
      Nfile = nfile;
   }
   public Date getBoardDate() {
      return BoardDate;
   }
   public void setBoardDate(Date BoardDate) {
      this.BoardDate = BoardDate;
   }
}