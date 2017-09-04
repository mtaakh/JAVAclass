package ex05Transaction02;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

public class TicketDAO {
	//스프링JDBC사용
	JdbcTemplate template;
	public void setTemplate(JdbcTemplate template){
		this.template = template;
	}
	
	/* 트랜젝션 처리를 위한 참조변수와 세터설정
		servlet-context.xml 에서 생성한 transactionManager 빈을 주입받음
	 */
	PlatformTransactionManager transactionManager;
	public void setTransactionManager(PlatformTransactionManager transactionManager){
		this.transactionManager = transactionManager;
	}
	
	//기본생성자
	public TicketDAO(){
		System.out.println(template);
	}
	
	//티켓구매 위한 메소드 정의
	public void buyTicket(final TicketDTO dto){
		System.out.println("buyTicket() 메소드 호출");
		System.out.println(dto.getConsumerid()+"님이 티켓 "+ dto.getAmount() +"장을 구매합니다.");
		
		//트랜젝션을 사용하기 위해 기본적으로 필요한 객체생성
		TransactionDefinition def = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(def);
		
			try{
			//신용카드 결제처리
			template.update(new PreparedStatementCreator() {
				
				@Override
				public PreparedStatement createPreparedStatement(Connection conn) throws SQLException {
					//신용카드 결제내역 인서트
					String query = "insert into transaction_card (consumerid, amount) values (?, ?)";
					PreparedStatement psmt = conn.prepareStatement(query);
					psmt.setString(1, dto.getConsumerid());
					psmt.setString(2, dto.getAmount());

					System.out.println("신용카드 결제가 완료됨");
					
					return psmt;
				}
			});
			
			// 티켓구매
			template.update(new PreparedStatementCreator() {
				
				@Override
				public PreparedStatement createPreparedStatement(Connection conn) throws SQLException {
					//신용카드 결제내역 인서트
					String query = "insert into transaction_ticket (consumerid, countNum) values (?, ?)";
					PreparedStatement psmt = conn.prepareStatement(query);
					psmt.setString(1, dto.getConsumerid());
					psmt.setString(2, dto.getAmount());
					
					System.out.println("티켓 구매가 완료됨");
					
					return psmt;
				}
			});
			
			System.out.println("구매해주셔서 감사합니다.");
			transactionManager.commit(status);
			}
			catch(Exception e){
				e.printStackTrace();
				System.out.println("제약조건을 위배하여 카드결제&구매 모두 취소되었습니다.");
				transactionManager.rollback(status);
			}
	}
}
