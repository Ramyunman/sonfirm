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
.h1 {
	margin-top: 20px;
	margin-bottom: 20px;
}
/* .form-check 클래스에 대한 스타일 조정 */
.form-check {
  display: flex;
  align-items: center;
}

/* .checkBox 클래스에 대한 스타일 조정 */
.checkBox {
  margin-bottom: 10px;
}

/* 추가된 체크박스의 스타일 조정 */
.checkBox .form-check-input {
  margin-right: 10px;
}

.checkBox .form-control {
  flex: 1;
  width: 45rem;
}

.checkBox .btn-close {
  margin-left: 10px;
}
</style>
<body>

<div class="container">	
	<div class="row justify-content-center">
		<div class="col"></div>
		<div class="col-12 col-md-8">
		<h1>Hello Survey~!</h1>
			<div class="card" style="max-width: 850px; margin-bottom: 10px;">
  				<div class="card-body">
    				<input class="form-control surveyTitle" type="text" placeholder="설문조사 주제를 입력하세요." aria-label="default input example" style="margin-bottom: 10px; padding: 10px;">
					<input class="form-control surveyDesc" type="text" placeholder="주제에 대한 상세내용을 입력하세요." aria-label="default input example" style="padding: 10px;">
  				</div>
			</div>
   		</div>
		<div class="col"></div>
		<button class="btn btn-outline-success" id="add_question_button" type="button" style="max-width: 800px; margin-bottom: 10px;">질문 추가하기</button>
	</div>
</div>




<!-- 설문지 폼 -->
<div class="row question_form" id="question_form_1" style="display:none; margin-bottom:10px;">
	<div class="col"></div>
  	<div class="col">
  		<div class="card" style="width:800px;">
  			<div class="card-body" >
  				<div class="container">
    				<div class="row">
    					<div class="col-sm-11">
    						<input class="form-control questionTitle" type="text" placeholder="설문조사 질문을 입력하세요." aria-label="default input example" style="margin-bottom: 10px;">
    					</div>
    					<div class="col-sm-1">
    						<button type="button" class="btn-close q-close" aria-label="Close"></button>
    					</div>
    				</div>	
  					<div class="row">
    					<div class="col"></div>
    					<div class="col"></div>
    					<div class="col">
    						<select class="form-select selectType" aria-label="Default select example" style="margin-bottom: 10px;">
  								<option selected>선택하세요</option>
  								<option value="objective">객관식</option>
  								<option value="checkbox">체크박스</option>
  								<option value="subjective">주관식</option>
							</select>
    					</div>
    				</div>
    				<!-- 객관식 선택 시 나타날 박스 -->			
					<div class="input-group objectiveBox" style="display:none; margin-bottom:10px">
						<div class="input-group-text">
    						<input class="form-check-input mt-0" type="radio" value="" aria-label="Radio button for following text input">
  						</div>
  						<input type="text" class="form-control" aria-label="Text input with radio button" style="margin-right: 10px;">
  						<!-- 객관식에 대한 추가 버튼 -->
    					<button type="button" class="btn btn-dark add-radio-input">추가</button>
					</div>	
					
					<!-- 체크박스 선택시 나오는 박스 -->
					<div class="form-check checkBox" style="display:none; margin-bottom:10px;">
  						<input class="form-check-input" type="checkbox" value="" id="checkboxNoLabel" aria-label="...">
    					<input type="text" class="form-control" id="exampleFormControlInput1">
    					<!-- 체크박스 추가 버튼 -->
    					<button type="button" class="btn btn-warning add-checkbox" style="margin-left:10px;">추가</button>
					</div>
					
					<!-- 주관식 선택시 나오는 박스 -->
					<div class="mb-3 subjectiveBox" style="display:none;">
						<textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
					</div>
  				</div>
			</div>
		</div>	
    </div>
    <div class="col"></div>
</div>

<div class="row justify-content-center" id="question_forms" style="margin-bottom:10px;"></div>

<button type="button" class="btn-close i-close" aria-label="Close" style="display:none;"></button>

<!-- 제출 버튼 -->
<div class="row">
	<div class="col"></div>
    <div class="col"></div>
    <div class="col">
        <button type="button" class="btn btn-primary submit-survey" style="margin-right:5px;">제출</button>
        <button type="button" class="btn btn-secondary" onclick="location.href='/'">취소</button>
    </div>
</div>

