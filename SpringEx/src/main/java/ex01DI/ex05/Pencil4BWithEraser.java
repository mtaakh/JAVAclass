package ex01DI.ex05;

public class Pencil4BWithEraser implements Pencil {

	@Override
	public void used(){
		System.out.println("4B 연필과 지우개를 함게 사용할 수 있습니다.");
		
	}
}
