package com.sonfirm.example.domain;

public class Response {

	private int rIdx;			// r_idx
	private int sIdx;			// s_idx
	private int qIdx;			// q_idx
	private String qType;		// q_Type
	private int iIdx;			// i_idx
	private String rAnswer;		// r_answer
	
	public int getrIdx() {
		return rIdx;
	}
	public void setrIdx(int rIdx) {
		this.rIdx = rIdx;
	}
	public int getsIdx() {
		return sIdx;
	}
	public void setsIdx(int sIdx) {
		this.sIdx = sIdx;
	}
	public int getqIdx() {
		return qIdx;
	}
	public void setqIdx(int qIdx) {
		this.qIdx = qIdx;
	}
	public String getqType() {
		return qType;
	}
	public void setqType(String qType) {
		this.qType = qType;
	}
	public int getiIdx() {
		return iIdx;
	}
	public void setiIdx(int iIdx) {
		this.iIdx = iIdx;
	}
	public String getrAnswer() {
		return rAnswer;
	}
	public void setrAnswer(String rAnswer) {
		this.rAnswer = rAnswer;
	}
	
	
}
