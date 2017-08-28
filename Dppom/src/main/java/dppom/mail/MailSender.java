package dppom.mail;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailSender 
{
	private String fromEmail = "dppom2"; // 보내는사람 구글이메일 아이디
	private String password = "dleowjeo"; // 보내는사람 구글이메일 비번
	
	public static void main(String[] args) 
	{
		// 메인함수 삭제예정
		// 받는사람 이메일
		String email = "pudingchu@naver.com";
		MailMain(email);
	}
	
	public static void MailMain(String email)
	{
		// 1~9 아스키코드 : 49~57
		// A~Z 아스키코드 : 65~90
		String auth = "";
		for(int i = 0; i < 6; i++)
		{
			int random = (int)(Math.random()*26) + 65;
			auth += (char)random;
		}
		String toEmail = email; // 받는 사람 이메일 주소
		String toName = "회원인증"; // 테스터
		String subject = "대뽐 홈페이지 회원인증 이메일입니다!"; // 제목
		String content = "<html><head><meta charset='utf-8'></head>"
				+ "<body>인증키 : " + auth + "</body></html>";
		
		MailSender mail = new MailSender();
		// 받는사람 이멜, 보내는사람이름, 메일제목, 메일내용
		mail.sendMail(toEmail, toName, subject, content);
		
		Temp.result(auth);
	}
	
	public void sendMail(String toEmail, String toName, String subject, String content)
	{
		try
		{
			// 보내는 사람(지메일)의 환경설정 부분
			Properties props = new Properties();
			
			// 접속 환경 설정
			props.put("mail.smtp.starttls", "true");
	        props.put("mail.transport.protocol", "smtp");
	        props.put("mail.smtp.host", "smtp.gmail.com");
	        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	        props.put("mail.smtp.port", "465");
	        props.put("mail.smtp.auth", "true");
	        
	        // 인증 환경 설정
	        MailMain mm = new MailMain(fromEmail, password);
	        Session sess = Session.getDefaultInstance(props, mm);
	        
	        // 메세지 내용 처리
	        MimeMessage msg = new MimeMessage(sess);
	        msg.setHeader("content-type", "text/plain;charset=utf-8");
	        
	        // 보낼 사람
	        msg.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail, toName, "utf-8"));
	        
	        // 보낼 제목
	        msg.setSubject(subject);
	        
	        // 보낼 내용
	        // 이 부분을 html과 plain에 따라서 문서 타입이 바뀐다.
	        msg.setContent(content, "text/html;charset=utf-8");
	        msg.setSentDate(new java.util.Date());
	        
	        Transport.send(msg);
	        
	        System.out.println("전송이 완료되었습니다.");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
