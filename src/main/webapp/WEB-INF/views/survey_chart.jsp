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
      var data = new google.visualization.DataTable(
      {
    	  "sIdx": s_idx,
    	  "questions" : [
    		  
    		  {
    			  "qIdx": q_idx,
    			  "qTitle": q_title,
    			  "qType": q_type,
    			  
    			  "items": [
    				  "iIdx":i_idx,
    				  "iContent":i_content,
    				  "cnt": cnt
    			  ]
    			  
    		  }
    	  ]
    	  
      }  
    	  
   );
    
      
      var options = {
        title: 'q_Title'
      };

      var chart = new google.visualization.PieChart(document.getElementById('piechart${status.index}'));
      chart.draw(data, options);
     
    }
    
</script>
</head>

<body>
	<h1 style="margin-bottom:20px; margin-left:20px; margin-top:20px;">결과 차트</h1>
	
	<div class="container text-center">
  		<c:forEach var="data" items="${surveyChart}" varStatus="status">
  			<div class="row">
    			<div class="col">
      				<div id="piechart" style="width: 600px; height: 350px;"></div>
    			</div>
    		</div>
    	</c:forEach>
	</div>
	
	
		
	<button type="button" class="btn btn-link" onclick="location.href='/survey-list'">설문지 전체 목록</button>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>