package com.sonfirm.example.controller;

import org.springframework.web.bind.annotation.RequestMapping;

@org.springframework.stereotype.Controller
public class Controller {

	@RequestMapping("/")
	public String home() {
		return "/index";
	}

	@RequestMapping("/survey1")
	public String survey1() {
		return "/survey1";
	}
	
	@RequestMapping("/survey2")
	public String survey2() {
		return "/survey2";
	}
}
