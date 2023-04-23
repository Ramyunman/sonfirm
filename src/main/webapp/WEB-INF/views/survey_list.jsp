<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello World</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="styles.css">
</head>
<style>
h1 {
	margin-top: 20px;
	margin-bottom: 20px;
}

</style>
<body>	
<div class="container text-center">
  <div class="row">
    <div class="col"></div>
    <div class="col-10">
    	<h1>Survey 목록</h1>
		<table class="table">
  			<thead>
    			<tr class="table-dark">
      				<th scope="col">No</th>
      				<th scope="col">Title</th>
      				<th scope="col">Desc</th>
    			</tr>
  			</thead>
  			<tbody>
  				<c:forEach items="${surveyList }" var="survey" varStatus="status">
    				<tr>
      					<td>${survey.sIdx }</td>
      					<td>${survey.sTitle }</td>
      					<td>${survey.sDesc }</td>
    				</tr>
    			</c:forEach>
   			</tbody>
		</table>

		<nav aria-label="Page navigation example">
  			<ul class="pagination">
    			<li class="page-item"><a class="page-link" href="#">Previous</a></li>
   				<li class="page-item"><a class="page-link" href="#">1</a></li>
   				<li class="page-item"><a class="page-link" href="#">2</a></li>
   				<li class="page-item"><a class="page-link" href="#">3</a></li>
   				<li class="page-item"><a class="page-link" href="#">Next</a></li>
  			</ul>
		</nav>
		
    </div>
    <div class="col"></div>
  </div>
</div>




	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>