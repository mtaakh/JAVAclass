package StudyModel;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class studyDAO {

	Connection conn;
	PreparedStatement psmt;
	ResultSet rs;
	
	
	//DB 연결 
	public studyDAO(){

		try
	      {
	         Context ctx = new InitialContext();
	         DataSource source = (DataSource)ctx.lookup("java:comp/env/jdbc/dppom");
	         conn = source.getConnection();
	         System.out.println("DB연결 성공");
	      }
	      catch(Exception e)
	      {
	         System.out.println("DB연결 실패");
	      }
		

	}
	
	//자원 해제
	public void close(){
		try{
			if(rs!=null) rs.close();
			if(psmt != null) psmt.close();
			if(conn != null) conn.close();
		}
		
		catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
	// 어학/자격증  study 테이블 데이터 리스트로 불러오기
		public ArrayList<studyDTO> list(Map<String,Object> map){
			
			ArrayList<studyDTO> lists = new ArrayList<studyDTO>();
			
			try{
				String  query = "SELECT * FROM study";
				psmt = conn.prepareStatement(query);
				
				rs = psmt.executeQuery();
				
				while(rs.next()){
					
				
					int idx = rs.getInt("idx");
					String study_type = rs.getString("study_type");
					String category = rs.getString("category");
					String title = rs.getString("title");
					String content = rs.getString("content");
					String url = rs.getString("url");
					int click_cnt = rs.getInt("click_cnt");

					
					//인자생성자로 데이터 담기 (setter 대신)
					studyDTO dto = new studyDTO(idx, study_type, category, title, content, url,click_cnt);
					lists.add(dto);
				}
			}
			catch(Exception e){
				e.printStackTrace();
			}
			
			return lists;
		}
		
		//작성하기
	/*	public int write(studyDTO dto){
			int affected =0 ;
			try{
				String sql ="insert into study (idx, menu, category, title, contents, url, thumbimg, count) values(study_seq.nextval,?,?,?,?,?,?,0)";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, dto.getMenu());
				psmt.setString(2, dto.getCategory());
				psmt.setString(3, dto.getTitle());
				psmt.setString(4, dto.getContents());
				psmt.setString(5, dto.getUrl());
				affected = psmt.executeUpdate();
			}
			catch(Exception e){
				e.printStackTrace();
			}
			return affected;
		}
		
		//게시글보기
		public studyDTO selectOne(String idx){
			studyDTO dto = null;
			try{
				String sql = "select category, title, contents, url, thumbimg from study where idx=?";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, idx);
				
				rs=psmt.executeQuery();
				if(rs.next()){
					dto = new studyDTO();
					dto.setCategory(rs.getString(1));
					dto.setTitle(rs.getString(2));
					dto.setContents(rs.getString(3));
					dto.setUrl(rs.getString(4));
				}
			}
			catch(Exception e){
				e.printStackTrace();
			}

			return dto;
		}
		
		
		//삭제하기 
		public int delete(String num){
			int affected =0;
			try{
				String sql="delete from study where idx =?";
				psmt= conn.prepareStatement(sql);
				psmt.setString(1, num);
				affected=psmt.executeUpdate();
			}
			catch(Exception e){
				e.printStackTrace();
			}
			
			return affected;
		}
		*/
	
	
	
}
