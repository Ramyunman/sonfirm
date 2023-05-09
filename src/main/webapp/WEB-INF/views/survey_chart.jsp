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
    <script type="text/javascript">
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawChart);

    function drawChart() {
      // Chart 클래스에서 가져온 데이터 가공
	  var chartData = [['i_content', 'cnt']];
      <c:forEach var="data" items="${surveyChart}">
      	chartData.push(['${data.iContent}', ${data.cnt}]);
      </c:forEach>
      
      // Chart 데이터를 DataTable 형태로 변환
      var dataTable = google.visualization.arrayToDataTable(chartData);

      //차트 옵션 설정
      var options = {
        title: '설문조사 결과'
      };

      // PieChart 객체 생성
      var chart = new google.visualization.PieChart(document.getElementById('piechart'));
      
      // 차트 그리기
      chart.draw(dataTable, options);
    }
      
    </script>
</head>
<body>
	<h1 style="margin-bottom:20px; margin-left:20px; margin-top:20px;">결과 차트</h1>
	
	<div class="container text-center">
  		<div class="row">
    		<div class="col">
      			<div id="piechart" style="width: 600px; height: 350px;"></div>
    		</div>
    		<div class="col">
     			Chart
    		</div>
    		<div class="col">
      			Column
    		</div>
  		</div>
	</div>
	
	
		
	<button type="button" class="btn btn-link" onclick="location.href='/survey-list'">설문지 전체 목록</button>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>