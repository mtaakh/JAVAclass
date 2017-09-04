package ex05Transaction03;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.transaction.support.TransactionCallbackWithoutResult;
import org.springframework.transaction.support.TransactionTemplate;

public class TicketDAO {
	//스프링JDBC사용
	JdbcTemplate template;
	public void setTemplate(JdbcTemplate template){
		this.template = template;
	}

/* 트랜젝션 처리를 위한 설정1 
	PlatformTransactionManager transactionManager;
	public void setTransactionManager(PlatformTransactionManager transactionManager){
		this.transactionManager = transactionManager;
	} */
	
	/* 트랜젝션 처리를 위한 설정3 : 트랜젝션 탬플릿 사용 */
	TransactionTemplate transactionTemplete;
	public void setTransactionTemplate(TransactionTemplate transactionTemplete){
		
	}
	
	//기본생성자
	public TicketDAO(){
		System.out.println(template);
	}
	
	//티켓구매 위한 메소드 정의
	public void buyTicket(final TicketDTO dto){
		System.out.println("buyTicket() 메소드 호출");
		System.out.println(dto.getConsumerid()+"님이 티켓 "+ dto.getAmount() +"장을 구매합니다.");
		
		/*트랜젝션 템플릿을 사용하면 아래 부분 필요없음
		TransactionDefinition def = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(def); */
		
		try{
			transactionTemplete.execute(new TransactionCallbackWithoutResult() {
				@Override
				protected void doInTransactionWithoutResult(TransactionStatus status) {
					
					
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
					
						}
					});
				
				}
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
}
