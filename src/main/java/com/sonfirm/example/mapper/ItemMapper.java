package com.sonfirm.example.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.sonfirm.example.domain.Item;

@Mapper
public interface ItemMapper {
	
	//item 생성
	public void createItem(Item item);

}
