<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello World</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

	<h1>Hello Survey~!</h1>
	
	<div class="q">
	<p>질문 제목</p>
	<select class="q_type">
	<option value="1">주관식</option>
	<option value="2">객관식</option>
	</select>
	<input type="text" value="" class="q_title">
	</div>
	
	<div class="q">
	<p>질문 제목</p>
	<select class="q_type">
	<option value="1">주관식</option>
	<option value="2">객관식</option>
	</select>
	<input type="text" value="">
	</div>
	
<script>
$(document).on('click','#btn_survey',function() {
	let questions = [];
	
	$('.q').each(function() {
		let q_title = $(this).find('.q_title').val();
		let q_type = $(this).find('q_type:selected').val();
		let items = [];
	
		$('.item', this).each(function() {
			let item_content = $(this).val();
			let item = { content: item_content };
			items.push(item);
		});
	
		let question = { title: q_title, type: q_type, items: items }
		questions.push(question);
	});
	
	let survey = { title: 'Survey Title', desc: 'Survey Description', questions: questions };
	
	$.ajax({
		url: 'submit_survey.php',
		method: 'POST',
		data: survey,
		success: function(response) {
			console.log(response);
		},
		error: function(xhr, status, error) {
			console.log(error);
		}
	});
});
</script>
</body>
</html>