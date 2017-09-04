package ex01DI.ex04;

public class StudentInfo {
	
	private Student student;
	
	//인자생성자
	public StudentInfo(Student student){
		this.student = student;
		
	}
	
	//학생정보 출력
	public void getStudentInfo(){
		if(student != null){
			System.out.printf("이름:%s\n", student.getName());
			System.out.printf("나이:%s\n", student.getAge());
			System.out.printf("학년:%s\n", student.getGradeNum());
			System.out.printf("반:%s\n", student.getClassNum());
			System.out.println("=========================================");
		}
	}
	
	//setter() 메소드
	public void setStudent(Student student){
		this.student = student;
	}
	
}
