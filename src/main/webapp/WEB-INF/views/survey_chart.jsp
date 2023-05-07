<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>Hello World</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
    
    $(document).on('click', '.lookChart', function() {
    	let s_idx = $(this).attr('sIdx');
    	$.ajax({
        	url: "/survey-chartData",
        	type: "GET",
        	dataType: "json",
        	success: function(chartInfo) {
        		google.charts.load('current', {'packages':['corechart']});
        		google.charts.setOnLoadCallback(function() {
        			// chartInfo를 사용하여 데이터 구성
        	        var data = new google.visualization.DataTable();
        			data.addColumn('string', 'qType');
        			data.addColumn('string', 'qTitle');
        			data.addColumn('number', 'qIdx');
        			data.addColumn('number', 'iIdx');
        			data.addColumn('string', 'iContent');
        			
        	        <c:forEach var="survey" items="${surveys}">
        	        	<c:forEach var="question" items="${survey.sQuestions}">
        	        		<c:forEach var="responseItem" items="${question.responseItems}">
        	        		data.addRow(['${question.qType}', '${question.qTitle}', ${question.qIdx}, ${responseItem.iIdx}, '${responseItem.iContent}']);
        	        		</c:forEach>
        	        	</c:forEach>
        	        </c:forEach>

        	        var options = {
        	          title: chartInfo.qTitle
        	        };

        	        var chart = new google.visualization.PieChart(document.getElementById('piechart'));
        	        chart.draw(data, options);
        		});
        	},
        	error: function(jqxHR, textStatus, erorThrown) {
        		console.log("Error:", errorThrown);
        	}
    	});  
    });
    </script>
</head>
<body>
	<h1 style="margin-bottom:20px; margin-left:20px; margin-top:20px;">결과 차트</h1>
	
	<div id="piechart" style="width: 900px; height: 500px;"></div>
	
	<button type="button" class="btn btn-link" onclick="location.href='/survey-list'">설문지 전체 목록</button>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>