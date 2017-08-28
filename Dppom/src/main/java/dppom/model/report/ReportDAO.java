package dppom.model.report;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
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
				int board_num = rs.getInt("board_num");
				int reply_num = rs.getInt("reply_num");
				String id = rs.getString("id");
				int report_count = rs.getInt("report_count");
				
				ReportDTO dto = new ReportDTO(board_num, reply_num, id, report_count);
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
