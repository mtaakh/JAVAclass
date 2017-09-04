package ex03Env;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
/* Configuration 어노테이션으로 설정파일의 역할을 하는 클래스로 정의함 */
@Configuration
public class ApplicationConfig {
	
	//값의 설정(set)은 @Value 어노테이션을 사용함
	@Value("${board1.title}")
	private String board_title;
	
	@Value("${board1.content}")
	private String board_content;

	@Value("${board2.writer}")
	private String board_writer;

	@Value("${board2.passwd}")
	private String board_passwd;
	
	/*
	PropertySourcesPlaceholderConfigurer() 클래스를 이용해 프로퍼티 소스(외부파일)을 읽어온다.
	*/
	@Bean
	public static PropertySourcesPlaceholderConfigurer Properties(){
		
		PropertySourcesPlaceholderConfigurer configurer = new PropertySourcesPlaceholderConfigurer();
		
		//프로퍼티 소스의 위치값 설정
		Resource[] locations = new Resource[2];
		locations[0] = new ClassPathResource("board1.properties");
		locations[1] = new ClassPathResource("board2.properties");
		configurer.setLocations(locations);
		
		return configurer;
	}
	
	/* 빈 생성 후 주입 */
	@Bean
	public BoardConnection boardConfig(){
		
		BoardConnection boardConnection = new BoardConnection();
		
		boardConnection.setTitle(board_title);
		boardConnection.setContent(board_content);
		boardConnection.setWriter(board_writer);
		boardConnection.setPasswd(board_passwd);
		
		return boardConnection;
	}
	
}
