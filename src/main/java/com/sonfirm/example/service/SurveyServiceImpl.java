package com.sonfirm.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sonfirm.example.domain.Survey;
import com.sonfirm.example.mapper.SurveyMapper;

@Service
public class SurveyServiceImpl implements SurveyService {

	@Autowired
	SurveyMapper surveyMapper;

	// survey 생성
	@Override
	public void createSurvey(Survey survey) {
		surveyMapper.createSurvey(survey);
		
	}
	
	

}
