package BoardModel;

import java.sql.Date;

public class boardDTO {
   private int idx;
   private String id;
   private String univ;
   private String major;
   private String board_type;
   private String category;
   private String title;
   private String content;
   private String attachedfile;
   private java.sql.Date regidate;
   private int click_cnt;
   private int like_cnt;
   private int download_cnt;
   private int report_cnt;
   private int now_party;
   private int total_party;
   
   
   public boardDTO(){}


   public boardDTO(int idx, String id, String univ, String major, String board_type, String category, String title,
         String content, String attachedfile, Date regidate, int click_cnt, int like_cnt, int download_cnt,
         int report_cnt, int now_party, int total_party) {
      super();
      this.idx = idx;
      this.id = id;
      this.univ = univ;
      this.major = major;
      this.board_type = board_type;
      this.category = category;
      this.title = title;
      this.content = content;
      this.attachedfile = attachedfile;
      this.regidate = regidate;
      this.click_cnt = click_cnt;
      this.like_cnt = like_cnt;
      this.download_cnt = download_cnt;
      this.report_cnt = report_cnt;
      this.now_party = now_party;
      this.total_party = total_party;
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


   public String getUniv() {
      return univ;
   }


   public void setUniv(String univ) {
      this.univ = univ;
   }


   public String getMajor() {
      return major;
   }


   public void setMajor(String major) {
      this.major = major;
   }


   public String getBoard_type() {
      return board_type;
   }


   public void setBoard_type(String board_type) {
      this.board_type = board_type;
   }


   public String getCategory() {
      return category;
   }


   public void setCategory(String category) {
      this.category = category;
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


   public String getAttachedfile() {
      return attachedfile;
   }


   public void setAttachedfile(String attachedfile) {
      this.attachedfile = attachedfile;
   }


   public java.sql.Date getRegidate() {
      return regidate;
   }


   public void setRegidate(java.sql.Date regidate) {
      this.regidate = regidate;
   }


   public int getClick_cnt() {
      return click_cnt;
   }


   public void setClick_cnt(int click_cnt) {
      this.click_cnt = click_cnt;
   }


   public int getLike_cnt() {
      return like_cnt;
   }


   public void setLike_cnt(int like_cnt) {
      this.like_cnt = like_cnt;
   }


   public int getDownload_cnt() {
      return download_cnt;
   }


   public void setDownload_cnt(int download_cnt) {
      this.download_cnt = download_cnt;
   }


   public int getReport_cnt() {
      return report_cnt;
   }


   public void setReport_cnt(int report_cnt) {
      this.report_cnt = report_cnt;
   }


   public int getNow_party() {
      return now_party;
   }


   public void setNow_party(int now_party) {
      this.now_party = now_party;
   }


   public int getTotal_party() {
      return total_party;
   }


   public void setTotal_party(int total_party) {
      this.total_party = total_party;
   }   
}