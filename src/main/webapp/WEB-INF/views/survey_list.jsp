<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello World</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
</head>
<style>
.h1 {
	margin-top: 20px;
	margin-bottom: 20px;
}

</style>
<body>	
<div class="container text-center table">
  <div class="row">
    <div class="col"></div>
    <div class="col-10">
    	<button type="button" class="btn btn-outline-success btn-sm" style="float:left; margin-top:5px;" onclick="location.href='/'">Son</button>
    		<h1>Survey 목록</h1>	
			<table class="table table-striped">
  				<thead>
    				<tr class="table">
      					<th scope="col">No</th>
      					<th scope="col">Title</th>
      					<th scope="col">Desc</th>
      					<th scope="col">통계</th>
    				</tr>
  				</thead>
  				<tbody class="table-group-divider">
  					<c:forEach items="${surveyList}" var="survey" varStatus="status">
    					<tr>
      						<td><a href="${pageContext.request.contextPath}/survey-paper/${survey.sIdx}">${survey.sIdx }</a></td>
      						<td>${survey.sTitle }</td>
      						<td>${survey.sDesc }</td>
      						<td><a class="btn btn-primary btn-sm lookChart" sIdx="${survey.sIdx}">결과보기</a></td>
    					</tr>
    				</c:forEach>
   				</tbody>
			</table>
    	
    </div>
    <div class="col"></div>
  </div>
</div>

<div class="container text-center paging">
	<div class="row">
  		<div class="col"></div>
   		<div class="col-10">
  			<nav aria-label="Page navigation example">
				<ul class="pagination">
					<c:choose>
						<c:when test="${ pagination.prevPage < 0 }">
							<li class="page-item" style="display:none"><a class="page-link" href="#">Prev</a></li>
						</c:when>
						<c:when test="${ pagination.prevPage <= pagination.endPage }">
							<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/survey-list?currentPage=${pagination.prevPage}">Prev</a></li>
						</c:when>
					</c:choose>
   					<c:forEach var="i" begin="${ pagination.startPage }" end="${ pagination.endPage }" step="1">
   						<c:choose>
   							<c:when test="${ pagination.currentPage == i}">		<%-- 현재페이지가 i와 같다면 회색으로 나오게 한다. --%>
								<li class="page-item" style="background-color:#ededed;"><a class="page-link" href="#">${i}</a></li>
							</c:when>
							<c:when test="${ pagination.currentPage != i }">	<%-- 현재페이지가 i와 같다면 회색으로 나오게 한다. --%>
								<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/survey-list?currentPage=${i}">${i}</a></li>
							</c:when>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${ pagination.nextPage <= pagination.lastPage }">
							<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/survey-list?currentPage=${pagination.nextPage}">Next</a></li>
						</c:when>
					</c:choose>
				</ul>
			</nav>
   		</div>
   		<div class="col"></div>
	</div>
</div>
	
<script>
$(document).on('click', '.lookChart', function() {
		
	let s_idx = $(this).attr("sIdx");
	let surveyIndex = { sIdx: s_idx };
	
	console.log('차트 데이터 제출');
	console.log(surveyIndex);
	
	$.ajax({
		url: "/survey-chart",
		type: "POST",
		data: JSON.stringify(surveyIndex),
		contentType: 'application/json',
		success: function(data) {
			console.log('차트 데이터 제출 완료');
			console.log(data);
						
			// 데이터 가공
			var chartData = [];
			
			for (var i = 0; i < data.length; i++) {
				var item = data[i];
			    var chartItem = {
			      "qIdx": item.qIdx,
			      "qTitle": item.qTitle,
			      "items": [
			        {
			          "iIdx": item.iIdx,
			          "iContent": item.iContent,
			          "cnt": item.cnt
			        }
			      ]
			    };
			    chartData.push(chartItem);
			}
			
			console.log(chartData);
						
			// 구글 파이 차트 생성
			google.charts.load('current', {'packages':['corechart']});
			google.charts.setOnLoadCallback(drawChart);
			
			function drawChart() {
				var data = new google.visualization.DataTable();
				data.addColumn('string', 'Item');
				data.addColumn('number', 'Count');
				data.addRows(chartData);
				
				var options = {
						title: 'Survey Chart'
				};
				
				var chart = new google.visualization.PieChart(document.getElementById('piechart'));
			    chart.draw(data, options);	
			}
			
			// 차트를 원하는 화면에 표시
			// 예시로 body 태그의 마지막에 차트를 추가하는 코드
			$('body').append('<div id="piechart" style="width: 600px; height: 350px;"></div>');
		},
		error: function(error) {
			console.log('차트 데이터 제출 실패');
		}
	});
});
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>