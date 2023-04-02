package jun2;

public class Test {

	public static void main(String[] args) {
		
		Student student1 = new Student("test1",13);
		Student student2 = new Student("공승환",75);
		Student student3 = new Student("한건희",29);
		Student student4 = new Student("test4",13);
		
		
		Classroom a = new Classroom(10);
		a.addStudent(student1);
		School school = new School();
		school.addStudent(student4);
		Classroom classroom1 = new Classroom(10);
		classroom1.addStudent(student1);
		school.addClassroom(classroom1);
		  
		 System.out.println(school.getStudents()); 
		 
		 Classroom classroom2 = new Classroom(20);
		 classroom2.addStudent(student3);
		 school.addClassroom(classroom2);
		 System.out.println(school.getStudents());
		
		
		
		
		
		
		
		//System.out.println(student2.getName()+student2.getAge());
		//System.out.println(student3);
	}

}












// test2,3 classroom에 새 클래스를 만들어서 출력하는 방법
/*
 * School school = new School();
 * 
 * school.addStudent(student4);
 * 
 * Classroom classroom1 = new Classroom(10); classroom1.addStudent(student1);
 * 
 * 
 * school.addClassroom(classroom1);
 * 
 * 
 * System.out.println(school.getStudents());
 * 
 * Classroom classroom2 = new Classroom(20);
 * 
 * classroom2.addStudent(student3);
 * 
 * school.addClassroom(classroom2);
 * 
 * System.out.println(school.getStudents());
 */