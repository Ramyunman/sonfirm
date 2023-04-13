package com.sonfirm.example.domain;

import java.util.List;

public class Survey {
	
	private int sIdx;						//s_idx
	private String sTitle;					//s_title
	private String sDesc;					//s_desc
	private List<Question> questions;
	
	public int getsIdx() {
		return sIdx;
	}
	public void setsIdx(int sIdx) {
		this.sIdx = sIdx;
	}
	public String getsTitle() {
		return sTitle;
	}
	public void setsTitle(String sTitle) {
		this.sTitle = sTitle;
	}
	public String getsDesc() {
		return sDesc;
	}
	public void setsDesc(String sDesc) {
		this.sDesc = sDesc;
	}
	public List<Question> getQuestions() {
		return questions;
	}
	public void setQuestions(List<Question> questions) {
		this.questions = questions;
	}		

}
