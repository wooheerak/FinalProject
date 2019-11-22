package com.kh.FinalProject.user.email;

import org.apache.commons.mail.HtmlEmail;

public class MailUtil {
   
   public static void sendMail(String email, String subject ,String msg) throws Exception{
      
      // Mail Server 설정
      String charSet = "utf-8";
      String hostSMTP ="smtp.naver.com";
      String hostSMTPid= "sungwon000";
      String hostSMTPpwd = "Tjddnjs0000";
      
      // 보내는 사람
      String fromEmail = "sungwon000@naver.com";
      String fromName = "이성원";
      
      // email 전송
      try {
         HtmlEmail mail = new HtmlEmail();
         mail.setDebug(true);
         mail.setCharset(charSet);
         mail.setSSLOnConnect(true);
         mail.setHostName(hostSMTP);
         mail.setSmtpPort(465);
         mail.setAuthentication(hostSMTPid, hostSMTPpwd);
         mail.setStartTLSEnabled(true);
         mail.addTo(email);
         mail.setFrom(fromEmail, fromName, charSet);
         mail.setSubject(subject);
         mail.setHtmlMsg(msg);
         mail.send();
      } catch (Exception e) {
         e.printStackTrace();
      }
   }

}