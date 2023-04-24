package com.sonfirm.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sonfirm.example.domain.Item;

@Mapper
public interface ItemMapper {
	
	//item 생성
	public void createItem(List<Item> list);

}
