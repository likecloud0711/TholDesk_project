package com.work.gh.chat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.stereotype.Controller;

import com.work.gh.chat.model.ChatMessage;
import com.work.gh.chat.service.ChatService;

@Controller
public class ChatController {
	// /chat/sendMessage로 요청이 들어오면 해당 메소드로 처리된다.
    @Autowired
    ChatService service;
    @MessageMapping("/chat.sendMessage")
    @SendTo("/topic/public")
    public ChatMessage sendMessage(@Payload ChatMessage chatMessage) {
    	//insert
    	service.sendMessage(chatMessage);
        return chatMessage;
    }
    // /chat/addUser로 요청이 들어오면 해당 메소드로 처리된다.
    @MessageMapping("/chat.addUser")
    @SendTo("/topic/public")
    public ChatMessage addUser(@Payload ChatMessage chatMessage, SimpMessageHeaderAccessor headerAccessor){
        headerAccessor.getSessionAttributes().put("username", chatMessage.getSender());
        
        //select
        
        return chatMessage;
    }
}
