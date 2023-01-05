package com.work.gh.chat.model;

import java.util.Date;

public class ChatMessage {
	//DTO
	
    private MessageType type; // 메시지 타입
    private String content; // 메시지
    private String sender; // 채팅을 보낸 사람
    private Date date;
    public MessageType getType() {
        return type;
    }

    public void setType(MessageType type) {
        this.type = type;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getSender() {
        return sender;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }
}