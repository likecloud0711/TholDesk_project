package com.work.sr.cal.dto;

import lombok.Data;

@Data
public class CalDto {
	private int calno; //캘린더 목록 번호
	private String stdt; //이벤트 시작일
	private String eddt; //이벤트 종료일
	private String calname; //이벤트명
	private String place; //장소
	private String memo; //메모
	private String teamno; //부서 번호
}
