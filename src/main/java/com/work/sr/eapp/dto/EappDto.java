package com.work.sr.eapp.dto;

import lombok.Data;

@Data
public class EappDto {
	private String approvedt; //결재일자
	private String draftdt; // 기안일자
	private int empno; // 전재결재기안자(=사번)
	private int formno; // 양식번호
	private String opcont; //결재내용
	private int opno; // 문서 번호(자동)
	private int opsign1; // 결재자1
	private int opsign2; // 결재자2
	private String optitle; // 전자결재 제목
	private int opstatus; //결재상태 (0 제출, 1 대기, 2승인, 3반려)
	private String reject; // 반려사유 기입
	private String empnm;
	private String grade;
	private String teamnm;
}
