package com.sonfirm.example.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.sonfirm.example.domain.Question;

@Mapper
public interface QuestionMapper {
	
	//question 생성
	public void createQuestion(Question question);

}
