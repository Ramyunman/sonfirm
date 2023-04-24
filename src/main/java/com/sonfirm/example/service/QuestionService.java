package com.sonfirm.example.service;

import java.util.List;

import com.sonfirm.example.domain.Item;
import com.sonfirm.example.domain.Question;

public interface QuestionService {
	
	//question 생성
	public void createQuestion(Question question);
	
	//question에서 item 생성
	public void insertItemToQuestion(List<Item> itemList);
}
