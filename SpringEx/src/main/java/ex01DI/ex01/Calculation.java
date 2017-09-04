package ex01DI.ex01;

public class Calculation {
	
	/*
	 사칙연산을 위한 메소드 정의
	*/
	public void addition(int fNum, int sNum){
		System.out.println("덧셈을 수행합니다");
		int result = fNum + sNum;
		System.out.println(fNum+"+"+sNum+"="+result);
	}
	
	public void subtraction(int fNum, int sNum){
		System.out.println("뺄셈을 수행합니다");
		int result = fNum - sNum;
		System.out.println(fNum+"-"+sNum+"="+result);
	}
	
	public void multiplication(int fNum, int sNum){
		System.out.println("곱셈을 수행합니다");
		int result = fNum * sNum;
		System.out.println(fNum+"*"+sNum+"="+result);
	}

	public void division(int fNum, int sNum){
		System.out.println("나눗셈을 수행합니다");
		int result = fNum / sNum;
		System.out.println(fNum+"/"+sNum+"="+result);
	}

	
}
