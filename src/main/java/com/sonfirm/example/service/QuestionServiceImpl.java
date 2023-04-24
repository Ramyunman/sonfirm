package com.sonfirm.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;


import org.springframework.stereotype.Service;

import com.sonfirm.example.domain.Item;
import com.sonfirm.example.domain.Question;
import com.sonfirm.example.mapper.ItemMapper;
import com.sonfirm.example.mapper.QuestionMapper;

@Service
public class QuestionServiceImpl implements QuestionService {

	@Autowired 
	QuestionMapper questionMapper;	
	
	@Override
	public void createQuestion(Question question) {
		questionMapper.createQuestion(question);
		
		}

	@Override
	public void insertItemToQuestion(List<Item> itemList) {
		questionMapper.insertItemToQuestion(itemList);
		
	}



	
		
}


