package ex06Mybatis;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.PreparedStatementSetter;

public class MyBoardDAO implements IMyBoardDAO {
	
	//기본생성자
	public MyBoardDAO(){}
	
	//JDBC 기본템플릿 사용하기
	JdbcTemplate template;
	@Autowired
	public void setTemplate(JdbcTemplate template){
		this.template = template;
	}
	
	@Override
	public ArrayList<MyBoardDTO> list() {
		
		System.out.println("Mybatis  한줄게시판 리스트 보기");
		String query = "select * from my_board order by mId desc";
		ArrayList<MyBoardDTO> dtos = 
				(ArrayList<MyBoardDTO>)template.query(query, new BeanPropertyRowMapper<MyBoardDTO>(MyBoardDTO.class));
		return dtos;
	}
	
	@Override
	public void write(final String mWriter, final String mContent) {
		System.out.println("Mybatis 한줄게시판 글쓰기");
		
		this.template.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection conn) throws SQLException {
				String query = "insert into my_board (mId, mWriter, mContent) values (my_seq.nextval, ?, ?)";
				
				PreparedStatement psmt = conn.prepareStatement(query);
				psmt.setString(1, mWriter);
				psmt.setString(2, mContent);
				
				return psmt;
			}
		});
		
	}
	
	@Override
	public MyBoardDTO view(String mId) {
		
		System.out.println("Mybatis 한줄게시판 상세보기");
		
		String query = "select * from my_board where mId="+mId;
		
		return template.queryForObject(query, new BeanPropertyRowMapper<MyBoardDTO>(MyBoardDTO.class));
	}
	
	@Override
	public void delete(final String mId) {
		
		System.out.println("Mybatis 한줄게시판 삭제하기");
		String query = "delete from my_board where mId=?";
		this.template.update(query, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement psmt) throws SQLException {
				psmt.setInt(1, Integer.parseInt(mId));
			}
		});
	}
	
	
}