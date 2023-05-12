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

<body>
	<h1 style="margin-bottom:20px; margin-left:20px; margin-top:20px;">결과 차트</h1>
	
    <div class="chart-container"></div>
    	
	<button type="button" class="btn btn-link" onclick="location.href='/survey-list'">설문지 전체 목록</button>

<script>
$(document).ready(function() {
	const url = window.location.href;
	const parts = url.split("/");
	const lastPart = parts[parts.length - 1];
	const param_sIdx = parseInt(lastPart);

	console.log(param_sIdx); 
	
	let s_idx = param_sIdx;
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
				// 이미 동일한 qIdx가 chartData에 존재하는지 확인합니다.
				var existingChartItem = chartData.find(function(chartItem) {
					return chartItem.qIdx === item.qIdx;
				});
				
				if (existingChartItem) {
					// 이미 동일한 qIdx가 있는 경우 해당 chartItem에 새로운 아이템을 추가합니다.
					existingChartItem.items.push({
						"iIdx": item.iIdx,
						"iContent": item.iContent,
						"cnt": item.cnt
					});
				} else {
					//동일한 qIdx가 없는 경우 새로운 chartItem을 생성하고 추가합니다.
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
				
			}
			
			console.log(chartData);
						
			// 구글 파이 차트 생성
			google.charts.load('current', {'packages':['corechart']});
			google.charts.setOnLoadCallback(drawCharts);
			
			function drawCharts() {
				 // 이전 차트 요소 삭제
			    $('.chart-container').remove();
				
				for (var i = 0; i < chartData.length; i++) {
					var item = chartData[i];
					var qIdx = item.qIdx;
					var qTitle = item.qTitle;
					var items = item.items;
										  
					// qIdx 별로 파이차트를 그리기 위한 데이터 생성
					var data = new google.visualization.DataTable();
					data.addColumn('string', 'Item');
					data.addColumn('number', 'Count');
					for (var j = 0; j < items.length; j++) {
						var subItem = items[j];
						data.addRow([subItem.iContent, subItem.cnt]);
					}
					
					var options = {
							title: qTitle
					};
					
					// 파이차트를 표시할 요소 생성
					var chartElement = document.createElement('div');
					chartElement.classList.add('chart-container');
					chartElement.id = 'piechart-' + qIdx;
					chartElement.style.width = '600px';
					chartElement.style.height = '350px';
					document.body.appendChild(chartElement);
					
					// 파이차트 생성 및 표시
					var chart = new google.visualization.PieChart(chartElement);
				    chart.draw(data, options);	
					
				}		
			
			}
		
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