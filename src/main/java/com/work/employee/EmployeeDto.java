package com.work.employee;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data @Getter @Setter
public class EmployeeDto {
	private int empno;
	private String empnm;
	private String email;
	private String tel;
	private String pwd;
	private String adminyn;
	private String joindate;
	private String grade;
	private String teamno;
	
	
	public String getempnm() {
		String empnm = this.empnm;	
		return empnm;
	}
	public void setempnm(String empnm) {
		this.empnm = empnm;
	}
	
	public String getEmail() {
		String email = this.email;	
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getTel() {
		String tel = this.tel;	
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	public String getPwd() {
		String pwd = this.pwd;	
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
	public String getadminyn() {
		String adminyn = this.adminyn;	
		return adminyn;
	}
	public void setadminyn(String adminyn) {
		this.adminyn = adminyn;
	}
	
	public String getJoindate() {
		String joindate = this.joindate;	
		return joindate;
	}
	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}
	
	public String getGrade() {
		String grade = this.grade;	
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	
	public String getTeamno() {
		String teamno = this.teamno;	
		return teamno;
	}
	public void setTeamno(String teamno) {
		this.teamno = teamno;
	}
	
	public int getEmpno() {
		int empno = this.empno;	
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	
}
