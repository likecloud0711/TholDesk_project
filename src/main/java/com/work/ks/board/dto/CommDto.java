package com.work.ks.board.dto;

import lombok.Data;

@Data
public class CommDto {
	private int replyno;
	private int empno;
	private String replycont;
	private String replydate;
	private int boardno;
	private String empnm;
}