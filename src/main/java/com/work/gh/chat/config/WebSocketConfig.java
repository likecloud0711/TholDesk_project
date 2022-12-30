package com.work.gh.chat.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

@Configuration //해당 클래스가 Bean의 설정을 할 것이라는 것을 나타냄
@EnableWebSocketMessageBroker//WebSocket 서버를 활성화하는 데 사용

//implements WebSocketMessageBrokerConfigurer
//웹 소켓 연결을 구성하기 위한 메서드를 구현하고 제공합니다.
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {

	 /*클라이언트가 웹 소켓 서버에 연결하는데 사용할 웹 소켓 엔드포인트 등록
	  withSockJS를 통해 웹 소켓을 지원하지 않는 브라우저에 대해 웹 소켓을 대체한다.*/
    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
    	//특정사용자에게 메시지를 보내려면 stomp 사용
        registry.addEndpoint("/ws").withSockJS();
    }

    /*한 클라이언트에서 다른 클라이언트로 메시지를 라우팅하는데 사용될 메시지 브로커*/
    @Override
    public void configureMessageBroker(MessageBrokerRegistry registry) {
    	// app로 시작되는 메시지는 message-handling methods로 라우팅된다.
    	// 메시지를 발행하는 요청 url => 즉 메시지 보낼 때
        registry.setApplicationDestinationPrefixes("/app");
        //topic으로 시작되는 요청을 구독한 모든 사용자들에게 메시지를 broadcast한다.
        // 메시지를 구독하는 요청 url => 즉 메시지 받을 때
        registry.enableSimpleBroker("/topic");
    }
}