package com.work.gh.chat.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.work.gh.chat.dao.ChatDao;
import com.work.gh.chat.model.ChatMessage;

@Service
public class ChatService {
	
	@Autowired
	ChatDao chatDao;
	
	public int sendMessage(ChatMessage chatMessage) {
		return chatDao.insertChat(chatMessage);
	}
}
