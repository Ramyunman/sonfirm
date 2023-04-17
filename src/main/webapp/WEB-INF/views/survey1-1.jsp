<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container">	
	<div class="row">
		<div class="col"></div>
		<div class="col">
			<div class="card">
  				<div class="card-body">
    				<input class="form-control" type="text" placeholder="설문조사 질문을 입력하세요." aria-label="default input example" style="width: 56rem;  margin-bottom: 10px;">
					<input class="form-control" type="text" placeholder="질문의 상세내용을 입력하세요." aria-label="default input example" style="width: 56rem;">
  				</div>
			</div>
   		</div>
		<div class="col"></div>
	</div>
</div>

&nbsp;
<div class="d-grid gap-2 col-6 mx-auto">
  <button class="btn btn-outline-success" id="add_question_button" type="button">질문 추가하기</button>
</div>
&nbsp;

<!-- 설문지 폼 -->
<div class="row question_form" id="question_form_1" style="display:none;">
	<div class="col"></div>
  	<div class="col">
  		<div class="card" style="width:58rem;">
  			<div class="card-body q" >
  				<div class="container">
    				<div class="row">
    					<div class="col-sm-11">
    						<input class="form-control" type="text" placeholder="설문조사 질문을 입력하세요." aria-label="default input example" style="margin-bottom: 10px;">
    					</div>
    					<div class="col-sm-1">
    						<button type="button" class="btn-close q-close" aria-label="Close"></button>
    					</div>
    				</div>	
  					<div class="row">
    					<div class="col"></div>
    					<div class="col"></div>
    					<div class="col">
    						<select class="form-select q_type" aria-label="Default select example" style="margin-bottom: 10px;">
  								<option selected>선택하세요</option>
  								<option value="1">객관식</option>
  								<option value="2">단답형</option>
  								<option value="3">장문형</option>
							</select>
    					</div>
    				</div>
    				<!-- 객관식 선택 시 나타날 라디오 버튼 -->			
					<div class="input-group multipleChoice" style="display:none; margin-bottom:10px">
						<div class="input-group-text">
    						<input class="form-check-input mt-0" type="radio" value="" aria-label="Radio button for following text input">
  						</div>
  						<input type="text" class="form-control" aria-label="Text input with radio button" style="margin-right: 10px;">
  						<!-- 객관식에 대한 추가 버튼 -->
    					<button type="button" class="btn btn-dark add-radio-input">추가</button>
					</div>	
					
					<!-- 단답형 선택시 나오는 텍스트 -->
					<div class="mb-3 shortSentence" style="display:none;">
						<textarea class="form-control" id="exampleFormControlTextarea1" rows="1" placeholder="답변을 입력하세요."></textarea>
					</div>
					
					<!-- 장문형 선택시 나오는 텍스트 -->
					<div class="mb-3 longSentence" style="display:none;">
						<textarea class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="답변을 입력하세요."></textarea>
					</div>
  				</div>
			</div>
		</div>	
    </div>
    <div class="col"></div>
</div>

<div class="row" id="question_forms" style="margin-bottom:10px;"></div>

<button type="button" class="btn-close i-close" aria-label="Close" style="display:none;"></button>

<!-- 제출 버튼 -->
<div class="row">
    <div class="col"></div>
    <div class="col"></div>
    <div class="col">
    	<button type="submit" class="btn btn-primary submit">제출</button>
    </div>
</div>