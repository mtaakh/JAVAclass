package ReportModel;

public class ReportDTO 
{
   private int idx;
   private String id;
   private String board_type;
   private String board_title;
   private String reply_content;
   private int report_cnt;
   private String report_reason;
   
   public ReportDTO(){};
   
   public ReportDTO(int idx, String id, String board_type, String board_title, String reply_content, int report_cnt,
         String report_reason) {
      this.idx = idx;
      this.id = id;
      this.board_type = board_type;
      this.board_title = board_title;
      this.reply_content = reply_content;
      this.report_cnt = report_cnt;
      this.report_reason = report_reason;
   }

   public int getIdx() {
      return idx;
   }

   public void setIdx(int idx) {
      this.idx = idx;
   }

   public String getId() {
      return id;
   }

   public void setId(String id) {
      this.id = id;
   }

   public String getBoard_type() {
      return board_type;
   }

   public void setBoard_type(String board_type) {
      this.board_type = board_type;
   }

   public String getBoard_title() {
      return board_title;
   }

   public void setBoard_title(String board_title) {
      this.board_title = board_title;
   }

   public String getReply_content() {
      return reply_content;
   }

   public void setReply_content(String reply_content) {
      this.reply_content = reply_content;
   }

   public int getReport_cnt() {
      return report_cnt;
   }

   public void setReport_cnt(int report_cnt) {
      this.report_cnt = report_cnt;
   }

   public String getReport_reason() {
      return report_reason;
   }

   public void setReport_reason(String report_reason) {
      this.report_reason = report_reason;
   }
}