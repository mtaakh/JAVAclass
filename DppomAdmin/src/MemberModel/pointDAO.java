package MemberModel;

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

public class pointDAO {

   private Connection conn;
   private ResultSet rs;
   private PreparedStatement psmt;
   
   //DB 연결
   public pointDAO( )
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
   
   //선택한 회원정보 출력
   public List<pointDTO> selectAll(Map<String,Object> map, String id){
         
         List<pointDTO> memberlist = new Vector<pointDTO>();
      
      try{
         String sql = "SELECT idx, id, detail, useddate, used_type, adjust, total_point "
               + " FROM point WHERE id=? ORDER BY idx desc";
         System.out.println(sql);
         
         psmt = conn.prepareStatement(sql);
         psmt.setString(1, id);
         
         rs = psmt.executeQuery();
         while(rs.next())
         {
            pointDTO dto = new pointDTO();
            
            dto.setIdx(rs.getInt(1));
            dto.setId(rs.getString(2));
            dto.setDetail(rs.getString(3));
            dto.setUseddate(rs.getDate(4));
            dto.setUsed_type(rs.getString(5));
            dto.setAdjust(rs.getInt(6));
            dto.setTotal_point(rs.getInt(7));

            memberlist.add(dto);
         }
      }
      catch(Exception e){
         e.printStackTrace();
      }   
         return memberlist;
   }
}