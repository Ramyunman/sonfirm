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
    google.charts.setOnLoadCallback(drawChart1);
    google.charts.setOnLoadCallback(drawChart2);
    google.charts.setOnLoadCallback(drawChart3);

    function drawChart1() {

      var data = google.visualization.arrayToDataTable([
    	  ['i_content', 'cnt'],
    	  ['덴버 너기츠', 4],
    	  ['피닉스 선즈', 2],
      ]);

      var options = {
        title: '1.누가 이길까? q_idx, q_title'
      };

      var chart = new google.visualization.PieChart(document.getElementById('piechart'));

      chart.draw(data, options);
    }
    
    function drawChart2() {

        var data = google.visualization.arrayToDataTable([
      	  ['i_content', 'cnt'],
      	  ['데빈 부커', 4],
      	  ['크리스 폴', 3],
      	  ['케빈 듀란트', 6],
        ]);

        var options = {
          title: '2.피닉스에서 주목해야할 선수는?(다중선택가능) q_idx, q_title'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart2'));

        chart.draw(data, options);
      }
    
    function drawChart3() {

        var data = google.visualization.arrayToDataTable([
      	  ['i_content', 'cnt'],
      	  ['니콜라 요키치', 6],
      	  ['애런 고든', 1],
      	  ['자말 머레이', 3],
        ]);

        var options = {
          title: '3.덴버에서 주목해야할 선수는?(다중선택가능) q_idx, q_title'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart3'));

        chart.draw(data, options);
      }
    </script>
</head>

<body>
	<h1 style="margin-bottom:20px; margin-left:20px; margin-top:20px;">결과 차트</h1>
	
	<div class="container text-center">
  		<div class="row">
  			<c:forEach var="data" items="${surveyChart}" varStatus="status">
    			<div class="col">
      				<div id="piechart" style="width: 600px; height: 350px;"></div>
    			</div>
    			<div class="col">
      				<div id="piechart2" style="width: 600px; height: 350px;"></div>
    			</div>
    			<div class="col">
      				<div id="piechart3" style="width: 600px; height: 350px;"></div>
    			</div>
    		</c:forEach>
  		</div>
	</div>
	
	
		
	<button type="button" class="btn btn-link" onclick="location.href='/survey-list'">설문지 전체 목록</button>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>