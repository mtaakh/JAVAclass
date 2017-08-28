package dppom.model.report;

public class ReportDTO 
{
	private int board_num;
	private int reply_num;
	private String id;
	private int report_count;
	
	public ReportDTO(int board_num, int reply_num, String id, int report_count) {
		super();
		this.board_num = board_num;
		this.reply_num = reply_num;
		this.id = id;
		this.report_count = report_count;
	}
	
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public int getReply_num() {
		return reply_num;
	}
	public void setReply_num(int reply_num) {
		this.reply_num = reply_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getReport_count() {
		return report_count;
	}
	public void setReport_count(int report_count) {
		this.report_count = report_count;
	}
	
}
