package com.kosmo.SpringEx;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import ex06Mybatis.IMyBoardDAO;
import ex06Mybatis.MyBoardDAO;
import ex06Mybatis.MyBoardDTO;

/*
Mybatis를 사용하기 위한 절차

1. pom.xml 의존설정 : 아래 두가지의 의존설정이 필요함
		<dependency>
			<groupId>org.mybatis</groupId>
			<artifactId>mybatis</artifactId>
			<version>3.2.8</version>
		</dependency>
		<dependency>
			<groupId>org.mybatis</groupId>
			<artifactId>mybatis-spring</artifactId>
			<version>1.2.2</version>
		</dependency>
2. Mybatis 탬플릿에서 사용할 수 있는 DTO(커맨드객체) 생성
	※주의 : DTO객체를 생성할때 반드시 기본생성자를 생성해야 함

3. 비즈니스로직 구현을 위한 interface 생성 : 차후 생성할 mybatis mapper 파일에서 interface를 기반으로 작성된다.

4. 스프링 설정파일(servlet-context.xml)에서 빈 생성
	<beans:bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean">
		<beans:property name="dataSource" ref="데이터베이스 연결 Bean" />
		<beans:property name="mapperLocations" value="classpath:패키지명/*.xml" />
	</beans:bean>
	<beans:bean id="sqlSession" class="org.mybatis.spring.SqlSessionTemplate">
		<beans:constructor-arg index="0" ref="sqlSessionFactory" />
	</beans:bean>
- mapperLocations : mapper 파일(xml)이 있는 경로 -> 해당 경로에 존재하는 모든 xml파일을 매퍼로 사용함

5. 매퍼 파일 작성 - 새로운 xml 파일을 생성 후 
<!DOCTYPE mapper
    PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
    "http://mybatis.org/dtd/mybatis-3-mapper.dtd">

<mapper namespace="기반이 될 인터페이스(풀 경로 모두써야함)">
	<select id="메소드명" resultType="반환타입에  사용할 클래스">
		실행할 쿼리문
		파라미터가 있을경우 #{param1}, #{param2}, .... 형태로 작성
	</select>
</mapper>
※클래스명은 반드시 패키지명까지 풀 경로를 써줘야 한다.
예)ex06Mybatis.IMyBoardDAO

6. 스프링 설정파일에서 생성된 빈을 주입 : setter() 없이 바로 주입받을 수 있음
	@Autowired
	private SqlSession sqlSession;


*/

@Controller
public class MybatisController {
	
	/*MyBoardDAO dao;
	@Autowired
	public void setDao(MyBoardDAO dao) {
		this.dao = dao;
	}*/
	
	@Autowired
	private SqlSession sqlSession;
	
	//리스트
	@RequestMapping("/mybatis/list.do")
	public String list(Model model){
		
		/*ArrayList<MyBoardDTO> lists = dao.list();
		model.addAttribute("lists", lists);*/
		
		IMyBoardDAO iba = sqlSession.getMapper(IMyBoardDAO.class);
		model.addAttribute("lists", iba.list());
		
		return "mybatis/list";
	}
	
	//쓰기
	@RequestMapping("/mybatis/write.do")
	public String write(Model model){
		return "mybatis/write";
	}
	//쓰기처리
	@RequestMapping("/mybatis/writeAction.do")
	public String writeAction(HttpServletRequest req, Model model){
		
	/*	dao.write(req.getParameter("mWriter"), req.getParameter("mContent"));*/
		
		IMyBoardDAO mba = sqlSession.getMapper(IMyBoardDAO.class);
		mba.write(req.getParameter("mWriter"), req.getParameter("mContent"));
		
		return "redirect:list.do";
	}
	
	//삭제
	@RequestMapping("mybatis/delete.do")
	public String delete(HttpServletRequest req, Model model){
		
		/*dao.delete(req.getParameter("mId"));*/
		
		IMyBoardDAO mba = sqlSession.getMapper(IMyBoardDAO.class);
		mba.delete(req.getParameter("mId"));
		
		return "redirect:list.do";
	}
	
	//보기
	@RequestMapping("/mybatis/view.do")
	public String view(HttpServletRequest req, Model model){
		
		/*MyBoardDTO dto = dao.view(req.getParameter("mId"));
		model.addAttribute("view", dto);*/
		
		IMyBoardDAO mba = sqlSession.getMapper(IMyBoardDAO.class);
		model.addAttribute("view", mba.view(req.getParameter("mId")));
		
		return "mybatis/view";
	}
	
}
