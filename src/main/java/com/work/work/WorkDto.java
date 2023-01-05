package com.work.work;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter @Setter @Data
public class WorkDto {
	private int workno;
	private String gowork;
	private String leavework;
	private int status;
	private int empno;
	
	public int getWorkno() {
		int workno = this.workno;
		return workno;
	}
	
	public void setWorkno(int workno) {
		this.workno = workno;
	}
	
	public String getGowork() {
		String gowork = this.gowork;
		return gowork;
	}

	public void setGowork(String gowork) {
		this.gowork = gowork;
	}

	public String getLeavework() {
		String leavework = this.leavework;
		return leavework;
	}

	public void setLeavework(String leavework) {
		this.leavework = leavework;
	}

	public int getStatus() {
		int status = this.status;
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getEmpno() {
		int empno = this.empno;
		return empno;
	}

	public void setEmpno(int empno) {
		this.empno = empno;
	}

}
