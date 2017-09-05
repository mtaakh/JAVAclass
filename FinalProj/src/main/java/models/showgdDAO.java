package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.sql.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletContext;

public class showgdDAO {
	private Connection conn;
	private ResultSet rs;
	private PreparedStatement psmt;
	
	//생성자 메소드 : DB연결
	public showgdDAO(ServletContext context)
	{
		/* 커넥션풀이 아니라 커넥션 객체를 직접 메모리에 생성하는 로직 */
		/*try{
			Class.forName(context.getInitParameter("JDBCDriver"));
			conn = DriverManager.getConnection(context.getInitParameter("ConnectionURL"), "java_user", "1234");
		}
		catch(Exception e){
			e.printStackTrace();
		}*/
		
		/* 커넥션 풀로 변경하기 : 톰캣이 만들어놓은 커넥션객체 가져다 쓰기 */
		try{
			Context ctx = new InitialContext();
			
			/*Context ctx = (Context)initctx.lookup("java:comp/env");
			DataSource source = (DataSource)ctx.lookup("jdbc/myoracle");
			위 두개 라인을 아래와 같이 합쳐서 사용해도 무방하다*/
			
			DataSource source = (DataSource)ctx.lookup("java:comp/env/jdbc/myoracle");
			conn = source.getConnection();
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
	
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
			String sql = "select count(*) from member where id=? and pass=?";
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

	//게시판의 모든 레코드 출력 - showGD
	public List<showgdDTO> selectAllS(Map<String, Object> map){
		
		List<showgdDTO> showGD = new Vector<showgdDTO>();
		try{
			String sql = "select * from (" 
					+	"select Tb.* , rownum rNum "
					+	"from ( "
					+		"select * from showGD ";
					if(map.get("COLUMN")!=null){
							sql += "where "+ map.get("COLUMN") +" like '%"+ map.get("WORD") +"%'";
						}
						sql +=  "order by idx desc "
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
				showgdDTO dto = new showgdDTO();
				
				dto.setIdx(rs.getString(1)); // idx
				dto.setTitle(rs.getString(2)); // title
				dto.setContent(rs.getString(3)); // content
				dto.setId(rs.getString(4)); // id
				dto.setPostdate(rs.getDate(5)); // postdate
				dto.setVisitcount(rs.getString(6)); // visitcount
				
				showGD.add(dto);
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return showGD;
	}
	

	//전체 레코드 수 얻기 - showGD
	public int getTotalShowCount(Map<String,Object> map){
		
		int getTotalShowCount = 0;
		try{
			String sql = "select count(*) from showGD";
			//검색어가 있을경우 검색조건을 쿼리에 추가
			if(map.get("WORD")!=null){
				sql += "where "+ map.get("COLUMN") +" like '%"+ map.get("WORD") +"%'";
			}
			
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			getTotalShowCount = rs.getInt(1);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return getTotalShowCount;
	}


	//게시물 읽기 - 글 상세보기 - showGD
	public showgdDTO selectThis(String idx){
		showgdDTO dto = null;
		try{
			String sql = "select g.*, username from showGD g join "
					+ " members m on m.userid = g.uploader where idx=?";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, idx);
				
				rs = psmt.executeQuery();
				
				if(rs.next()){
					dto = new showgdDTO();
					
					dto.setIdx(rs.getString(1));
					dto.setTitle(rs.getString(2));
					dto.setContent(rs.getString(3));
					dto.setPostdate(rs.getDate(4));
					dto.setId(rs.getString(5));
					dto.setVisitcount(rs.getString(6));
				}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return dto;
		
	}

	//게시물 조회수 세기 - showGD
	public void updateVisitCountS(String num){
		try{
			String sql = "update showGD set visitN = visitN+1 "
					+ "where idx=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, num);
			psmt.executeUpdate();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	
}
