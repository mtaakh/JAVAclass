package springBoard.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import springBoard.command.BbsCommand;
import springBoard.command.DeleteActionCommand;
import springBoard.command.ListCommand;
import springBoard.command.ModifyActionCommand;
import springBoard.command.ModifyCommand;
import springBoard.command.ReplyActionCommand;
import springBoard.command.ReplyCommand;
import springBoard.command.ViewCommand;
import springBoard.command.writeActionCommand;
import springBoard.model.Constant;
import springBoard.model.SpringBbsDAO;

/*
Spring JDBC를 사용하기 위한 설정방법
1. pom.xml 의존설정

		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-jdbc</artifactId>
			<version>4.1.4.RELEASE</version>
		</dependency>
		: 설정후 저장하면 필요한 라이브러리 파일들이 자동으로 다운로드 됨
2. 컨트롤러에 JDBC 템플릿 설정
	private JdbcTemplate template;
	//setter 설정
	@Autowired
	public void setTemplate(JdbcTemplate template){
		this.template = template;
		Constant.template = this.template;
@Autowired 어노테이션
- 의존관계 자도얼정
-  생성자, 필드, 메소드에 적용가능	
- setXX() 의 형식이 아니더라도 적용 가능
- 타입을 이용해 자동적으로 프로퍼티 값을 설정하므로 
	해당 타입의 빈 객체가 존재하지 않거나 또는 빈 객체가 두개이상 존재할 경우 예외 발생시킴
- 단, @Autowird 어노테이션에 required 속성의 값을 false로 지정하면 
	해당 타입의 빈 객체가 존재하지 않더라도 예외가 발생하지 않는다.

3. servlet-context.xml 설정 : 드라이버, url 등은 환경에 따라 바뀔 수 있으므로 확인이 필요함
	<beans:bean>
		<beans:property name="dataSource" value="org.springframework.jdbc.datasource.DriverManagerDataSource" />
		<beans:property name="driverClassName" value="oracle.jdbc.driver.OracleDriver" />
		<beans:property name="url" value="jdbc:oracle:thin:@localhost:1521:orcl" />
		<beans:property name="username" value="DB아이디" />
		<beans:property name="password" value="DB패스워드" />
	</beans:bean>

4. 자동할당을 위한 클래스 생성(model - constant 생성)
	인스턴스 생성 없이 즉시 사용할 수 있는 static 타입의 변수를 정의함
5. @Autowired 어노테이션을 통한 의존관계 자동설정

주의)
- DTO 클래스에 기본생성자가 반드시 있어야 함
- select 하는 컬럼 갯수와 DTO가 1:1로 매칭되어야 함(커맨드 객체이므로)

 */
@Controller
public class BbsController {

	/* Spring JDBC를 사용하기 위한 설정 */
	//JDBC템플릿 설정
	private JdbcTemplate template;
	//setter 설정
	@Autowired
	public void setTemplate(JdbcTemplate template){
		this.template = template;
		Constant.template = this.template;
	}
	
	
	BbsCommand command = null;
	
	@RequestMapping("/board/list.do")
	public String list(Model model, HttpServletRequest req){
		
		System.out.println("list() 메소드 호출됨");
		
		//컨트롤러가 받은 파라미터 전체를 ListCommand로 넘긴다.
		model.addAttribute("req", req);
		command = new ListCommand();
		command.execute(model);
		
		return "board/list";
	}
	
	//상세보기
	@RequestMapping("board/view")
	public String view(Model model, HttpServletRequest req){
		
		System.out.println("view()");
		
		model.addAttribute("req", req);
		command = new ViewCommand();
		command.execute(model);
		
		return "board/view";
	}

	//글쓰기
	@RequestMapping("board/write.do")
	public String write(Model model, HttpServletRequest req){
		
		System.out.println("write()");
		
		return "board/write";
	}
	
	//글쓰기 처리
	@RequestMapping("board/writeAction.do")
	public String writeAction(Model model, HttpServletRequest req){
		
		System.out.println("writeAction()");
		
		model.addAttribute("req", req);
		command = new writeActionCommand();
		command.execute(model);
		
		//뷰 연결이 아닌 페이지 이동을 할때 redirect 사용
		return "redirect:list.do";
	}
	
	//수정,삭제 전 패스워드 입력페이지
	@RequestMapping("board/password.do")
	public String password(Model model, HttpServletRequest req){
		
		System.out.println("password()");
		
		model.addAttribute("mode", req.getParameter("mode"));
		model.addAttribute("idx", req.getParameter("idx"));

		return "board/password";
	}
	
	//패스워드 검증
	@RequestMapping(value="/board/passwordAction.do", method=RequestMethod.POST)
	public String passwordAction(Model model, HttpServletRequest req){
		
		String mode = req.getParameter("mode"); // 수정 or 삭제
		String idx = req.getParameter("idx");
		String pass = req.getParameter("pass");
		
		//패스워드 검증후 이동할 페이지
		String modePage = null;
		
		//패스워드 검증
		SpringBbsDAO dao = new SpringBbsDAO();
		//int rowIdx = dao.password(idx,pass);
		int rowIdx = dao.passwordSpJDBC(idx,pass);
		dao.close();
		
		if(rowIdx<=0){
			System.out.println("패스워드가 일치하지 않습니다.");
			//뷰로 전송할 데이터 저장
			model.addAttribute("isCorrMsg", "패스워드가 일치하지 않습니다.");
			model.addAttribute("mode", mode);
			model.addAttribute("idx", idx);
			modePage = "board/password";
		}
		else{
			System.out.println("패스워드가 일치합니다.");
			
			if(mode.equals("modify")){ // 수정인 경우
				model.addAttribute("req", req);
				command = new ModifyCommand();
				command.execute(model);
				
				//수정페이지로 이동
				modePage = "board/modify";
			}
			else if(mode.equals("delete")){ // 삭제인 경우
				
				//게시물 즉시 삭제 후 리스트페이지로 이동
				model.addAttribute("req", req);
				command = new DeleteActionCommand();
				command.execute(model);
				
				modePage = "redirect:list.do";
				
			}
		}
		return modePage;
	}
	
	//수정처리
	@RequestMapping(value="/board/modifyAction.do", method=RequestMethod.POST)
	public String modifyAction(Model model, HttpServletRequest req){
		System.out.println("modifyAction() 메소드 호출");
		
		model.addAttribute("req", req);
		command = new ModifyActionCommand();
		command.execute(model);
		
		
		//수정처리 후 상세보기 페이지로 이동
		model.addAttribute("idx", req.getParameter("idx"));
		return "redirect:view.do";
	}
	
	//답변글 쓰기
	@RequestMapping(value="/board/reply.do")
	public String reply(Model model, HttpServletRequest req){
		System.out.println("reply()메소드 호출");
		model.addAttribute("req", req);
		command = new ReplyCommand();
		command.execute(model);
		
		model.addAttribute("idx", req.getParameter("idx"));
		
		return "board/reply";
	}
	
	//답변글처리
	@RequestMapping(value="/board/replyAction.do")
	public String replyAction(Model model, HttpServletRequest req){
		
		System.out.println("replyAction()메소드 호출");
		model.addAttribute("req", req);
		command = new ReplyActionCommand();
		command.execute(model);
		
		
		return "redirect:list.do";
	}
	
}
