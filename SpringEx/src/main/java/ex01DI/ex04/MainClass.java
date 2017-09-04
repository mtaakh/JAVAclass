package ex01DI.ex04;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

/* 생성자를 통한 빈 생성 */
public class MainClass {

	public static void main(String[] args) {
		
		String configLocation = "classpath:applicationContextEx04.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(configLocation);
		
		/* xml 파일에서 studentInfo는 student1을 참조하고 있으므로 */
		StudentInfo studentInfo = ctx.getBean("studentInfo", StudentInfo.class);
		studentInfo.getStudentInfo();
		
		/* 위와 같은 결과가 출력된다.
		 	여기서도 student1을 통해 studentInfo를 생성하고 있음 */
		Student student2 = ctx.getBean("student1", Student.class);
		studentInfo.setStudent(student2);
		studentInfo.getStudentInfo();
		
		ctx.close();
		
	}

}
