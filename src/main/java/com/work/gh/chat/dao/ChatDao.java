package com.work.gh.chat.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import com.work.gh.chat.model.ChatMessage;

@Mapper
public interface ChatDao {
	//@Insert("insert into chat (sender, content, date) values(#{sender},#{content},now())")
	@Insert("insert into chat (content, date) values(#{content},now())")
	int insertChat(ChatMessage chatMessage);
	
}
