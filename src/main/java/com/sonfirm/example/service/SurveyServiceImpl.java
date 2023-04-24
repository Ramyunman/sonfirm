package com.sonfirm.example.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sonfirm.example.domain.Item;
import com.sonfirm.example.domain.Question;
import com.sonfirm.example.domain.Survey;
import com.sonfirm.example.mapper.ItemMapper;
import com.sonfirm.example.mapper.SurveyMapper;

@Service
public class SurveyServiceImpl implements SurveyService {

	@Autowired 
	SurveyMapper surveyMapper;
	
	@Autowired 
	QuestionService questionService;
	
	@Autowired
	ItemMapper itemMaper;
	
	@Override		// survey 생성
	public void createSurvey(Survey survey) {
		surveyMapper.createSurvey(survey);
		
		for (Question question : survey.getsQuestions()) {
			question.setSurvey(survey);
			questionService.createQuestion(question);
			
			// Item 객체들은 ItemMapper.xml에서 foreach문을 사용하여 등록
			itemMaper.createItem(question.getqItems());
			
		}
		
	}

	@Override		// survey 목록
	public List<Survey> listSurvey() {
		return surveyMapper.listSurvey();
	}
	
	

}
