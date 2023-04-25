package com.sonfirm.example.service;

import java.util.List;

import com.sonfirm.example.domain.Question;
import com.sonfirm.example.domain.Survey;

public interface SurveyService {
	
	//survey 생성
	public void createSurvey(Survey survey);
	
	//survey 목록
	public List<Survey> listSurvey();
	
	//question 생성
	public void createQuestion(Question question);
		
	//question에서 item 생성
	public void createItem(Question question);
}
