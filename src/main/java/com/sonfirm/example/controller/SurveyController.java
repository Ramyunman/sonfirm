package com.sonfirm.example.controller;

import org.slf4j.LoggerFactory;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sonfirm.example.domain.Survey;
import com.sonfirm.example.service.SurveyService;

@org.springframework.stereotype.Controller
public class SurveyController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired 
	SurveyService surveyservice;
	
	@RequestMapping("/")
	public String home(Model model) {
		
		logger.debug("debug");
		logger.info("info");
		logger.info("error");
		return "/index";
	}
	
	@PostMapping("/submit_survey")
	public String submitSurvey(@RequestBody Survey survey) {
		return "/survey1";
	}
	
	@RequestMapping("/survey2")
	public String survey2() {
		return "/survey2";
	}
}
