<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문지 작성</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<style>
.header1 {
	margin-top: 20px;
	margin-bottom: 20px;
	text-align: center;
}

</style>
<body>	
<h1 class="header1">설문지</h1>

<div class="container text-center">
  <div class="row">
    <div class="col"></div>
    <div class="col">
    	<div style="display: flex; justify-content: center; margin-bottom:20px">
    	<div class="card" style="width: 30rem;">
  			<div class="card-body">
    			<h5 class="card-title">${surveyPaper.sTitle }</h5>
    			<p class="card-text">${surveyPaper.sDesc }</p>
    			<p class="card-text survsIdx" hidden="${surveyPaper.sIdx }"></p>   <!-- sIdx --> 			
  			</div>
		</div>
		</div>
		<c:forEach var="question" items="${surveyPaper.sQuestions}">
			<div style="display: flex; justify-content: center; margin-bottom:20px" >
    			<div class="card questionCard" style="width: 30rem;">
  					<div class="card-body">
    					<h5 class="card-title">${question.qTitle }</h5>
    					<p class="card-text quesProp" qIdx="${question.qIdx}"></p>
    						<c:forEach var="item" items="${question.qItems}">
    							<c:choose>
    								<c:when test="${question.qType == 'multi' }">
    								<div class="form-check" style="text-align: left;">
  										<input class="form-check-input" type="radio" name="q${question.qIdx}" id="q${question.qIdx}a${item.iIdx}" iIdx="${item.iIdx}">
  										<label class="form-check-label" for="q${question.qIdx}a${item.iIdx}">
   											${item.iContent }
  										</label>
									</div>
									
    								</c:when>
    								<c:when test="${question.qType == 'check' }">
    									<div class="form-check" style="text-align: left;">
  											<input class="form-check-input" type="checkbox" name="q${question.qIdx}" id="q${question.qIdx}a${item.iIdx}" iIdx="${item.iIdx}">
  											<label class="form-check-label" for="q${question.qIdx}a{item.iIdx}">
    											${item.iContent }
  											</label>
  										</div>
    								</c:when>
    								<c:when test="${question.qType == 'subjective' }">
    									<div class="mb-3" style="text-align: left;">
  											<div class="form-label" iIdx="${item.iIdx }">내용을 입력하세요.</div>
  											<textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
										</div>
    								</c:when>
    							</c:choose>
    						</c:forEach>
  					</div>
				</div>
			</div>
		</c:forEach>
		<div class="d-flex justify-content-end">
			<button type="button" class="btn btn-primary surveyResponse-submit" style="margin-right: 10px">제출</button>
			<button type="button" class="btn btn-secondary" onclick="location.href='/survey-list'">취소</button>
		</div>
    </div>
    <div class="col"></div>
  </div>
</div>

<script>
// 설문지 사용자 제출 버튼 
$(document).on('click', '.surveyResponse-submit', function() {
	let questionList = [];
	
	$('.questionCard').each(function() {
		let q_idx = $(this).find('.quesProp').attr('qIdx');
		let itemList = [];

		if (question.qType === 'multi') {
			let i_idx = $(this).find('input[type="radio"]:checked').attr('iIdx');
			itemList.push(i_idx);
			
		} else if (question.qType === 'check') {
			$(this).find('input[type="checkbox"]:checked').each(function() {
				let i_idx = $(this).attr('iIdx');
				itemList.push(i_idx);
			});
		} else if (question.qType === 'subjective') {
			let i_idx = $(this).find('.form-label').attr('iIdx');
			let r_subjective = $(this).find('textarea').val();
			itemList.push({
				iIdx: i_idx,
				rSubjective: r_subjective,	
			});
		}
		
		questionList.push({
			rItems: itemList,
		});
	});
	
	let s_idx = '${surveyPaper.sIdx}';
	let surveySubmit = { sIdx: s_idx, rQuestions: questionList };
		
	console.log('설문지 작성 제출');
	console.log(surveySubmit);
	
	$.ajax({
		url: '/submit-response',
		type: 'POST',
		data: JSON.stringify(surveySubmit),
		contentType: 'application/json',
		success: function(response) {
			console.log('설문 조사자 제출 완료');
		},
		error: function(error) {
			console.log('설문 조사자 제출 실패');
		}
	});
});
</script>

	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>