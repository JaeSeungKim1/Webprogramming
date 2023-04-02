package jun2;

import java.util.ArrayList;

	public class Classroom {
		int capacity;
		ArrayList<Student> students;
		
	public Classroom(int capacity) {
		this.capacity = capacity;
		this.students = new ArrayList<>();
		
	}
	public boolean addStudent(Student student) {
		if(students.size() >= capacity) {
			return false;
		}
		
		students.add(student);
		return true;
	}

}
