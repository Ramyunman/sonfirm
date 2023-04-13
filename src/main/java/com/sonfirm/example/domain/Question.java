package com.sonfirm.example.domain;

import java.util.List;

public class Question {
	
	private int qIdx;			//q_idx
	private String qTitle;		//q_title
	private String qType;		//q_type
	private List<Item> items;
	
	public int getqIdx() {
		return qIdx;
	}
	public void setqIdx(int qIdx) {
		this.qIdx = qIdx;
	}
	public String getqTitle() {
		return qTitle;
	}
	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}
	public String getqType() {
		return qType;
	}
	public void setqType(String qType) {
		this.qType = qType;
	}
	public List<Item> getItems() {
		return items;
	}
	public void setItems(List<Item> items) {
		this.items = items;
	}

	
	
	
	

}
