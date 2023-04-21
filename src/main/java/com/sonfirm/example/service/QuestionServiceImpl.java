package com.sonfirm.example.service;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.sonfirm.example.domain.Question;
import com.sonfirm.example.mapper.QuestionMapper;

@Service
public class QuestionServiceImpl implements QuestionService {

	@Autowired
	QuestionMapper questionMapper;
	
	@Override
	public void createQuestion(Question question) {
		questionMapper.createQuestion(question);
		
	}

}
