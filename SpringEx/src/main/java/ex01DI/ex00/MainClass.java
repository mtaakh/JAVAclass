package ex01DI.ex00;

/*
JAVA 스타일로 구현
*/
public class MainClass {

	public static void main(String[] args) {
		
		Calculation cal = new Calculation();
		cal.setFirstNum(200);
		cal.setSecondNum(100);
		
		//사칙연산 수행
		cal.addition();
		cal.subtraction();
		cal.multiplication();
		cal.division();
		
	}

}
