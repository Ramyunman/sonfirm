package com.sonfirm.example.domain;

import java.util.List;

public class Question {
	
	private int qIdx;			//q_idx
	private String qTitle;		//q_title
	private String qType;		//q_type	
	private int sIdx;			//s_idx
	private List<Item> qItems;
	private List<ResponseItem> responseItems;
	
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
	public int getsIdx() {
		return sIdx;
	}
	public void setsIdx(int sIdx) {
		this.sIdx = sIdx;
	}
	public List<Item> getqItems() {
		return qItems;
	}
	public void setqItems(List<Item> qItems) {
		this.qItems = qItems;
	}
	public List<ResponseItem> getResponseItems() {
		return responseItems;
	}
	public void setResponseItems(List<ResponseItem> responseItems) {
		this.responseItems = responseItems;
	}
	public int getTotalCount() {		// new
		int totalCount = 0;
		for (ResponseItem item : responseItems) {
			totalCount += item.getItemCount();
		}
		return totalCount;
	}
	
	
}



