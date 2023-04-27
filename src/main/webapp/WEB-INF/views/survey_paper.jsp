<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문지 작성</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
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
    	<div class="card" style="width: 18rem;">
  			<div class="card-body">
    			<h5 class="card-title">${surveyPaper.sTitle }</h5>
    			<p class="card-text">${surveyPaper.sDesc }</p>
  			</div>
		</div>
		</div>
		<div style="display: flex; justify-content: center;">
    	<div class="card" style="width: 18rem;">
  			<div class="card-body">
    			<h5 class="card-title">${surveyPaper.sTitle }</h5>
    			<p class="card-text">${surveyPaper.sDesc }</p>
  			</div>
		</div>
		</div>
    </div>
    <div class="col"></div>
  </div>
</div>


<!-- c:forEach로 반복해서 question, item을 불러와야하나? -->
<!-- 응답제출 테이블도 만들어야 한다. 체크박스는 다중답변이니 테이블 하나 더 만들어야한다. 외래키 넣어서 -->

	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>