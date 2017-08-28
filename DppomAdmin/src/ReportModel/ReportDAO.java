package ReportModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletContext;
import javax.sql.DataSource;

public class ReportDAO 
{
   private Connection conn;
   private ResultSet rs;
   private PreparedStatement psmt;
   
   public ReportDAO()
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
   
   public void close()
   {
      try
      {
         if(rs != null) rs.close();
         if(psmt != null) psmt.close();
         if(conn != null) conn.close();
      }
      catch(Exception e)
      {
         System.out.println("자원해제 실패");
      }
   }
   
   public List<ReportDTO> selectAll(Map map)
   {
      List<ReportDTO> lists = new Vector<ReportDTO>();
      try
      {
         String query = "SELECT * FROM report";
         
         psmt = conn.prepareStatement(query);
         rs = psmt.executeQuery();
         while(rs.next())
         {
            int idx = rs.getInt("idx");
            String id = rs.getString("id");
            String board_type = rs.getString("board_type");
            String board_title = rs.getString("board_title");
            String reply_content = rs.getString("reply_content");
            int report_cnt = rs.getInt("report_cnt");
            String report_reason = rs.getString("report_reason");
            
            ReportDTO dto = new ReportDTO(idx, id, board_type, board_title, reply_content, report_cnt, report_reason);
            lists.add(dto);
         }
      }
      catch(Exception e)
      {
         e.printStackTrace();
      }
      return lists;
   }
   
   public void delete(String idx)
   {
      try
      {
         String query = "DELETE FROM report WHERE idx=?";
         
         psmt = conn.prepareStatement(query);
         psmt.setString(1, idx);
         psmt.executeUpdate();
      }
      catch(Exception e)
      {
         e.printStackTrace();
      }
   }
}