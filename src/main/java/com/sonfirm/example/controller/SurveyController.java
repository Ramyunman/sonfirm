package com.sonfirm.example.controller;

import org.slf4j.LoggerFactory;


import java.util.List;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonParseException;
import com.sonfirm.example.domain.Pagination;
import com.sonfirm.example.domain.Question;
import com.sonfirm.example.domain.Response;
import com.sonfirm.example.domain.ResponseItem;
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
	
	@RequestMapping("/survey-create")		// 설문 작성
	public String surveyCreate() {
		return "/survey_create";
	}
	
	@RequestMapping("/survey-complete")		// 설문 작성 완료	
	public String surveyComplete() {
		return "/survey_complete";
	}
	
	@RequestMapping("/response-complete")	// 설문지 응답 완료
	public String responseComplete() {
		return "/response_complete";
	}
	
	@RequestMapping("/survey-chartData/{sIdx}")		// 설문지 결과차트 
	public String responseChart(@PathVariable("sIdx") int sIdx, Model model) {
		List<ResponseItem> chartInfo = surveyservice.showChart(sIdx);
		model.addAttribute("surveyChart", chartInfo);
		return "/survey_chart";
	}
	
	@RequestMapping("/submit-survey")
	
	@ResponseBody
	public Survey submitSurvey(@RequestBody Survey survey) {
		surveyservice.createSurvey(survey);		
		return survey;
	}
		
	@RequestMapping("/survey-list")
	public String surveyList(Pagination pagination, Model model) {
		int totalSurveyCount = surveyservice.countSurvey();
		pagination.setAmount(totalSurveyCount);
		pagination.init();
		
		List<Survey> surveyList = surveyservice.listSurvey(pagination);
		model.addAttribute("surveyList", surveyList);
		return "/survey_list";
		
	}
	
	@RequestMapping("/survey-paper/{sIdx}")
	public String surveyPaper(@PathVariable("sIdx") int sIdx, Model model) {
		Survey survey = surveyservice.showAllData(sIdx);
		model.addAttribute("surveyPaper", survey);		
		return "/survey_paper";
	}
	
	@RequestMapping("/submit-response")
	@ResponseBody
	public Response submitResponse(@RequestBody Response response) {
		surveyservice.createResponse(response);		
		return response;
	}
	
}
