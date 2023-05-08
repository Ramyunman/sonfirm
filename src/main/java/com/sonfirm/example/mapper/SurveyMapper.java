package com.sonfirm.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sonfirm.example.domain.Chart;
import com.sonfirm.example.domain.Pagination;
import com.sonfirm.example.domain.Question;
import com.sonfirm.example.domain.Survey;
import com.sonfirm.example.domain.Response;
import com.sonfirm.example.domain.ResponseItem;
import com.sonfirm.example.domain.ResponseQuestion;

@Mapper
public interface SurveyMapper {
	
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
	
	//response survey 생성
	public void createResponse(Response response);
	
	//response question 생성
	public void createResponseQuestion(ResponseQuestion responseQuestion);
		
	//response question 생성
	public void createResponseItem(ResponseQuestion responseQuestion);
	
	//survey 차트 데이터 
	public List<Chart> showChart(int sIdx);

}
