package Servlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import Board.BoardDAO;
import DTO.BoardDTO;
import board3.Action;

public class BoardAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		BoardDAO dao = new BoardDAO();
		BoardDTO dto = new BoardDTO();
		ActionForward forward = new ActionForward();
		
		String realFolder="";
		String saveFolder = "boardupload";
		int fileSize=5*1024*1024;
		realFolder = req.getRealPath(saveFolder);
		
		boolean result = false;
		try {
			MultipartRequest multi=null;
			multi = new MultipartRequest(req,realFolder,fileSize,"UTF-8",new DefaultFileRenamePolicy());
			
			dto.setBoard_Content(multi.getParameter("Board_Content"));
			dto.setBoard_Pass(multi.getParameter("Board_Pass"));
			dto.setBoard_Name(multi.getParameter("Board_Name"));
			dto.setBoard_Subject(multi.getParameter("Board_Subject"));
			dto.setBoard_File(multi.getFilesystemName("Board_File"));
			
			result=dao.boardInsert(dto);
			
			if(result==false) {
				System.out.println("게시판 등록 실패");
				return null;
			}
			System.out.println(("게시판 등록 완료"));
			
			forward.setRedirect(true);
			forward.setPath("../Team/BoardList.do");
			return forward;
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
