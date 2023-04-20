package com.sonfirm.example.controller;

import org.slf4j.LoggerFactory;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@RequestMapping("/survey1")
	public String survey1() {
		return "/survey1";
	}
	
	@PostMapping("/submit_survey")
	@ResponseBody
	public Survey submitSurvey(@RequestBody Survey survey) {
		return survey;
	}
	
	
}
