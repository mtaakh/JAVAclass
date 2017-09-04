package ex01DI.ex04;

public class Student {
	
	private String name;
	private String age;
	private String gradeNum;
	private String classNum;
	
	//인자생성자
	public Student(String name, String age, String gradeNum, String classNum){
		
		this.name = name;
		this.age = age;
		this.gradeNum = gradeNum;
		this.classNum = classNum;
		
	}

	//getter() 메소드
	public String getName() {
		return name;
	}

	public String getAge() {
		return age;
	}

	public String getGradeNum() {
		return gradeNum;
	}

	public String getClassNum() {
		return classNum;
	}
	
	
	
}
