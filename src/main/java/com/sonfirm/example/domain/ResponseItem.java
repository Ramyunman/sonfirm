package com.sonfirm.example.domain;

public class ResponseItem {
	
	private int rIdx;				// r_idx
	private int qIdx;				// q_idx
	private int iIdx;				// i_idx
	private String rSubjective;		// r_subjective
	private String iContent;		// i_content
	
	
	public int getrIdx() {
		return rIdx;
	}
	public void setrIdx(int rIdx) {
		this.rIdx = rIdx;
	}
	public int getqIdx() {
		return qIdx;
	}
	public void setqIdx(int qIdx) {
		this.qIdx = qIdx;
	}
	public int getiIdx() {
		return iIdx;
	}
	public void setiIdx(int iIdx) {
		this.iIdx = iIdx;
	}
	public String getrSubjective() {
		return rSubjective;
	}
	public void setrSubjective(String rSubjective) {
		this.rSubjective = rSubjective;
	}
	public String getiContent() {
		return iContent;
	}
	public void setiContent(String iContent) {
		this.iContent = iContent;
	}

	
	

}
