package com.sonfirm.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sonfirm.example.domain.Item;
import com.sonfirm.example.mapper.ItemMapper;

@Service
public class ItemServiceImpl implements ItemService {

	@Autowired
	ItemMapper itemMapper;
	
	@Override
	public void createItem(Item item) {
		itemMapper.createItem(item);
		
	}

}
