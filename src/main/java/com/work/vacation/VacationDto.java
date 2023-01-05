package com.work.vacation;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data @Getter @Setter
public class VacationDto {
	private int vacno;
	private int empno;
	private int signer1;
	private int signer2;
	private int status;
	private String vacdate;
	private String vacend;
	private String vacstart;
	private int vacstatus;
	
	public String getempnm() {
		String empnm = this.empnm;
		
		return empnm;
	}
	public void setempnm(String empnm) {
		this.empnm = empnm;
	}
	public String getSigner1name() {
		String name = this.signer1name;
		
		return name;
	}
	public void setSigner1name(String name) {
		this.signer1name = name;
	}
	public String getSigner2name() {
		String name = this.signer2name;
		
		return name;
	}
	public void setSigner2name(String name) {
		this.signer2name = name;
	}
	private int vacleft;
	private String empnm;
	private String signer1name;
	private String signer2name;
	
	public int getEmpno() {
		int empno = this.empno;
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	
	public int getSigner1() {
		int signer1 = this.signer1;
		return signer1;
	}
	public void setSigner1(int signer1) {
		this.signer1 = signer1;
	}
	
	public int getSigner2() {
		int signer2 = this.signer2;
		return signer2;
	}
	public void setSigner2(int signer2) {
		this.signer2 = signer2;
	}
	
	public int getStatus() {
		int status = this.status;
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	public int getVacno() {
		int vacno = this.vacno;
		return vacno;
	}
	
	public void setVacno(int vacno) {
		this.vacno = vacno;
	}
	
	public String getVacdate() {
		String vacdate = this.vacdate;
		return vacdate;
	}
	
	public void setVacdate(String vacdate) {
		this.vacdate = vacdate;
	}
	
	public String getVacend() {
		String vacend = this.vacend;
		return vacend;
	}
	
	public void setVacend(String vacend) {
		this.vacend = vacend;
	}
	
	public String getVacstart() {
		String vacstart = this.vacstart;
		return vacstart;
	}
	
	public void setVacstart(String vacstart) {
		this.vacstart = vacstart;
	}
	
	public int getVacstatus() {
		int vacstatus = this.vacstatus;
		return vacstatus;
	}
	public void setVacstatus(int vacstatus) {
		this.vacstatus = vacstatus;
	}
	
	public int getVacleft() {
		int vacleft = this.vacleft;
		return vacleft;
	}
	public void setVacleft(int vacleft) {
		this.vacleft = vacleft;
	}
}
