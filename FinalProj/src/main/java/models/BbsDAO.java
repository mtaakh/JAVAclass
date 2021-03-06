package models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

public class BbsDAO {
	private Connection conn;
	private ResultSet rs;
	private PreparedStatement psmt;
	
	//생성자 메소드 : DB연결
	public BbsDAO(ServletContext context)
	{
		/* 커넥션풀이 아니라 커넥션 객체를 직접 메모리에 생성하는 로직 */
		try{
			//Class.forName(context.getInitParameter("JDBCDriver"));
			Class.forName("oracle.jdbc.OracleDriver");
			//conn = DriverManager.getConnection(context.getInitParameter("ConnectionURL"), "PROJECT", "1234");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:orcl", "PROJECT", "1234");
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	public BbsDAO(){}
	
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
	
	//회원여부 판단
	public boolean isMember(String id, String pass){
		try{
			String sql = "select count(*) from members where userid=? and passwd=?";
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, id);
			psmt.setString(2, pass);
			rs = psmt.executeQuery();
			rs.next();
			
			//조회된 회원이 없으면 false 반환
			if(rs.getInt(1)==0) return false;
		}
		catch(Exception e){ // 예외 발생시 무조건 false
			e.printStackTrace();
			return false;
		}
		//조회된 회원이 있으면 true 반환
		return true;
	}
	
	
	//게시판의 모든 레코드 출력 - BBS
	public List<BbsDTO> selectAllB(Map<String, Object> map){
		
		List<BbsDTO> bbs = new Vector<BbsDTO>();
		try{
			String sql = "select * from (" 
			+	"select Tb.* , rownum rNum "
			+	"from ( "
			+		"select B.*, M.username from bbs B join members M "
			+ 		"on B.id = M.userid ";
			if(map.get("COLUMN")!=null){
					sql += "where "+ map.get("COLUMN") +" like '%"+ map.get("WORD") +"%'";
				}
				sql +=  "order by num desc "
			+	")  Tb "
			+") "
			+"where rNum between ? and ? ";
			System.out.println(sql);
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, Integer.parseInt(map.get("start").toString()));
			psmt.setInt(2, Integer.parseInt(map.get("end").toString()));
			
			rs = psmt.executeQuery(); //쿼리실행
			while(rs.next())
			{
				BbsDTO dto = new BbsDTO();
				
				dto.setNum(rs.getString(1)); // num
				dto.setTitle(rs.getString(2)); // title
				dto.setContent(rs.getString(3)); // content
				dto.setId(rs.getString(4)); // id
				dto.setPostdate(rs.getDate(5)); // postdate
				dto.setVisitcount(rs.getString(6)); // visitcount
				dto.setName(rs.getString(7)); // name
				
				bbs.add(dto);
			}
		
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return bbs;
	}
	
	//전체 레코드 수 얻기 - BBS
	public int getTotalRecordCount(Map<String,Object> map){
		
		int totalRecord = 0;
		try{
			String sql = "select count(*) from bbs b join members m on m.userid = b.id ";
			//검색어가 있을경우 검색조건을 쿼리에 추가
			if(map.get("WORD")!=null){
				sql += "where "+ map.get("COLUMN") +" like '%"+ map.get("WORD") +"%'";
			}
			
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			totalRecord = rs.getInt(1);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return totalRecord;
	}
	
	//게시물 쓰기 - 글쓰기
	public int insert(BbsDTO dto){
		int affected = 0;
		try{
			String sql = "insert into bbs (num, title, content, id, postdate, visitcount) values (bbs_idx.nextval, ?, ?, ?, ?, 0)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getId());
			psmt.setDate(4, dto.getPostdate());
			affected = psmt.executeUpdate();
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return affected;
	}
	

	//게시물 읽기 - 글 상세보기 - BBS
	public BbsDTO selectOne(String num){
		BbsDTO dto = null;
		try{
			String sql = "select b.*, name from bbs b join "
					+ " member m on m.userid = b.id where num=?";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, num);
				
				rs = psmt.executeQuery();
				
				if(rs.next()){
					dto = new BbsDTO();
					
					dto.setNum(rs.getString(1));
					dto.setTitle(rs.getString(2));
					dto.setContent(rs.getString(3));
					dto.setId(rs.getString(4));
					dto.setPostdate(rs.getDate(5));
					dto.setVisitcount(rs.getString(6));
					dto.setName(rs.getString(7));
				}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return dto;
		
	}
	
	//게시물 조회수 세기 - BBS
	public void updateVisitCountB(String num){
		try{
			String sql = "update bbs set visitcount=visitcount+1 "
					+ "where num=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, num);
			psmt.executeUpdate();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	//게시물 수정 - 수정하기
	public int update(BbsDTO dto){
		int affected = 0;
	
		try{
			String sql = "update bbs set title=?, content=? "
					+ "where num=?";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getNum());
			
			affected = psmt.executeUpdate();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return affected;
	}
	
	//게시물 삭제 - 삭제하기
	public int delete(String num){
		
		int affected = 0;
		
		try{
			String sql = "delete from bbs where num=?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, num);
			affected = psmt.executeUpdate();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return affected;
	}
	
}
