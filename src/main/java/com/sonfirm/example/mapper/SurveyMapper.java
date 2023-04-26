package com.sonfirm.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sonfirm.example.domain.Pagination;
import com.sonfirm.example.domain.Question;
import com.sonfirm.example.domain.Survey;

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

}
