package com.sonfirm.example.domain;

public class ResponseItem {
	
	private int rIdx;				// r_idx
	private int qIdx;				// q_idx
	private int iIdx;				// i_idx
	private String rSubjective;		// r_subjective
	private int itemCount;			// new
	
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
	public int getItemCount() {			// new
		return itemCount;
	}
	public void setItemCount(int itemCount) {	// new
		this.itemCount = itemCount;
	}
	
	
	
	

}
