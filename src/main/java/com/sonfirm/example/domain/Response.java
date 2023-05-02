package com.sonfirm.example.domain;

import java.util.List;

public class Response {

	private int rIdx;			// r_idx
	private int sIdx;			// s_idx
	private List<ResponseQuestion> rQuestions;
	
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
	public List<ResponseQuestion> getrQuestions() {
		return rQuestions;
	}
	public void setrQuestions(List<ResponseQuestion> rQuestions) {
		this.rQuestions = rQuestions;
	}

	
	
}
