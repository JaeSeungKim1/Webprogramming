package DTO;

import java.sql.Date;

public class TodoDTO {
	private String todoName;
	private int session_Id;
	private String host_Id;
	private String todo_Id;
	private Date todo_Start_Date;
	private Date todo_End_Date;
	private String todo_Status;
	private String todo_Rank;
	private boolean todo_checked;
	
	public String getTodoName() {
		return todoName;
	}
	public void setTodoName(String todoName) {
		this.todoName = todoName;
	}
	public int getSession_Id() {
		return session_Id;
	}
	public void setSession_Id(int session_Id) {
		this.session_Id = session_Id;
	}
	public String getHost_Id() {
		return host_Id;
	}
	public void setHost_Id(String host_Id) {
		this.host_Id = host_Id;
	}
	public String getTodo_Id() {
		return todo_Id;
	}
	public void setTodo_Id(String todo_Id) {
		this.todo_Id = todo_Id;
	}
	public Date getTodo_Start_Date() {
		return todo_Start_Date;
	}
	public void setTodo_Start_Date(Date todo_Start_Date) {
		this.todo_Start_Date = todo_Start_Date;
	}
	public Date getTodo_End_Date() {
		return todo_End_Date;
	}
	public void setTodo_End_Date(Date todo_End_Date) {
		this.todo_End_Date = todo_End_Date;
	}
	public String getTodo_Status() {
		return todo_Status;
	}
	public void setTodo_Status(String todo_Status) {
		this.todo_Status = todo_Status;
	}
	public String getTodo_Rank() {
		return todo_Rank;
	}
	public void setTodo_Rank(String todo_Rank) {
		this.todo_Rank = todo_Rank;
	}
	public boolean isTodo_checked() {
		return todo_checked;
	}
	public void setTodo_checked(boolean todo_checked) {
		this.todo_checked = todo_checked;
	}
	
	
}
