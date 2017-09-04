package springBoard.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;

//import org.springframework.jdbc.core.BeanPropertyRowMapper;
//import org.springframework.jdbc.core.JdbcTemplate;
//import org.springframework.jdbc.core.PreparedStatementSetter;

public class SpringBbsDAO {
	
	private Connection conn;
	private ResultSet rs;
	private PreparedStatement psmt;
	
	/***********************
	  Spring JDBC 템플릿 사용 
	 ************************/
	JdbcTemplate template;
	
	//생성자 메소드 : 디비연결
	public SpringBbsDAO(){
		try{
			Context ctx = new InitialContext();
			DataSource source = (DataSource)ctx.lookup("java:comp/env/jdbc/myoracle");
			conn = source.getConnection();
			System.out.println("DB연결 성공");
			
			//Spring JDBC 템플릿 사용
			this.template = Constant.template;
		}
		catch(Exception e){
			e.printStackTrace();
			System.out.println("DB연결 실패");
		}
	}
		
		//전체목록 카운트
		public int getTotalCount(Map<String, Object> map){
			
			int totalRecord = 0;
			
			try{
				String query = "select count(*) from spring_board";
				
				/* 검색어가 있을경우 검색조건을 쿼리에 추가
				if(){where 컬럼 like '%검색단어%'} 
				 */
				psmt = conn.prepareStatement(query);
				rs = psmt.executeQuery();
				rs.next();
				totalRecord = rs.getInt(1);
			}
			catch(Exception e){
				e.printStackTrace();
			}
			return totalRecord;
		}
		
		//리스트 보기
		public ArrayList<SpringBbsDTO> list(Map<String, Object> map){
			
			ArrayList<SpringBbsDTO> lists = new ArrayList<SpringBbsDTO>();
			try{
				/*String query = "select idx, name, title, content, postdate, hits, bgroup, bstep, bindent from spring_board "
						+ "order by bgroup desc, bstep asc"; */
				
				String query = "select * from "
						+ "	(select Tb.*, rownum rNum from "
						+ "		(select * from spring_board order by bgroup desc, bstep asc) "
						+ " Tb) "
						+ "where rNum between ? and ?";
				
				psmt = conn.prepareStatement(query);
				psmt.setInt(1, Integer.parseInt(map.get("start").toString()));
				psmt.setInt(2, Integer.parseInt(map.get("end").toString()));
				
				rs = psmt.executeQuery();
				
				while(rs.next()){
					int idx = rs.getInt("idx");
					String name = rs.getString("name");
					String title = rs.getString("title");
					String content = rs.getString("content");
					java.sql.Date postdate = rs.getDate("postdate");
					int hits = rs.getInt("hits");
					int bgroup = rs.getInt("bgroup");
					int bstep = rs.getInt("bstep");
					int bindent = rs.getInt("bindent");
					
					//답글의 깊이를 표현하기 위한 변수
					String replySpace = "";
					//답변글이면 제목앞에 아이콘 붙인다
					if(bindent>0){
						
						for(int i=0; i<=bindent; i++){
							replySpace += "&nbsp;&nbsp;";
						}
						title = replySpace + "<img src='../my_image/re3.gif'>&nbsp;" + title;
					}
					
					//인자생성자 데이터 담기
					SpringBbsDTO dto = new SpringBbsDTO(idx, name, title, content, postdate, hits, bgroup, bstep, bindent);
					lists.add(dto);
				}
			}
			catch(Exception e){
				e.printStackTrace();
			}
			return lists;
		}

		//조회수 증가
		private void updateHit(String pidx){
			try{
				String query = "update spring_board set hits=hits+1 "
						+ "where idx=?";
				psmt = conn.prepareStatement(query);
				psmt.setString(1, pidx);
				
				int rn = psmt.executeUpdate();
			}
			catch(Exception e){
				e.printStackTrace();
			}
		}
		
		//상세보기
		public SpringBbsDTO view(String pidx){
			//조회수증가
			updateHit(pidx);
			
			SpringBbsDTO dto = null;
			try{
				String query = "select * from spring_board where idx=?";
				psmt = conn.prepareStatement(query);
				psmt.setInt(1, Integer.parseInt(pidx));
				rs = psmt.executeQuery();
				
				if(rs.next()){

					int idx = rs.getInt("idx");
					String name = rs.getString("name");
					String title = rs.getString("title");
					String content = rs.getString("content");
					java.sql.Date postdate = rs.getDate("postdate");
					int hits = rs.getInt("hits");
					int bgroup = rs.getInt("bgroup");
					int bstep = rs.getInt("bstep");
					int bindent = rs.getInt("bindent");
					
					//인자생성자
					dto = new SpringBbsDTO(idx, name, title, content, postdate, hits, bgroup, bstep, bindent);
				}
			}
			catch(Exception e){
				e.printStackTrace();
			}
			return dto;
		}
		
