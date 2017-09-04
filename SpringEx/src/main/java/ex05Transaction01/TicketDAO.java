package ex05Transaction01;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;

public class TicketDAO {
	JdbcTemplate template;
	public void setTemplate(JdbcTemplate template){
		this.template = template;
	}
	
	//기본생성자
	public TicketDAO(){
		System.out.println(template);
	}
	
	//티켓구매 위한 메소드 정의
	public void buyTicket(final TicketDTO dto){
		System.out.println("buyTicket() 메소드 호출");
		System.out.println(dto.getConsumerid()+"님이 티켓 "+ dto.getAmount() +"장을 구매합니다.");
		
		//신용카드 결제처리
		template.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection conn) throws SQLException {
				//신용카드 결제내역 인서트
				String query = "insert into transaction_card (consumerid, amount) values (?, ?)";
				PreparedStatement psmt = conn.prepareStatement(query);
				psmt.setString(1, dto.getConsumerid());
				psmt.setString(2, dto.getAmount());
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
				return psmt;
			}
		});
		
	}
}
