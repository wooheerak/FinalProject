package com.kh.FinalProject.studyseat.controller;

import java.util.HashMap;

import org.json.simple.JSONObject;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

/**
 * @class ExampleSend
 * @brief This sample code demonstrate how to send sms through CoolSMS Rest API PHP
 */
public class ExampleSend {
  public static void main(String[] args) {
    String api_key = "NCSU4SUSDGQAJ4NB";
    String api_secret = "ONIC8SHR7QB2KI4C3JX1WLI35BXGX5NJ";
    Message coolsms = new Message(api_key, api_secret);

    // 4 params(to, from, type, text) are mandatory. must be filled
    HashMap<String, String> params = new HashMap<String, String>();
    params.put("to", "01072111601"); // 수신번호
    params.put("from", "01072111601"); // 발신번호
    params.put("type", "SMS"); // Message type ( SMS, LMS, MMS, ATA )
    params.put("text", "이수진님 ! 인증코드는 'test'입니다 !"); // 문자내용    
    params.put("app_version", "JAVA SDK v1.2"); // application name and version
    params.put("charset", "utf-8");
    
    // Optional parameters for your own needs
    // params.put("delay", "10"); // 0~20사이의 값으로 전송지연 시간을 줄 수 있습니다.
    // params.put("country", "KR"); // Korea(KR) Japan(JP) America(USA) China(CN) Default is Korea
    // params.put("datetime", "20140106153000"); // Format must be(YYYYMMDDHHMISS) 2014 01 06 15 30 00 (2014 Jan 06th 3pm 30 00)
    // params.put("mid", "mymsgid01"); // set message id. Server creates automatically if empty
    // params.put("gid", "mymsg_group_id01"); // set group id. Server creates automatically if empty
    // params.put("subject", "Message Title"); // set msg title for LMS and MMS
    // params.put("charset", "euckr"); // For Korean language, set euckr or utf-8

    try {
      JSONObject obj = (JSONObject) coolsms.send(params);
      System.out.println(obj.toString());
    } catch (CoolsmsException e) {
      System.out.println(e.getMessage());
      System.out.println(e.getCode());
    }
  }
}
