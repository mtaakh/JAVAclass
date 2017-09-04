package ex01DI.ex01;

/*
JAVA 스타일로 구현
*/
public class MainClass {

	public static void main(String[] args) {
		
		//MyCalculator 객체 생성
		MyCalculator myCal = new MyCalculator();
		myCal.setCal(new Calculation());
		
		//setter() 메소드 호출
		myCal.setFirstNum(500);
		myCal.setSecondNum(200);
		
		//사칙연산 수행
		myCal.add();
		myCal.sub();
		myCal.mul();
		myCal.div();
		
	}
		
}
