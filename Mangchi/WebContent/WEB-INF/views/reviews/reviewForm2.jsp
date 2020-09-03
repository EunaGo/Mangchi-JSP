<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v4.0.1">
    <title> 리뷰 </title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/carousel/">

    <!-- Bootstrap core CSS -->
	<link rel='stylesheet' href='<c:url value="/assets/dist/css/bootstrap.css"/>'>
	<link rel='stylesheet' href='<c:url value="/css/default.css"/>'> 
    <!-- Custom styles for this template -->
    <link href='<c:url value="/css/carousel.css"/>' rel="stylesheet">
    
    <style type="text/css">
    
    body {
	padding-top:7em !important;
	
}
    </style>
    
  </head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	
전체값 : <c:out value="${loginInfo }"/>
	
	
	
	<form id="reviewForm" action="review.do"  method="post">

<table>
	<tr>
	<td> 작성자 : ${loginInfo.nick }  </td>
	<td> 인풋값 : ${loginInfo.idx }  </td>
 	<input type="hidden" class="review_writer" id="review_writer" value="${loginInfo.idx }">
	</tr>
				
	<tr>
	<td>

		받는이 : 게시글에서받아오는파라미터
	<input type="hidden" name="review_receiver" id="review_receiver" value="">
		</td>
	</tr>
			
				
	<tr>
		<td>후기</td>
		<td> <input type="text" name="review_text" id="review_text"></td>
	</tr>
				
				<tr>
					<td>평점</td>
					<td><select name="review_score">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
					</select></td>
				</tr>
		
			<tr>
			<td>리뷰idx</td>
				<td><input type="hidden" name="review_idx"></td>
				
			<td>가입일</td>
				<td><input type="hidden" name="review_regdate" value=""></td>
			</tr>
		
					
				<tr>
					<td> <input type="submit" name="submit" value="글쓰기완료">	</td>
				</tr>

	
</table>
</form>

	
	
	

	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script>window.jQuery || document.write('<script src="<c:url value='/assets/js/vendor/jquery.slim.min.js'/>"><\/script>')</script><script src="<c:url value='/assets/dist/js/bootstrap.bundle.js'/>"></script></body>
<script>

$( document ).ready( function () {
	
	${'#submit'}.click(function () {
		var jb = $('#req_writer').val();
		alert(jb);
		
	});
	
};

</script>