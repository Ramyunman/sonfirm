package com.sonfirm.example.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sonfirm.example.domain.Question;
import com.sonfirm.example.domain.Survey;
import com.sonfirm.example.mapper.SurveyMapper;

@Service
public class SurveyServiceImpl implements SurveyService {

	@Autowired SurveyMapper surveyMapper;
		
	@Override		// Survey 생성
	public void createSurvey(Survey survey) {
		surveyMapper.createSurvey(survey);
		
		for (Question question : survey.getsQuestions()) {
			question.setsIdx(survey.getsIdx());
			surveyMapper.createQuestion(question);
			surveyMapper.createItem(question);		
		}
	}

	@Override		// Question 생성
	public void createQuestion(Question question) {
		surveyMapper.createQuestion(question);
		
	}

	@Override		// Item 생성
	public void createItem(Question question) {
		surveyMapper.createItem(question);
		
	}
	
	@Override		// Survey 목록
	public List<Survey> listSurvey() {
		return surveyMapper.listSurvey();
	}
	

}
