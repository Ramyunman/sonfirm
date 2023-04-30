package com.sonfirm.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sonfirm.example.domain.Pagination;
import com.sonfirm.example.domain.Question;
import com.sonfirm.example.domain.Survey;
import com.sonfirm.example.domain.Surveyor;

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
	
	//surveyor 생성
	public void createSurveyor(Surveyor surveyor);
}
