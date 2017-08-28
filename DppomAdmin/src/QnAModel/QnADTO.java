package QnAModel;

import java.sql.Date;

public class QnADTO 
{
   private int idx;
   private String id;
   private String qna_pass;
   private String board_type;
   private String title;
   private String content;
   private java.sql.Date regidate;
   private String reply_flag;
   private String reply;
   private java.sql.Date reply_date;
   
   public QnADTO(){};
   
   public QnADTO(int idx, String id, String qna_pass, String board_type, String title, String content,
         Date regidate, String reply_flag, String reply, Date reply_date) {
      this.idx = idx;
      this.id = id;
      this.qna_pass = qna_pass;
      this.board_type = board_type;
      this.title = title;
      this.content = content;
      this.regidate = regidate;
      this.reply_flag = reply_flag;
      this.reply = reply;
      this.reply_date = reply_date;
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

   public String getQna_pass() {
      return qna_pass;
   }

   public void setQna_pass(String qna_pass) {
      this.qna_pass = qna_pass;
   }

   public String getBoard_type() {
      return board_type;
   }

   public void setBoard_type(String board_type) {
      this.board_type = board_type;
   }

   public String getTitle() {
      return title;
   }

   public void setTitle(String title) {
      this.title = title;
   }

   public String getContent() {
      return content;
   }

   public void setContent(String content) {
      this.content = content;
   }

   public java.sql.Date getRegidate() {
      return regidate;
   }

   public void setRegidate(java.sql.Date regidate) {
      this.regidate = regidate;
   }

   public String getReply_flag() {
      return reply_flag;
   }

   public void setReply_flag(String reply_flag) {
      this.reply_flag = reply_flag;
   }

   public String getReply() {
      return reply;
   }

   public void setReply(String reply) {
      this.reply = reply;
   }

   public java.sql.Date getReply_date() {
      return reply_date;
   }

   public void setReply_date(java.sql.Date reply_date) {
      this.reply_date = reply_date;
   }
}