package dppom.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class MypageController 
{
   @RequestMapping("myHome")
   public String adminHome(Model model)
   {
      System.out.println("마이 페이지 접속(내 포인트조회 디폴트)");
      
      return "mypage/myHome";
   }
   
   @RequestMapping("myModify")
   public String boardAdmin(Model model)
   {
      System.out.println("회원수정");
      
      return "mypage/mymodify/myModify";
   }
   
   @RequestMapping("myOut")
   public String memberAdmin(Model model)
   {
      System.out.println("회원탈퇴1");
      
      return "mypage/mymodify/myOut";
   }
   
   @RequestMapping("myOut2")
   public String memberAdmin2(Model model)
   {
      System.out.println("회원탈퇴2");
      
      return "mypage/mymodify/myOut2";
   }
   
   @RequestMapping("myOut3")
   public String memberAdmin3(Model model)
   {
      System.out.println("회원탈퇴3");
      
      return "mypage/mymodify/myOut3";
   }
   
   @RequestMapping("myWritingList")
   public String reportAdmin(Model model, HttpServletRequest req)
   {
      System.out.println("내글보기");
      
      /*
      model.addAttribute("req", req);
      
      ReportCommand rc = new ReportCommand();
      rc.execute(model);
      */
      
      return "mypage/myWritingList";
   }
   
   @RequestMapping("InfoConfirm")
   public String InfoConfirm(Model model)
   {
      System.out.println("InfoConfirm 접속");
      
      return "mypage/mymodify/InfoConfirm";
   }
}