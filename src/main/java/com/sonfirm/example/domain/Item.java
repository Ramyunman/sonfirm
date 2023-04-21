package com.sonfirm.example.domain;

public class Item {
	
	private int iIdx;			//i_idx
	private String iContent;	//i_content
	private Question question;	//question 객체 추가
	
	public int getiIdx() {
		return iIdx;
	}
	public void setiIdx(int iIdx) {
		this.iIdx = iIdx;
	}
	public String getiContent() {
		return iContent;
	}
	public void setiContent(String iContent) {
		this.iContent = iContent;
	}
	public Question getQuestion() {
		return question;
	}
	public void setQuestion(Question question) {
		this.question = question;
	}
	
	
	
	

}
