package com.sonfirm.example.controller;

import org.slf4j.LoggerFactory;


import java.util.List;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonParseException;
import com.sonfirm.example.domain.Item;
import com.sonfirm.example.domain.Question;
import com.sonfirm.example.domain.Survey;
import com.sonfirm.example.service.SurveyService;

@Controller
public class SurveyController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired SurveyService surveyservice;
	
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
		surveyservice.createSurvey(survey);		
		return survey;
	}
	
	@ExceptionHandler(JsonParseException.class)
	public ResponseEntity<String> handleJsonParseException(JsonParseException ex) {
	    // 예외 처리 로직 구현
	    // ex.getMessage()를 통해 예외 메시지를 가져올 수 있음
	    return ResponseEntity.badRequest().body("Invalid JSON format: " + ex.getMessage());
	}
	
	@RequestMapping("/surveyList")
	public String surveyList(Model model) {
		List<Survey> surveyList = surveyservice.listSurvey();
		model.addAttribute("surveyList", surveyList);
		return "/survey_list";
		
	}
	
	
}
