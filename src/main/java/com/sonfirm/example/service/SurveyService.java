package com.sonfirm.example.service;

import java.util.List;


import com.sonfirm.example.domain.Pagination;
import com.sonfirm.example.domain.Question;
import com.sonfirm.example.domain.Survey;
import com.sonfirm.example.domain.Response;
import com.sonfirm.example.domain.ResponseItem;
import com.sonfirm.example.domain.ResponseQuestion;

public interface SurveyService {
	
	//survey 생성
	public void createSurvey(Survey survey);
	
	//survey 목록
	public List<Survey> listSurvey(Pagination pagination);
	
	//question 생성
	public void createQuestion(Question question);
		
	//item 생성
	public void createItem(Question question);
	
	//survey 갯수 카운트
	public int countSurvey();
	
	//survey 모든 데이터 
	public Survey showAllData(int sIdx);
	
	//response 생성
	public void createResponse(Response response);
	
	//response question 생성
	public void createResponseQuestion(ResponseQuestion responseQuestion);
	
	//response question 생성
	public void createResponseItem(ResponseQuestion responseQuestion);
	
	//survey 차트 데이터 
	public List<Question> showChart(int sIdx);
	
	//survey 차트 데이터2
	public List<ResponseItem> getResponsesBySIdx(int sIdx);
}
