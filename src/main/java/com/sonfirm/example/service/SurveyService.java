package com.sonfirm.example.service;

import java.util.List;

import com.sonfirm.example.domain.Survey;

public interface SurveyService {
	
	//survey 생성
	public void createSurvey(Survey survey);
	
	//survey 목록
	public List<Survey> listSurvey();
}
