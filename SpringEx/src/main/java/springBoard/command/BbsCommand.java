package springBoard.command;

import org.springframework.ui.Model;

public interface BbsCommand {
	
	//추상메소드 - 오버라이딩의 목적으로 생성됨
	void execute(Model model);
	
}
