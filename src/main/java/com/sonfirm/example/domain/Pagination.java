package com.sonfirm.example.domain;

public class Pagination {
	private int amount;			// 데이터 총 개수
	private int currentPage;	// 현재 페이지 번호
	private int startIndex;		// 데이터의 시작 인덱스
	private int startPage;		// pagination의 시작 페이지 번호(ex1,6,11) 
	private int endPage;		// pagination의 끝페이지 번호(ex5,10,15)
	private int lastPage;		// ( amount / 화면에 표시할 갯수), 마지막 페이지 번호
	private int prevPage;		// pagination의 이전 목록(이전 페이지 번호)
	private int nextPage;		// pagination의 다음 목록(다음 페이지 번호)
	public static final int pageUnit=5;			// 한번에 볼러 올 pagination 수
	public static final int itemsPerPage=10;	// 한 페이지당 보여줄 데이터 수 
	
	public Pagination() {
		this.currentPage = 1;
	}
	
	public void init() {	// Pagination 객체를 초기화한다.
		startIndex = (currentPage - 1) * itemsPerPage;				//	현재 페이지에서 첫번째 데이터의 인덱스
		startPage = ((currentPage - 1) / pageUnit) * pageUnit + 1;  //	ex) 1,6,11...
		lastPage = (int)Math.ceil(amount / (float)itemsPerPage);	//	제일 마지막페이지
		endPage = startPage + pageUnit - 1;							//	ex) 5,10,15...
		endPage = endPage < lastPage ? endPage : lastPage;			//	정보가 얼마 없을때를 대비
		prevPage = (startPage - pageUnit);		//	5개 나오는 페이지에서 제일 첫번째꺼 ex)1,6,11...에서 6이면 prevPage는 1
		nextPage = (startPage + pageUnit);		//	5개 나오는 페이지에서 제일 첫번째꺼 ex)1,6,11...에서 6이면 nextPage는 11
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	public int getPrevPage() {
		return prevPage;
	}

	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}
	
	

}
