package jun2;

public class Student {
	String name;
	int age;
	
	
public Student(String name, int age) {
	this.name = name;
	this.age = age;
	}
@Override
public String toString() {
	return "이름= " + name + ", 나이= " + age ;
}

public String getName() {
	return name;
}
public int getAge() {
	return age;
	}

}

