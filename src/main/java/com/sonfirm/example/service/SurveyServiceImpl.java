package com.sonfirm.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sonfirm.example.domain.Survey;
import com.sonfirm.example.mapper.SurveyMapper;

@Service
public class SurveyServiceImpl implements SurveyService {

	@Autowired
	SurveyMapper surveyMapper;

	@Override		// survey 생성
	public void createSurvey(Survey survey) {
		surveyMapper.createSurvey(survey);
	}

	@Override		// survey 목록
	public List<Survey> listSurvey() {
		return surveyMapper.listSurvey();
	}
	
	

}
