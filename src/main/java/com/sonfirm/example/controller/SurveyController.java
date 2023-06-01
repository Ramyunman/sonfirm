package com.sonfirm.example.controller;

import org.slf4j.LoggerFactory;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sonfirm.example.domain.Chart;
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
	
	@RequestMapping("/")					// 메인 화면
	public String home(Model model) {
		return "/index";
	}
	
	@RequestMapping("/survey-create")		// 설문지 만드는 화면 보기
	public String surveyCreate() {
		return "/survey_create";
	}
	
	@RequestMapping("/submit-survey")		// 풀 수 있도록 설문지를 작성
	@ResponseBody
	public Survey submitSurvey(@RequestBody Survey survey) {
		surveyservice.createSurvey(survey);		
		return survey;
	}
		
	@RequestMapping("/survey-list")			// 전체 설문지 목록보기
	public String surveyList(Pagination pagination, Model model) {
		int totalSurveyCount = surveyservice.countSurvey();
		pagination.setAmount(totalSurveyCount);
		pagination.init();
		
		List<Survey> surveyList = surveyservice.listSurvey(pagination);
		model.addAttribute("surveyList", surveyList);
		return "/survey_list";
		
	}
	
	@RequestMapping("/survey-paper/{sIdx}")		// 만들어진 설문지를 풀 수 있도록 보여주는 화면.
	public String surveyPaper(@PathVariable("sIdx") int sIdx, Model model) {
		Survey survey = surveyservice.showAllData(sIdx);
		model.addAttribute("surveyPaper", survey);		
		return "/survey_paper";
	}
	
	@RequestMapping("/submit-response")		// 만들어진 설문지를 제출함.
	@ResponseBody
	public Response submitResponse(@RequestBody Response response) {
		surveyservice.createResponse(response);
		return response;
	}
	
	@RequestMapping("/survey-chart")		// 응답한 설문지 결과 데이터를 차트에 뿌리는 역할
	@ResponseBody
	public List<Chart> surveyChart(@RequestBody Chart chart) {
		List<Chart> chartInfo = surveyservice.showChart(chart);
		return chartInfo;
	}
	
	@RequestMapping("/survey-result/{sIdx}")		// 응답한 설문지 결과 차트 보기
	public String surveyResult(@PathVariable("sIdx") int sIdx) {
		return "/survey_result";
	}
	
}
