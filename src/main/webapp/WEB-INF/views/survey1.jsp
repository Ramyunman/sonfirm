<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Survey</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<style>





</style>
<body>

	<h1>Hello Survey~!</h1>
	
<div class="container">	
	<div class="row">
		<div class="col"></div>
		<div class="col">
			<div class="card">
  				<div class="card-body">
    				<input class="form-control" type="text" placeholder="설문조사 질문을 입력하세요." aria-label="default input example" style="width: 56rem;">
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
    						<input class="form-control" type="text" placeholder="설문조사 질문을 입력하세요." aria-label="default input example">
    					</div>
    					<div class="col-sm-1">
    						<button type="button" class="btn-close q-close" aria-label="Close"></button>
    					</div>
    				</div>	
  					<div class="row">
    					<div class="col"></div>
    					<div class="col"></div>
    					<div class="col">
    						<select class="form-select q_type" aria-label="Default select example">
  								<option selected>선택하세요</option>
  								<option value="1">객관식</option>
  								<option value="2">단답형</option>
  								<option value="3">장문형</option>
							</select>
    					</div>
    				</div>
    				<!-- 객관식 선택 시 나타날 라디오 버튼 -->			
					<div class="input-group multipleChoice" style="display:none;">
						<div class="input-group-text">
    						<input class="form-check-input mt-0" type="radio" value="" aria-label="Radio button for following text input">
  						</div>
  						<input type="text" class="form-control" aria-label="Text input with radio button">
  						<!-- 객관식에 대한 추가 버튼 -->
    					<button type="button" class="btn btn-primary add-radio-input">추가</button>
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

<div class="row" id="question_forms"></div>
&nbsp;

<!-- 장문형 선택시 나오는 텍스트 -->
<div class="mb-3 longSentence" style="display:none;">
	<textarea class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="답변을 입력하세요."></textarea>
</div>

<!-- 단답형 선택시 나오는 텍스트 -->
<div class="mb-3 shortSentence" style="display:none;">
	<textarea class="form-control" id="exampleFormControlTextarea1" rows="1" placeholder="답변을 입력하세요."></textarea>
</div>

<!-- 객관식 선택 시 나타날 라디오 버튼 -->			
<div class="input-group multipleChoice" style="display:none;">
	<div class="input-group-text">
    	<input class="form-check-input mt-0" type="radio" value="" aria-label="Radio button for following text input">
  	</div>
  	<input type="text" class="form-control" aria-label="Text input with radio button">
</div>

<button type="button" class="btn-close i-close" aria-label="Close" style="display:none;"></button>


<!-- 제출 버튼 -->
<div class="row">
    <div class="col"></div>
    <div class="col"></div>
    <div class="col">
    	<button type="submit" class="btn btn-primary">제출</button>
    </div>
</div>
	
<script>
// 추가 버튼 클릭하면 질문 추가됨
$(document).ready(function() {
	// 추가 버튼 클릭 이벤트 처리
	$('#add_question_button').click(function() {
		// 현재 폼 개수 확인
		var form_count = $('.question_form').length;
		// 새로운 폼 생성
		var new_form = $('#question_form_1').clone().attr('id', 'question_form_' + (form_count + 1)).show();
		// 새로운 객관식 요소 생성, 객관식 요소 추가
		var multiple_choice = $('<div>').addClass('multipleChoice').hide();
		new_form.find('.q_type').after(multiple_choice);
		// 새로운 단답형 요소 생성, 단답형 요소 추가
		var short_sentence = $('<div>').addClass('shortSentence').hide();
		new_form.find('.q_type').after(short_sentence);
		// 새로운 장문형 요소 생성, 장문형 요소 추가
		var long_sentence = $('<div>').addClass('longSentence').hide();
		new_form.find('.q_type').after(long_sentence);
		
		// 새로운 폼 추가
		$('#question_form_' + form_count).after(new_form);
	});
	
	// 질문 형태에 따른 질문지 나오게
	$(document).on('change', '.q_type', function() {
		var selectedOption = $(this).val();
		if (selectedOption == '1') {
			$(this).closest('.question_form').find('.multipleChoice').show();
			$(this).closest('.question_form').find('.shortSentence').hide();
			$(this).closest('.question_form').find('.longSentence').hide();
		} else if (selectedOption == '2') {
			$(this).closest('.question_form').find('.multipleChoice').hide();
			$(this).closest('.question_form').find('.shortSentence').show();
			$(this).closest('.question_form').find('.longSentence').hide();
		} else if (selectedOption == '3'){
			$(this).closest('.question_form').find('.multipleChoice').hide();
			$(this).closest('.question_form').find('.shortSentence').hide();
			$(this).closest('.question_form').find('.longSentence').show();
		} else {
			$(this).closest('.question_form').find('.multipleChoice').hide();
		    $(this).closest('.question_form').find('.shortSentence').hide();
		    $(this).closest('.question_form').find('.longSentence').hide();
		}
	});
});

// Question 닫기 버튼
$(document).on('click', '.q-close', function() {
	  $(this).closest('.question_form').hide();
});
	
//객관식 추가 버튼 클릭 이벤트 핸들러
$(document).on('click', '.add-radio-input', function() {
    // 추가할 라디오버튼과 입력텍스트 생성
    var radio_button = $('<div class="input-group-text"><input class="form-check-input mt-0" type="radio" value="" aria-label="Radio button for following text input"></div>');
    var input_text = $('<input type="text" class="form-control" aria-label="Text input with radio button">');
 	// 객관식 요소 하단에 새로운 라디오버튼과 입력텍스트 추가
    $(this).parent().after($('<div class="input-group multipleChoice"></div>').append(radio_button).append(input_text).append($('<button type="button" class="btn-close i-close" aria-label="Close"></button>')));
});

//Item 닫기 버튼 수정요망
$(document).on('click', '.i-close', function() {
	  $(this).parent().remove();
});
<!-- 
$(document).on('click','#btn_survey',function() {
	let questions = [];
	
	$('.q').each(function() {
		let q_title = $(this).find('.q_title').val();
		let q_type = $(this).find('q_type:selected').val();
		let items = [];
	
		$('.item', this).each(function() {
			let item_content = $(this).val();
			let item = { content: item_content };
			items.push(item);
		});
	
		let question = { title: q_title, type: q_type, items: items }
		questions.push(question);
	});
	
	let survey = { title: 'Survey Title', desc: 'Survey Description', questions: questions };
	
	$.ajax({
		url: 'submit_survey.php',
		method: 'POST',
		data: survey,
		success: function(response) {
			console.log(response);
		},
		error: function(xhr, status, error) {
			console.log(error);
		}
	});
});
-->
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>