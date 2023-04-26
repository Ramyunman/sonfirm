package com.sonfirm.example.controller;

import org.slf4j.LoggerFactory;


import java.util.List;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonParseException;
import com.sonfirm.example.domain.Pagination;
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
		
	@RequestMapping("/surveyList")
	public String surveyList(Pagination pagination, Model model) {
		List<Survey> surveyList = surveyservice.listSurvey(pagination);
		model.addAttribute("surveyList", surveyList);
		return "/survey_list";
		
	}
	
	
}
