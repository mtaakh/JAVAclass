package ex01DI.ex02;

public class Calculation {
	
	/*
	 사칙연산을 위한 메소드 정의
	*/
	public void addition(int fNum, int sNum){
		
		int result = fNum + sNum;
		System.out.println("덧셈 정답은 "+result);
	}
	
	public void subtraction(int fNum, int sNum){
		
		int result = fNum - sNum;
		System.out.println("뺄셈 정답은 "+result);
	}
	
	public void multiplication(int fNum, int sNum){
		
		int result = fNum * sNum;
		System.out.println("곱셈 정답은 "+result);
	}

	public void division(int fNum, int sNum){
		
		int result = fNum / sNum;
		System.out.println("나눗셈 정답은 "+result);
	}

	
}
