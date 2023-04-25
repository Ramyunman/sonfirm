package com.sonfirm.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sonfirm.example.domain.Item;
import com.sonfirm.example.domain.Question;

@Mapper
public interface QuestionMapper {
	
	//question 생성
	public void createQuestion(Question question);
	
	//question에서 item 생성
	public void insertItemToQuestion(Question question);
}
