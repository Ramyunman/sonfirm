package com.sonfirm.example.service;

import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sonfirm.example.domain.Pagination;
import com.sonfirm.example.domain.Question;
import com.sonfirm.example.domain.Survey;
import com.sonfirm.example.domain.Response;
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
	public List<Survey> listSurvey(Pagination pagination) {
		return surveyMapper.listSurvey(pagination);
	}

	@Override		//survey 갯수 카운트
	public int countSurvey() {
		return surveyMapper.countSurvey();
	}

	@Override		//survey 모든 데이터
	public Survey showAllData(int sIdx) {
		return surveyMapper.showAllData(sIdx);
	}

	@Override		//response survey 생성
	public void createResponse(Response response) {
		surveyMapper.createResponse(response);
		
	}


	

}