		//글쓰기 처리
		public void write(String name, String title, String content, String pass){
			try{
				String query = "insert into spring_board (idx, name, title, content, hits, bgroup, bstep, bindent, pass)"
						+ "values (spring_board_seq.nextval, ?, ?, ?, 0, spring_board_seq.currval, 0, 0, ?)";
				
				psmt = conn.prepareStatement(query);
				psmt.setString(1, name);
				psmt.setString(2, title);
				psmt.setString(3, content);
				psmt.setString(4, pass);
				
				int rn = psmt.executeUpdate();
			}
			catch(Exception e){
				e.printStackTrace();
			}
		}
		
		//패스워드 검증
		public int password(String pidx, String pass){
			int retValue = 0;
			
			try{
				String query = "select * from spring_board where idx=? and pass=?";
				
				psmt = conn.prepareStatement(query);
				psmt.setInt(1, Integer.parseInt(pidx));
				psmt.setString(2, pass);
				rs = psmt.executeQuery();
				
				if(rs.next()){
					//조건에 맞는 게시물이 있다면 idx값은 무조건 0 이상일것
					retValue = rs.getInt("idx");
				}
			}
			catch(Exception e){
				e.printStackTrace();
			}
			
			return retValue;
		}
		
		//수정 처리
		public void modify(String idx, String name, String title, String content, String pass){
			try{
				String query = "update spring_board set name=?, title=?, content=? "
								+ "where idx=? and pass=?";
				
				psmt = conn.prepareStatement(query);
				psmt.setString(1, name);
				psmt.setString(2, title);
				psmt.setString(3, content);
				
				psmt.setInt(4, Integer.parseInt(idx));
				psmt.setString(5, pass);
				
				int rn = psmt.executeUpdate();
			}
			catch(Exception e){
				e.printStackTrace();
			}
		}
		
		//삭제 처리
		public void delete(String idx){
			try{
				String query = "delete from spring_board "
								+ "where idx=?";
				
				psmt = conn.prepareStatement(query);
				psmt.setInt(1, Integer.parseInt(idx));

				int rn = psmt.executeUpdate();
			}
			catch(Exception e){
				e.printStackTrace();
			}
		}

		//답글달기
		public SpringBbsDTO reply(String pidx){
			//조회수증가
			updateHit(pidx);
			
			SpringBbsDTO dto = null;
			try{
				String query = "select * from spring_board where idx=?";
				psmt = conn.prepareStatement(query);
				psmt.setInt(1, Integer.parseInt(pidx));
				rs = psmt.executeQuery();
				
				if(rs.next()){

					int idx = rs.getInt("idx");
					String name = rs.getString("name");
					String title = "[Re:]"+ rs.getString("title");
					String content = 
							"\n\r\n\r\n\r---[원본글]---\n\r" + rs.getString("content");
					java.sql.Date postdate = rs.getDate("postdate");
					int hits = rs.getInt("hits");
					int bgroup = rs.getInt("bgroup");
					int bstep = rs.getInt("bstep");
					int bindent = rs.getInt("bindent");
					
					//인자생성자
					dto = new SpringBbsDTO(idx, name, title, content, postdate, hits, bgroup, bstep, bindent);
				}
			}
			catch(Exception e){
				e.printStackTrace();
			}
			return dto;
		}
		
		//답글처리
		public void reply(String name, String title, String content, String pass, 
							String bgroup, String bstep, String bindent){
			
			//답글쓰기 전 레코드 업데이트
			replyPrevUpdate(bgroup,bstep);
			
			//답글 입력
			try{
				String query =  "insert into spring_board "
						+ "(idx, name, title, content, pass, bgroup, bstep, bindent) "
						+ "values (spring_board_seq.nextval, ?, ?, ?, ?, ?, ?, ?)";
				psmt = conn.prepareStatement(query);
				psmt.setString(1, name);
				psmt.setString(2, title);
				psmt.setString(3, content);
				psmt.setString(4, pass);

				/* 답글은 기존글에 bstep+1, bindent+1 해줘야함
				bgroup : 원본글의 idx값을 입력받게 되어 같은 그룹으로 처리됨
				bstep: 같은 그룹 내에서의 정렬순서
				bindent : 답변글의 깊이(1이라면 첫번째 답글임) */
				psmt.setInt(5, Integer.parseInt(bgroup));
				psmt.setInt(6, Integer.parseInt(bstep)+1);
				psmt.setInt(7, Integer.parseInt(bindent)+1);
				
				int rn = psmt.executeUpdate();
			}
			catch(Exception e){
				e.printStackTrace();
			}
		}
		
		//답글 입력전 레코드 일괄 업데이트
		public void replyPrevUpdate(String strGroup, String strStep){
			/* 현재 답변글이 작성되는 위치를 확인하여 해당 위치보다 큰 레코드를 일괄적으로 +1처리한다. */
			try{
				String query = "update spring_board set bstep=bstep+1 where bgroup=? and bstep=? ";

				psmt = conn.prepareStatement(query);
				psmt.setInt(1, Integer.parseInt(strGroup));
				psmt.setInt(2, Integer.parseInt(strStep));
			}
			catch(Exception e){
				e.printStackTrace();
			}
		}
		
