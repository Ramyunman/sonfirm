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
    	  $(document).on('click', '.lookChart', function() {
    	  	let sIdx = $(this).attr('sIdx');
    	  	
    	  $.ajax({
    		  url: "/survey-chartData/" + sIdx,
    		  type: "GET",
    		  dataType: "json",
    		  success: function(response) {
    			  var data = new google.visualization.DataTable();
    			  data.addColumn('number','Question');
    			  data.addColumn('number', 'Option');
    			  data.addColumn('number', 'Count');
    			  $.each(response, function(i, item) {
    				  data.addRow([item.qIdx, item.iIdx, item.cnt]);
    			  });
    			  
    			  var options = {
    			  	title: 'Survey Results',
    			  	is3D: true
    			  };
    			  
    			  var chart = new google.visualization.PieChart(document.getElementById('piechart'));
				  chart.draw(data, options);	  
    		  },
    		  error: function(jqXHR, textStatus, errorThrown) {
    			  console.log("Error:", errorThrown);
    		  }
    	  });       
      }
    </script>
</head>
<body>
	<h1 style="margin-bottom:20px; margin-left:20px; margin-top:20px;">결과 차트</h1>
	
	<div id="piechart" style="width: 900px; height: 500px;"></div>
	
	<button type="button" class="btn btn-link" onclick="location.href='/survey-list'">설문지 전체 목록</button>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>