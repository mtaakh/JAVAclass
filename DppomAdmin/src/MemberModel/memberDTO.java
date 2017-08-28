package MemberModel;

import java.sql.Date;

public class memberDTO {
   private String id;
   private String pass;
   private String name;
   private String email;
   private String phone;
   private String univ;
   private String major;
   private java.sql.Date regidate;
   private int point;
   private String pass_question;
   private String pass_answer;
   private int report_cnt;
   private String certi_flag;
   
   public memberDTO(){}
   
   public memberDTO(String id, String pass, String name, String email, String phone, String univ, String major,
         Date regidate, int point, String pass_question, String pass_answer, int report_cnt, String certi_flag) {
      super();
      this.id = id;
      this.pass = pass;
      this.name = name;
      this.email = email;
      this.phone = phone;
      this.univ = univ;
      this.major = major;
      this.regidate = regidate;
      this.point = point;
      this.pass_question = pass_question;
      this.pass_answer = pass_answer;
      this.report_cnt = report_cnt;
      this.certi_flag = certi_flag;
   }

   public String getId() {
      return id;
   }

   public void setId(String id) {
      this.id = id;
   }

   public String getPass() {
      return pass;
   }

   public void setPass(String pass) {
      this.pass = pass;
   }

   public String getName() {
      return name;
   }

   public void setName(String name) {
      this.name = name;
   }

   public String getEmail() {
      return email;
   }

   public void setEmail(String email) {
      this.email = email;
   }

   public String getPhone() {
      return phone;
   }

   public void setPhone(String phone) {
      this.phone = phone;
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

   public java.sql.Date getRegidate() {
      return regidate;
   }

   public void setRegidate(java.sql.Date regidate) {
      this.regidate = regidate;
   }

   public int getPoint() {
      return point;
   }

   public void setPoint(int point) {
      this.point = point;
   }

   public String getPass_question() {
      return pass_question;
   }

   public void setPass_question(String pass_question) {
      this.pass_question = pass_question;
   }

   public String getPass_answer() {
      return pass_answer;
   }

   public void setPass_answer(String pass_answer) {
      this.pass_answer = pass_answer;
   }

   public int getReport_cnt() {
      return report_cnt;
   }

   public void setReport_cnt(int report_cnt) {
      this.report_cnt = report_cnt;
   }

   public String getCerti_flag() {
      return certi_flag;
   }

   public void setCerti_flag(String certi_flag) {
      this.certi_flag = certi_flag;
   }
   
   
   
   
}