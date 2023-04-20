package com.sonfirm.example.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.csrf.CookieCsrfTokenRepository;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter{
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
			.csrf().disable() // CSRF 방어 비활성화
			.authorizeRequests()
			.antMatchers("/submit_survey").permitAll() // "/submit_survey" 경로에 대한 인증 필요 없음
			.anyRequest().permitAll(); // 나머지 모든 요청에 대해 허용
			
	}

}