		//자원해제
		public void close(){ // 자원반납
			try{
				if(rs!=null) rs.close();
				if(psmt!=null) psmt.close();
				if(conn!=null) conn.close();
			}
			catch(Exception e){
				e.printStackTrace();
			}
		}
		
		
		
		
		
		
		
		
		
		
		/******************************************
		 * Spring JDBC 템플릿 사용
		 ******************************************/

		public ArrayList<SpringBbsListDTO> listSpJDBC(Map<String, Object> map){
			
			int start = Integer.parseInt(map.get("start").toString());
			int end = Integer.parseInt(map.get("end").toString());
			
			String query = "select * from "
					+ "	(select Tb.*, rownum rNum from "
					+ "		(select * from spring_board order by bgroup desc, bstep asc) "
					+ " Tb) "
					+ "where rNum between "+ start +" and " + end;
			return (ArrayList<SpringBbsListDTO>)template.query(query, new BeanPropertyRowMapper<SpringBbsListDTO>(SpringBbsListDTO.class));
		}

		//전체목록 카운트
		public int getTotalCountSpJDBC(Map<String, Object> map){
			
			String query = "select count(*) from spring_board";
			/* 검색을 위한 쿼리문 추가 */

			return template.queryForObject(query, Integer.class);
		}

		//조회수 증가
		private void updateHitSpJDBC(final String pidx){
			String query = "update spring_board set hits=hits+1 where idx=?";
			this.template.update(query, new PreparedStatementSetter() {
				
				@Override
				public void setValues(PreparedStatement psmt) throws SQLException {
					psmt.setInt(1, Integer.parseInt(pidx));						
				}
			});
		}
		//상세보기
		public SpringBbsDTO viewSpJDBC(String pidx){
			//조회수증가
			updateHitSpJDBC(pidx);
			
			String query = "select * from spring_board where idx="+ pidx;
			return (SpringBbsDTO)template.queryForObject(query, new BeanPropertyRowMapper<SpringBbsDTO>(SpringBbsDTO.class));
		}
		

		//패스워드 검증
		public int passwordSpJDBC(String pidx, String pass){

			int retValue = 0;
			String query = "select * from spring_board where idx="+ pidx +" and pass='"+pass+"'";
			/*
			Spring에서 queryForObject() 사용시 쿼리 결과값이 1이어야 하는데 실제 결과값은 0일때
			org.springframework.dao.EmptyResultDataAccessException: Incorrect 예외가 발생함
			이 경우, 예외처리를 해줘야함
			*/
			try{
			SpringBbsDTO dto = template.queryForObject(query, new BeanPropertyRowMapper<SpringBbsDTO>(SpringBbsDTO.class));
			
			retValue = dto.getIdx();
			}
			catch(Exception e){
				e.printStackTrace();
			}
			return retValue;
		}

		//수정 처리
		public void modifySpJDBC(final String idx, final String name, final String title, final String content, final String pass){
			
			String query = "update spring_board set name=?, title=?, content=? "
					+ "where idx=? and pass=?";
			
			this.template.update(query, new PreparedStatementSetter() {
				
				@Override
				public void setValues(PreparedStatement psmt) throws SQLException {
					psmt.setString(1, name);
					psmt.setString(2, title);
					psmt.setString(3, content);
					psmt.setInt(4, Integer.parseInt(idx));
					psmt.setString(5, pass);
					
				}
			});
		}

		//삭제 처리
		public void deleteSpJDBC(final String idx){

			String query = "delete from spring_board "
							+ "where idx=?";
			
			this.template.update(query, new PreparedStatementSetter() {
				
				@Override
				public void setValues(PreparedStatement psmt) throws SQLException {
					
					psmt.setString(1, idx);
				}
			});
			
		}

		//답글처리
		public void replySpJDBC(final String name, final String title, final String content, final String pass, 
				final String bgroup, final String bstep, final String bindent){
			
			//답글쓰기 전 레코드 업데이트
			replyPrevUpdateSpJDBC(bgroup,bstep);

			String query =  "insert into spring_board "
					+ "(idx, name, title, content, pass, bgroup, bstep, bindent) "
					+ "values (spring_board_seq.nextval, ?, ?, ?, ?, ?, ?, ?)";
			
			this.template.update(query, new PreparedStatementSetter() {
				
				@Override
				public void setValues(PreparedStatement psmt) throws SQLException {
					psmt.setString(1, name);
					psmt.setString(2, title);
					psmt.setString(3, content);
					psmt.setString(4, pass);
					psmt.setInt(5, Integer.parseInt(bgroup));
					psmt.setInt(6, Integer.parseInt(bstep)+1);
					psmt.setInt(7, Integer.parseInt(bindent)+1);
					
				}
			});
		}
		
		//답글 입력전 레코드 일괄 업데이트
		public void replyPrevUpdateSpJDBC(final String strGroup, final String strStep){
			
			String query = "update spring_board set bstep=bstep+1 where bgroup=? and bstep=? ";
			
			this.template.update(query, new PreparedStatementSetter() {
				
				@Override
				public void setValues(PreparedStatement psmt) throws SQLException {
					psmt.setInt(1, Integer.parseInt(strGroup));
					psmt.setInt(2, Integer.parseInt(strStep));
					
					
				}
			});
		}
		
		
}
