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
    						<button type="button" class="btn-close" aria-label="Close"></button>
    					</div>
    				</div>	
    				&nbsp;
  					<div class="row">
    					<div class="col"></div>
    					<div class="col"></div>
    					<div class="col">
    						<select class="form-select q_type" aria-label="Default select example">
  								<option selected>선택하세요</option>
  								<option value="1">객관식</option>
  								<option value="2">장문형</option>
  								<option value="3">단답형</option>
							</select>
    					</div>
  					</div>
  				</div>
			</div>
		</div>	
    </div>
    <div class="col"></div>
</div>

<div class="row" id="question_forms">
</div>
&nbsp;

<!-- 장문형, 단답형 선택시 나오는 텍스트 -->
	<div class="mb-3 i_content" >
  		<label for="exampleFormControlTextarea1" class="form-label">Example textarea</label>
  		<textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
	</div>

<!-- 객관식 선택 시 나타날 라디오 버튼 -->			
<div class="input-group multiple">
	<div class="input-group-text">
    	<input class="form-check-input mt-0" type="radio" value="" aria-label="Radio button for following text input">
  	</div>
  		<input type="text" class="form-control" aria-label="Text input with radio button">
</div>


<!-- 제출 버튼 -->
<div class="row">
    <div class="col"></div>
    <div class="col"></div>
    <div class="col">
    	<button type="submit" class="btn btn-primary">제출</button>
    </div>
</div>
	
<!-- ----------------------------------------------------------------------- 
	<div class="q">
		<p>질문 제목</p>
			<select class="q_type">
				<option value="1">주관식</option>
				<option value="2">객관식</option>
			</select>
		<input type="text" value="" class="q_title">
	</div>
	
	<div class="q">
		<p>질문 제목</p>
			<select class="q_type">
				<option value="1">주관식</option>
				<option value="2">객관식</option>
			</select>
		<input type="text" value="">
	</div>
	-->
<script>
// 추가 버튼 클릭하면 질문 추가됨
$(document).ready(function() {
	  // 추가 버튼 클릭 이벤트 처리
	  $('#add_question_button').click(function() {
		// 현재 폼 개수 확인
		var form_count = $('.question_form').length;
		// 새로운 폼 생성
		var new_form = $('#question_form_1').clone().attr('id', 'question_form_' + (form_count + 1)).show();
		// 새로운 폼 추가
		$('#question_form_' + form_count).after(new_form);
	  });
	});

// 닫기 버튼
$(document).on('click', '.btn-close', function() {
	  $(this).closest('.question_form').hide();
	});
	

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
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>