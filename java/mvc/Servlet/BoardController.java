package Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board3.Action;

@WebServlet("/list.do")
public class BoardController extends HttpServlet implements Servlet {
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String RequestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		
		ActionForward forward=null;
		Action action = null;
		
		if(command.equals("/Team/write.do")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("../Team/write.jsp");
		}else if(command.equals("/BoardReplyAction.do")) {
			action = new BoardReplyView();
			try {
				forward = action.execute(req,resp);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/BoardDelete.do")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("../Team/delete.jsp");
		}else if(command.equals("/BoardModify.do")) {
			action = new BoardModifyView();
			try {
				forward = action.execute(req,resp);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/BoardAddAction.do")) {
			action = new BoardAddAction();
			try {
				forward = action.execute(req,resp);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/BoardReplyView.do")) {
			action = new BoardReplyAction();
			try {
				forward = action.execute(req,resp);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/BoardModifyAction.do")) {
			action = new BoardModifyAction();
			try {
				forward = action.execute(req,resp);
			}catch(Exception e) {
				e.printStackTrace();
			
			}
		}else if(command.equals("/BoardDeleteAction.do")) {
			action = new BoardDeleteAction();
			try {
				forward = action.execute(req,resp);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/List.do")) {
			action = new BoardListAction();
			try {
				forward = action.execute(req,resp);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("../Servlet/BoardDetailAction.do")) {
			action = new BoardDetailAction();
			try {
				forward = action.execute(req,resp);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		if(forward.isRedirect()) {
			resp.sendRedirect(forward.getPath());
		}else {
			RequestDispatcher dispatcher = req.getRequestDispatcher(forward.getPath());
			dispatcher.forward(req,resp);
		}
	}
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			// TODO Auto-generated method stub
			super.doGet(req, resp);
	}
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			// TODO Auto-generated method stub
			super.doPost(req, resp);
	}
}
