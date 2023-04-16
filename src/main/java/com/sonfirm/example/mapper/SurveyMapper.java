package com.sonfirm.example.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.sonfirm.example.domain.Survey;

@Mapper
public interface SurveyMapper {
	
	//survey 생성
	public void createSurvey(Survey survey);

}
