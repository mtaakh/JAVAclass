package dppom.model.qna;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class QnADAO 
{
	private Connection conn;
	private ResultSet rs;
	private PreparedStatement psmt;
	
	public QnADAO()
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
	
	public List<QnADTO> selectAll(Map map)
	{
		List<QnADTO> lists = new Vector<QnADTO>();
		try
		{
			String query = "SELECT * FROM recomm ORDER BY idx desc";
			
			psmt = conn.prepareStatement(query);
			rs = psmt.executeQuery();
			while(rs.next())
			{
				int idx = rs.getInt("idx");
				String id = rs.getString("id");
				String pass = rs.getString("pass");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String email = rs.getString("email");
				java.sql.Date regi_date = rs.getDate("regi_date");
				String page_title = rs.getString("page_title");
				String reply_flag = rs.getString("reply_flag");
				String reply = rs.getString("reply");
				java.sql.Date reply_date = rs.getDate("reply_date");
				
				QnADTO dto = new QnADTO(idx, id, pass, title, content, email, regi_date, page_title, reply_flag, reply, reply_date);
				lists.add(dto);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return lists;
	}
}
