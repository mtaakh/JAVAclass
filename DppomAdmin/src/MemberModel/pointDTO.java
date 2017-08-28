package MemberModel;

import java.sql.Date;

public class pointDTO {
   
   private int idx;
   private String id;
   private String detail;
   private java.sql.Date useddate;
   private String used_type;
   private int adjust;
   private int total_point;
   
   public pointDTO(){}

   public pointDTO(int idx, String id, String detail, Date useddate, String used_type, int adjust, int total_point) {
      super();
      this.idx = idx;
      this.id = id;
      this.detail = detail;
      this.useddate = useddate;
      this.used_type = used_type;
      this.adjust = adjust;
      this.total_point = total_point;
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

   public String getDetail() {
      return detail;
   }

   public void setDetail(String detail) {
      this.detail = detail;
   }

   public java.sql.Date getUseddate() {
      return useddate;
   }

   public void setUseddate(java.sql.Date useddate) {
      this.useddate = useddate;
   }

   public String getUsed_type() {
      return used_type;
   }

   public void setUsed_type(String used_type) {
      this.used_type = used_type;
   }

   public int getAdjust() {
      return adjust;
   }

   public void setAdjust(int adjust) {
      this.adjust = adjust;
   }

   public int getTotal_point() {
      return total_point;
   }

   public void setTotal_point(int total_point) {
      this.total_point = total_point;
   }
   
   
   
   
}