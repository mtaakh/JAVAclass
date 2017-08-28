package BoardModel;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class boardDAO {
   
   private Connection conn;
   private ResultSet rs;
   private PreparedStatement psmt;
   
   //DB 연결
   public boardDAO( )
   {      
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
   
   //자원 반납
   public void close(){
      try{
         if(rs!=null) rs.close();
         if(psmt!=null) psmt.close();
         if(conn!=null) conn.close();
      }  
      catch(Exception e){
         e.printStackTrace();
      }
   }
   
   //모든 게시판 출력
   public List<boardDTO> selectAll(Map<String,Object> map, String id){
      
      List<boardDTO> boardlist = new Vector<boardDTO>();
      
      try{
         String sql = "select idx, title, category, click_cnt, regidate  "
               + " from board where id=?";
   System.out.println(sql);
         
         psmt = conn.prepareStatement(sql);
         psmt.setString(1, id);
         System.out.println("아이디는? :" + id);
         
         rs = psmt.executeQuery();
         while(rs.next())
         {
            boardDTO dto = new boardDTO();
            
            dto.setIdx(rs.getInt(1));
            dto.setTitle(rs.getString(2));
            dto.setCategory(rs.getString(3));
            dto.setClick_cnt(rs.getInt(4));
            dto.setRegidate(rs.getDate(5));   
            
            boardlist.add(dto);
         }
      }
      catch(Exception e){
         e.printStackTrace();
         
      }   
         return boardlist;
   }
}