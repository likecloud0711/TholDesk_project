package com.work.ks.board.dto;

import lombok.Data;

@Data // 삭제해도 될듯.
public class FileinfoDto {
	
	private String file1; // 파일 업로드 할 때.  원본파일명
	private String file1saved; // 파일 업로드 할 때. 경로.path 
	private String thumb1; // 파일 업로드 할 때. 이름. name
}
