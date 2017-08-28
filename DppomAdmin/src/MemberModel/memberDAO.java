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
import javax.servlet.ServletContext;
import javax.sql.DataSource;

public class memberDAO {

   private Connection conn;
   private ResultSet rs;
   private PreparedStatement psmt;
   
   //DB 연결
   public memberDAO( )
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
   public memberDTO selectOne(String id){
      
      memberDTO dto = null;
      
      try{
         String sql = "select id, pass, name, email, phone, univ, major, regidate, point, pass_question, pass_answer, report_cnt, certi_flag  "
               + " from member where id=?";
         System.out.println(sql);
         
         psmt = conn.prepareStatement(sql);
         psmt.setString(1, id);
         
         rs = psmt.executeQuery();
         while(rs.next())
         {
            dto = new memberDTO();
            
            dto.setId(rs.getString(1));
            dto.setPass(rs.getString(2));
            dto.setName(rs.getString(3));
            dto.setEmail(rs.getString(4));
            dto.setPhone(rs.getString(5));
            dto.setUniv(rs.getString(6));
            dto.setMajor(rs.getString(7));
            dto.setRegidate(rs.getDate(8));
            dto.setPoint(rs.getInt(9));
            dto.setPass_question(rs.getString(10));
            dto.setPass_answer(rs.getString(11));
            dto.setReport_cnt(rs.getInt(12));
            dto.setCerti_flag(rs.getString(13));
               
            
         }
      }
      catch(Exception e){
         e.printStackTrace();
         
      }   
         return dto;
   }
   
   //모든 회원 출력
   public List<memberDTO> selectAll(Map<String,Object> map){
      
      List<memberDTO> memberlist = new Vector<memberDTO>();
      
      try{
         String sql = "select id, name, email, univ, major, point, regidate"
               + " from member";
   System.out.println(sql);
         
         psmt = conn.prepareStatement(sql);
         
         rs = psmt.executeQuery();
         while(rs.next())
         {
            memberDTO dto = new memberDTO();
            
            dto.setId(rs.getString(1));
            dto.setName(rs.getString(2));
            dto.setEmail(rs.getString(3));
            dto.setUniv(rs.getString(4));
            dto.setMajor(rs.getString(5));
            dto.setPoint(rs.getInt(6));
            dto.setRegidate(rs.getDate(7));   
            
            memberlist.add(dto);
         }
      }
      catch(Exception e){
         e.printStackTrace();
         
      }   
         return memberlist;
   }      
}