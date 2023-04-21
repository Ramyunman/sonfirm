package com.sonfirm.example.controller;

import org.slf4j.LoggerFactory;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sonfirm.example.domain.Item;
import com.sonfirm.example.domain.Question;
import com.sonfirm.example.domain.Survey;
import com.sonfirm.example.service.ItemService;
import com.sonfirm.example.service.QuestionService;
import com.sonfirm.example.service.SurveyService;

@Controller
public class SurveyController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired 
	SurveyService surveyservice;
	
	@Autowired
	QuestionService questionservice;
	
	@Autowired
	ItemService itemservice;
	
	@RequestMapping("/")
	public String home(Model model) {
		
		logger.debug("debug");
		logger.info("info");
		logger.info("error");
		return "/index";
	}
	
	@RequestMapping("/survey1")
	public String survey1() {
		return "/survey1";
	}
	
	@RequestMapping("/submitSurvey")
	@ResponseBody
	public Survey submitSurvey(@RequestBody Survey survey) {
		// Survey 데이터 등록
		surveyservice.createSurvey(survey);
		
		for (Question question : survey.getsQuestions()) {
			// Question 객체 생성
			Question newQuestion = new Question();
			newQuestion.setqTitle(question.getqTitle());
			newQuestion.setqType(question.getqType());
			newQuestion.setqIdx(question.getqIdx());
			// Question 객체 등록
			questionservice.createQuestion(newQuestion);
			
			for (Item item : question.getqItems()) {
				// Item 객체 생성
				Item newItem = new Item();
				newItem.setiContent(item.getiContent());
				newItem.setiIdx(item.getiIdx());
				// Item 객체 등록
				itemservice.createItem(newItem);
			}
		}
		
		return survey;
	}
	
	
}
