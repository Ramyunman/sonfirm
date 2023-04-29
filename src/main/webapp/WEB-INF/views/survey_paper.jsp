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
    			<p class="card-text" >${surveyPaper.sIdx }</p>   <!-- sIdx --> 			
  			</div>
		</div>
		</div>
		<c:forEach var="question" items="${surveyPaper.sQuestions}">
			<div style="display: flex; justify-content: center; margin-bottom:20px" >
    			<div class="card" style="width: 30rem;">
  					<div class="card-body">
    					<h5 class="card-title">${question.qTitle }</h5>
    					<p class="card-text" hidden>${question.qType }</p>
    					<p class="card-text" >${question.qIdx }</p>			<!-- qIdx -->
    						<c:forEach var="item" items="${question.qItems}">
    							<c:choose>
    								<c:when test="${question.qType == 'multi' }">
    									<div class="form-check" style="text-align: left;">
  											<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
  											<label class="form-check-label" for="flexRadioDefault1">
    											${item.iContent }
  											</label>
  											<label class="form-check-label" for="flexRadioDefault1">
    											${item.iIdx }
  											</label>
										</div>
    								</c:when>
    								<c:when test="${question.qType == 'check' }">
    									<div class="form-check" style="text-align: left;">
  											<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
  											<label class="form-check-label" for="flexCheckDefault">
    											${item.iContent }
  											</label>
  											<label class="form-check-label" for="flexCheckDefault">
    											${item.iIdx }
  											</label>
  										</div>
    								</c:when>
    								<c:when test="${question.qType == 'subjective' }">
    									<div class="mb-3" style="text-align: left;">
  											<label for="exampleFormControlTextarea1" class="form-label">내용을 입력하세요.</label>
  											<label for="exampleFormControlTextarea1" class="form-label">${item.iIdx }</label>
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
// 설문지 제출 버튼 
$(document).on('click', '.surveyPaper-submit', function() {
	let S_Idx = '${surveyPaper.sIdx}';
	let Q_Idx = '${question.qIdx}';
	let Q_Type = '${question.qType}';
	let R_Answer = "";
	
	<c:forEach var="item" items="${question.qItems}">
		<c:choose>
			<c:when test="${question.qType == 'multi' }">
				if ($('#' + '${item.iIdx}').is(':checked')) {
					R_Answer += '${item.iContent }' + ",";
				}
			</c:when>
			<c:when test="${question.qType == 'check' }">
				$('input[name="${item.iIdx}"]:checked').each(function() {
					R_Answer += $(this).val() + ",";
				});
			</c:when>
			<c:when test="${question.qType == 'subjective' }">
				R_Answer += $('#${item.iIdx}').val() + ",";
			</c:when>
		</c:choose>
	</c:forEach>
	
	console.log('설문지 작성 제출');
	console.log('S_Idx:', S_Idx);
	console.log('Q_Idx:', Q_Idx);
	console.log('Q_Type:', Q_Type);
	console.log('R_Answer:', R_Answer);
});
</script>

	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>