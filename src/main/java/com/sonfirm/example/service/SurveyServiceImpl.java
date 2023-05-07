package com.sonfirm.example.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sonfirm.example.domain.Item;
import com.sonfirm.example.domain.Pagination;
import com.sonfirm.example.domain.Question;
import com.sonfirm.example.domain.Survey;
import com.sonfirm.example.domain.Response;
import com.sonfirm.example.domain.ResponseItem;
import com.sonfirm.example.domain.ResponseQuestion;
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

	@Override		//response 생성
	public void createResponse(Response response) {
		surveyMapper.createResponse(response);
		
		for (ResponseQuestion rq : response.getrQuestions()) {
			rq.setrIdx(response.getrIdx());
			surveyMapper.createResponseQuestion(rq);
			surveyMapper.createResponseItem(rq);
			
		}
	}

	@Override		//response question 생성
	public void createResponseQuestion(ResponseQuestion responseQuestion) {
		surveyMapper.createResponseQuestion(responseQuestion);
		
	}

	@Override		//response item 생성
	public void createResponseItem(ResponseQuestion responseQuestion) {
		surveyMapper.createResponseItem(responseQuestion);
		
	}

	@Override		// survey 차트 데이터
	public List<Question> showChart(int sIdx) {
		List<Question> questions = surveyMapper.showChart(sIdx);
		
			questions.forEach(question -> {
				String qType = question.getqType();
				String qTitle = question.getqTitle();
				int qIdx = question.getqIdx();
				
				List<ResponseItem> responseItems = question.getResponseItems();
				responseItems.forEach(responseItem -> {
					int iIdx = responseItem.getiIdx();
					String iContent = responseItem.getiContent();
					
				});				
			});
		
		return questions;
	}
		

}
