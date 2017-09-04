package ex01DI.ex03;

public class BMICalculator {
	
	private double lowWeight; // 저체중
	private double normal; // 정상체중
	private double overWeight; // 과체중
	private double obesity; // 비만
	
	//BMI지수 계산을 위한 메소드 정의
	public void bmiCalculation(double weight, double height){
		
		double h = height * 0.01;
		double result = weight / (h*h);
		
		System.out.println("당신의 BMI 지수는? : "+(int)result);
		
		if(result > obesity){
			System.out.println("비만입니다");
		}
		else if(result > overWeight){
			System.out.println("과체중입니다");
		}
		else if(result > normal){
			System.out.println("정상입니다");
		}
		else{
			System.out.println("저체중입니다");
		}
		
	}

	//setter() 메소드 정의
	public void setLowWeight(double lowWeight) {
		this.lowWeight = lowWeight;
	}

	public void setNormal(double normal) {
		this.normal = normal;
	}

	public void setOverWeight(double overWeight) {
		this.overWeight = overWeight;
	}

	public void setObesity(double obesity) {
		this.obesity = obesity;
	}
	
	
	
}