<!-- 모달창 -->
<div class="modal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">설문조사 작성</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <p>설문조사 작성이 완료되었습니다.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary modaltolist" onclick="location.href='/survey-list'">완료</button>
      </div>
    </div>
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
		var new_form = $('#question_form_1').clone().attr('id', 'question_form_'
				+ (form_count + 1)).show();
		
		// 새로운 객관식 요소 생성, 객관식 요소 추가
		var objective_box = $('<div>').addClass('objectiveBox').hide();
		new_form.find('.selectType').after(objective_box);
		
		// 새로운 체크박스 요소 생성, 체크박스 요소 추가
		var check_box = $('<div>').addClass('checkBox').hide();
		new_form.find('.selectType').after(check_box);
		
		// 새로운 주관식 요소 생성, 주관식 요소 추가
		var subjective_box = $('<div>').addClass('subjectiveBox').hide();
		new_form.find('.selectType').after(subjective_box);
		
		// 추가 버튼이 있는 상위 요소에 새로운 폼 추가
		$('#question_forms').append(new_form);
	});
	
	// 질문 형태에 따른 질문지 나오게
	$(document).on('change', '.selectType', function() {
		var selectedOption = $(this).val();
		if (selectedOption == 'objective') {
			$(this).closest('.question_form').find('.objectiveBox').show();
			$(this).closest('.question_form').find('.checkBox').hide();
			$(this).closest('.question_form').find('.subjectiveBox').hide();
		} else if (selectedOption == 'checkbox') {
			$(this).closest('.question_form').find('.objectiveBox').hide();
			$(this).closest('.question_form').find('.checkBox').show();
			$(this).closest('.question_form').find('.subjectiveBox').hide();
		} else if (selectedOption == 'subjective'){
			$(this).closest('.question_form').find('.objectiveBox').hide();
			$(this).closest('.question_form').find('.checkBox').hide();
			$(this).closest('.question_form').find('.subjectiveBox').show();
		} else {
			$(this).closest('.question_form').find('.objectiveBox').hide();
		    $(this).closest('.question_form').find('.checkBox').hide();
		    $(this).closest('.question_form').find('.subjectiveBox').hide();
		}
	});
	
	// Question 닫기 버튼
	$(document).on('click', '.q-close', function() {
		  $(this).closest('.question_form').remove();
	});
	
});


	
//객관식 추가 버튼 클릭 이벤트 핸들러
$(document).on('click', '.add-radio-input', function() {
    // 추가할 객관식버튼과 입력텍스트 생성
    var radio_button = $('<div class="input-group-text" style="margin-bottom: 10px;"><input class="form-check-input mt-0" type="radio" value="" aria-label="Radio button for following text input"></div>');
    var input_text = $('<input type="text" class="form-control" style="margin-bottom: 10px; margin-right: 10px" aria-label="Text input with radio button">');
 	// 객관식 요소 하단에 새로운 라디오버튼과 입력텍스트 추가
    $(this).parent().after($('<div class="input-group objectiveBox"></div>').append(radio_button).append(input_text).append($('<button type="button" class="btn-close i-close" aria-label="Close"></button>')));
});

//체크박스 추가 버튼 클릭 이벤트 핸들러
$(document).on('click', '.add-checkbox', function() {
    // 추가할 체크박스 버튼과 입력텍스트 생성
    var checkbox_button = $('<input class="form-check-input" type="checkbox" value="" id="checkboxNoLabel" aria-label="...">');
    var input_text = $('<input type="text" class="form-control" id="exampleFormControlInput1">');
    var button = $('<button type="button" class="btn btn-close i-close" aria-label="Close"></button>');
 	
    // 새로운 체크박스를 감싸는 div 생성
    var new_checkbox_div = $('<div class="form-check checkBox"></div>').append(checkbox_button).append(input_text).append(button);
    
 	// 현재 클릭한 버튼이 속한 div의 다음에 새로운 체크박스 div 추가
    $(this).closest('.checkBox').after(new_checkbox_div);
});

//Item 닫기 버튼 
$(document).on('click', '.i-close', function() {
	  $(this).parent().remove();
});

// 제출 버튼 실행
$(document).on('click', '.submit-survey', function() {
	let questions = [];
	
	$('.question_form').each(function() {
		let q_title = $(this).find('.questionTitle').val();
		let q_type = $(this).find('.selectType').val();
		let items = [];
	
		if (q_type === 'objective') {
			$('.objectiveBox .form-control', this).each(function() {
				let i_content = $(this).val();
				let item = { iContent: i_content };
				items.push(item);
			});
		} else if (q_type === 'checkbox') {
			$('.checkBox .form-control', this).each(function() {
				let i_content = $(this).val();
				let item = { iContent: i_content };
				items.push(item);
			});
		} else if (q_type === 'subjective') {
			$('.subjectiveBox .form-control', this).each(function() {
				let i_content = $(this).val();
				let item = { iContent: i_content };
				items.push(item);
			});
		}
		
		// 질문이 모두 채워져 있는지 확인 후 추가
		if (q_title !== '' && q_type !== '' && items.length > 0) {
			let questionObj = { qTitle: q_title, qType: q_type, qItems: items }
			questions.push(questionObj);
		}
	});
	
	let s_title = $('.surveyTitle').val();
	let s_desc = $('.surveyDesc').val();
	let survey = { sTitle: s_title, sDesc: s_desc, sQuestions: questions };
	
	console.log(survey);
	
	$.ajax({
		url: "/submit-survey",	// 서버 URL 설정
		type: "POST",	// 전송 방식 설정
		contentType: "application/json",	// 전송 데이터 타입 설정
		data: JSON.stringify(survey),	// 전송할 데이터 설정
		success: function(response) {
			// 서버로부터 응답을 받았을 때 처리할 로직
			console.log('설문조사 작성 완료');
		},
		error: function(xhr, status, error) {
			// 서버 전송 중 오류가 발생했을 때 처리할 로직
			console.log('설문조사 작성 오류');
		}
		
	});
	
});

// 버튼 클릭 이벤트 핸들러
document.querySelector('.submit-survey').addEventListener('click', function() {
  // 모달 창 보이기
  var modal = new bootstrap.Modal(document.querySelector('.modal'));
  modal.show();
});

</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>