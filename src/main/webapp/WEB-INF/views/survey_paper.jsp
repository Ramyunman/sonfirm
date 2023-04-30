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
    			<p class="card-text survsIdx" >${surveyPaper.sIdx }</p>   <!-- sIdx --> 			
  			</div>
		</div>
		</div>
		<c:forEach var="question" items="${surveyPaper.sQuestions}">
			<div style="display: flex; justify-content: center; margin-bottom:20px" >
    			<div class="card questionCard" style="width: 30rem;">
  					<div class="card-body">
    					<h5 class="card-title">${question.qTitle }</h5>
    					<p class="card-text quesProp" qType="${question.qType}" qIdx="${question.qIdx}" qTitle="${question.qTitle}"></p>
    						<c:forEach var="item" items="${question.qItems}">
    							<c:choose>
    								<c:when test="${question.qType == 'multi' }">
    								<div class="form-check" style="text-align: left;">
  										<input class="form-check-input" type="radio" name="q${question.qIdx}" id="q${question.qIdx}a${item.iIdx}" iContent="${item.iContent}">
  										<label class="form-check-label" for="q${question.qIdx}a${item.iIdx}">
   											${item.iContent }
  										</label>
									</div>
									
    								</c:when>
    								<c:when test="${question.qType == 'check' }">
    									<div class="form-check" style="text-align: left;">
  											<input class="form-check-input" type="checkbox" name="q${question.qIdx}" id="q${question.qIdx}a${item.iIdx}" iContent="${item.iContent}">
  											<label class="form-check-label" for="q${question.qIdx}a{item.iIdx}">
    											${item.iContent }
  											</label>
  										</div>
    								</c:when>
    								<c:when test="${question.qType == 'subjective' }">
    									<div class="mb-3" style="text-align: left;">
  											<label for="exampleFormControlTextarea1" class="form-label">내용을 입력하세요.</label>
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
			<button type="button" class="btn btn-primary surveyPaper-submit" style="margin-right: 10px">제출</button>
			<button type="button" class="btn btn-secondary" onclick="location.href='/survey-list'">취소</button>
		</div>
    </div>
    <div class="col"></div>
  </div>
</div>

<script>
// 설문지 사용자 제출 버튼 
$(document).on('click', '.surveyPaper-submit', function() {
	
	let questionList = [];
	
	$('.questionCard').each(function() {
		let q_idx = $(this).find('.quesProp').attr('qIdx');
		let q_type = $(this).find('.quesProp').attr('qType');
		let q_title = $(this).find('.quesProp').attr('qTitle');
		let itemList = [];
		
		if (q_type === 'multi') {
			let r_answer = $(this).find('input[type="radio"]:checked').attr('iContent');
			itemList.push(r_answer);
			
		} else if (q_type === 'check') {
			$(this).find('input[type="checkbox"]:checked').each(function() {
				let c_answer = $(this).attr('iContent');
				itemList.push(c_answer);
			});
		} else if (q_type === 'subjective') {
			let r_answer = $(this).find('textarea').val();
			itemList.push(r_answer);
		}
		
		questionList.push({
			qIdx: q_idx,
			qType: q_type,
			qTitle: q_title,
			qItems: itemList
		});
	});
	
	let s_idx = '${surveyPaper.sIdx}';
	let surveySubmit = { sIdx: s_idx, sQuestions : questionList };
	
	
	
	console.log('설문지 작성 제출');
	console.log(surveySubmit);
	
});
</script>

	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>