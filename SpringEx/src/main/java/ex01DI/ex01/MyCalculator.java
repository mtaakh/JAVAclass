package ex01DI.ex01;

public class MyCalculator {
	
	//멤버변수
	private int firstNum;
	private int secondNum;
	Calculation cal;
	
	//기본생성자
	public MyCalculator(){}
	
	/*
	사칙연산의 수행은 Calculation 클래스의 메소드르 통해서 수행함
	*/
	public void add(){
		cal.addition(firstNum, secondNum);
		
	}
	public void sub(){
		cal.subtraction(firstNum, secondNum);
	}

	public void mul(){
		cal.multiplication(firstNum, secondNum);
	}

	public void div(){
		cal.division(firstNum, secondNum);
	}

	//setter() / getter() 메소드 정의

	public int getFirstNum() {
		return firstNum;
	}

	public void setFirstNum(int firstNum) {
		this.firstNum = firstNum;
	}

	public int getSecondNum() {
		return secondNum;
	}

	public void setSecondNum(int secondNum) {
		this.secondNum = secondNum;
	}

	public Calculation getCal() {
		return cal;
	}

	public void setCal(Calculation cal) {
		this.cal = cal;
	}
	
	
}
