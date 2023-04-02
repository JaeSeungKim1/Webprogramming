package jun2;

import java.util.ArrayList;

public class School {
	ArrayList<Student> students;
	ArrayList<Classroom> classrooms= new ArrayList<>();
	
	public School() {
		this.students = new ArrayList<>();
	}
	public void addStudent(Student student) {
		this.students.add(student);
	}
	public void addClassroom(Classroom classroom) {
		/*Student studentnode = new Student(classroom.students.get(0).name,classroom.students.get(0).age);
		Classroom test = new Classroom(10);
		test.addStudent(studentnode);
		classrooms.add(test);*/
		this.classrooms.add(classroom);
	}
	
	public ArrayList<Student> getStudents(){
		ArrayList<Student> allS = new ArrayList<>();
			allS.addAll(students);
		
		
		for (int i=0; i<classrooms.size(); i++) {
	        Classroom a = classrooms.get(i);
	        allS.addAll(a.students);
		}
		return allS;
	}
}