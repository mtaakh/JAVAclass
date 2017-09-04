package ex01DI.ex00;

public class Calculation {
	
	private int firstNum;
	private int secondNum;
	
	public void addition(){
		System.out.println("덧셈을 수행합니다");
		int result = firstNum + secondNum;
		System.out.println(firstNum+"+"+secondNum+"="+result);
	}
	
	public void subtraction(){
		System.out.println("뺄셈을 수행합니다");
		int result = firstNum - secondNum;
		System.out.println(firstNum+"-"+secondNum+"="+result);
	}
	
	public void multiplication(){
		System.out.println("곱셈을 수행합니다");
		int result = firstNum * secondNum;
		System.out.println(firstNum+"*"+secondNum+"="+result);
	}

	public void division(){
		System.out.println("나눗셈을 수행합니다");
		int result = firstNum / secondNum;
		System.out.println(firstNum+"/"+secondNum+"="+result);
	}

	//getter() / setter() 메소드 정의
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
	
	
}
