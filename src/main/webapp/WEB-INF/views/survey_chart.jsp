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
      var data = new google.visualization.DataTable();
      data.addColumn('string', 'qIdx');
      data.addColumn('string', 'qTitle');
      data.addColumn('string', 'qType');
      data.addColumn('array', 'items');
      
      var questions= [
    	  {
    		  "qIdx": 1,
    		  "qTitle": "Question 1",
    		  "qType": "Type A",
    		  "items": [
    			  {
    				  "iIdx":1,
    				  "iContent": "Item 1",
    				  "cnt": 10
    			  },
    			  {
    				  "iIdx":2,
    				  "iContent": "Item 2",
    				  "cnt": 5
    			  },
    			  {
    				  "iIdx":3,
    				  "iContent": "Item 3",
    				  "cnt": 10
    			  },
    			  {
    				  "iIdx":4,
    				  "iContent": "Item 4",
    				  "cnt": 10
    			  }
    		  ]
    	  },
    	  {
    		  "qIdx": 2,
    		  "qTitle": "Question 2",
    		  "qType": "Type B",
    		  "items": [
    			  {
    				  "iIdx":5,
    				  "iContent": "Item 5",
    				  "cnt": 8
    			  },
    			  {
    				  "iIdx":6,
    				  "iContent": "Item 6",
    				  "cnt": 5
    			  }
    		  ]
    	  }
      ];
    		  
      for (var i = 0; i < questions.length; i++) {
    	  var question = questions[i];
    	  var items = [];
    	  
    	  for (var j = 0; j < question.items.length; j++) {
    		  var item = question.items[j];
    		  items.push([item.iIdx, item.iContent, item.cnt]);
    	  }
    	  
    	  data.addRow([
    		  question.qIdx,
    		  question.qTitle,
    		  question.qType,
    		  items
    	  ]);
      }		  
     
      var options = {
        title: 'q_Title',
      };

      var chart = new google.visualization.PieChart(document.getElementById('piechart'));
      chart.draw(data, options);
     
    }
    
</script>
</head>

<body>
	<h1 style="margin-bottom:20px; margin-left:20px; margin-top:20px;">결과 차트</h1>
	
    <div id="piechart" style="width: 600px; height: 350px;"></div>
    	
	<button type="button" class="btn btn-link" onclick="location.href='/survey-list'">설문지 전체 목록</button>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>