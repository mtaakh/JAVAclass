package ex01DI.ex02;

public class MyCalculator {

	//멤버변수
	Calculation cal;
	private int firstNum;
	private int secondNum;
	
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


	//setter() 메소드만 정의
	public void setCal(Calculation cal) {
		this.cal = cal;
	}

	public void setFirstNum(int firstNum) {
		this.firstNum = firstNum;
	}

	public void setSecondNum(int secondNum) {
		this.secondNum = secondNum;
	}
	
}
