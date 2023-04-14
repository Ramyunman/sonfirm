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
	
<div class="row">
	<div class="col">
	</div>
	<div class="col">
		<div class="card" style="width: 53rem;">
    		<div class="card-header">
    			<h2>티셔츠신청</h2>
  			</div>
  			<ul class="list-group list-group-flush">
    			<li class="list-group-item">티셔츠를 신청하려면 이름 및 사이즈를 입력하세요.</li>
  			</ul>
		</div>
    </div>
    <div class="col">
    </div>
</div>

&nbsp;
<div class="d-grid gap-2 col-6 mx-auto">
  <button class="btn btn-primary" type="button">질문추가</button>
</div>
&nbsp;

<!-- 설문지 폼 -->
<div class="row">
	<div class="col"></div>
  	<div class="col">
  		<div class="card q" style="width: 53rem;">
  			<div class="card-header">
    			질문을 입력하세요.
			</div>
			<div class="container text-center">
  				<div class="row">
    				<div class="col"></div>
    				<div class="col"></div>
    				<div class="col">
    					<div class="col-sm-auto">
  							<select class="form-select q_type" aria-label="Default select example">
  								<option selected>메뉴를 선택하세요</option>
  								<option value="1">객관식</option>
  								<option value="2">장문형</option>
  								<option value="3">단답형</option>
							</select>
  						</div>
    				</div>
  				</div>
			</div>
			<div class="form-check">
  				<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
  				<label class="form-check-label" for="flexRadioDefault1">
    				Default radio
  				</label>
			</div>
		</div>	
    </div>
    <div class="col"></div>
</div>
&nbsp;

<!-- 설문지 폼 -->
<div class="row">
	<div class="col"></div>
  	<div class="col">
  		<div class="card q" style="width: 53rem;">
  			<div class="card-header">
    			질문을 입력하세요.
			</div>
			<div class="container text-center">
  				<div class="row">
    				<div class="col"></div>
    				<div class="col"></div>
    				<div class="col">
    					<div class="col-sm-auto">
  							<select class="form-select q_type" aria-label="Default select example">
  								<option selected>메뉴를 선택하세요</option>
  									<option value="1">객관식</option>
  									<option value="2">장문형</option>
  									<option value="3">단답형</option>
							</select>
  						</div>
    				</div>
    				<div class="mb-3">
  						<label for="exampleFormControlTextarea1" class="form-label">Example textarea</label>
  						<textarea class="form-control q_title" id="exampleFormControlTextarea1" rows="3"></textarea>
					</div>
  				</div>
			</div>
		</div>	
    </div>
    <div class="col"></div>
</div>
&nbsp;

<!-- 제출 버튼 -->
<div class="row">
    <div class="col"></div>
    <div class="col"></div>
    <div class="col">
    	<button type="submit" class="btn btn-primary">제출</button>
    </div>
</div>
	
<!-- ----------------------------------------------------------------------- -->
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
	
<script>
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