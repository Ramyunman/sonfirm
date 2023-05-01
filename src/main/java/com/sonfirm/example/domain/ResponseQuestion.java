package com.sonfirm.example.domain;

import java.util.List;

public class ResponseQuestion {
	
	private int rIdx;		// r_idx
	private int qIdx;		// q_idx
	private List<ResponseItem> rItems;
	
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
	public List<ResponseItem> getrItems() {
		return rItems;
	}
	public void setrItems(List<ResponseItem> rItems) {
		this.rItems = rItems;
	}
	
}
