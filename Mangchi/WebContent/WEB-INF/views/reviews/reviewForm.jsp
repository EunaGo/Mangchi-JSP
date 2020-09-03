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
    <link href='<c:url value="/css/star.css"/>' rel="stylesheet">
    <style type="text/css">
    
    body {
	padding-top:7em !important;
	
}

.bold{
	font-weight: bold;
}






    </style>
    
  </head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
		<article>

		<div class="container" role="main">

			<h2 class="bold">거래 후기 남기기</h2>

			<br>

			<form id="reviewForm"  method="post" action="review.do">

			<!-- review_writer 작성자 필수 -->
			<input type="hidden" name="review_writer" value="${loginInfo.idx }"> 
			
			<!--  review_receiver 받는이는 게시글에서 가져오기 -->
			<input type="hidden" name="review_receiver" value="${nick.idx }">
			
			
			<!-- review_regdate 게시글작성일은 null로두기[자동으로 서밋할시 now()] -->
			<td><input type="hidden" name="review_regdate" value=""></td>
			
			<!-- req_idx 게시글번호 게시글에서 가져오기 -->
			<td><input type="hidden" name="req_idx" value="${req.req_idx }"></td>
			
			
				<div class="mb-3">

					<label for="title" class="bold" style="color: gray;">거래한 상품</label><br>
					<h4 style="margin-right: 20%;"> ${req.req_title } </h4> 상대방 닉네임 : <c:out value="${nick.nick }"/>
					
				

				</div>

				


				

				<div class="mb-3">

					<label for="content">내용</label>

					<textarea class="form-control" rows="5" name="review_text" id="review_text" placeholder="후기 내용을 입력해 주세요" ></textarea>

				</div>

				

				<div class="mb-3">

					<label for="tag">거래 평점</label>


<span class="star-input">
	<span class="input">
	
    	<input type="radio" name="review_score" value="1" id="p1">
    	<label for="p1">1</label>
    	<input type="radio" name="review_score" value="2" id="p2">
    	<label for="p2">2</label>
    	<input type="radio" name="review_score" value="3" id="p3">
    	<label for="p3">3</label>
    	<input type="radio" name="review_score" value="4" id="p4">
    	<label for="p4">4</label>
    	<input type="radio" name="review_score" value="5" id="p5">
    	<label for="p5">5</label>
    	</select>
  	</span>
  	<output for="star-input"><b>0</b>점</output>						
</span>





				

				</div>
				
			

		<div style="float: right;">
			<input type="submit" class="btn btn-sm btn-primary" name="submit" value="완료">
			<input type="reset" class="btn btn-sm btn-primary" name="submit" value="취소">
			</div>
			</form>


		</div>

	</article>

<br><br><br>

	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script>window.jQuery || document.write('<script src="<c:url value='/assets/js/vendor/jquery.slim.min.js'/>"><\/script>')</script><script src="<c:url value='/assets/dist/js/bootstrap.bundle.js'/>"></script></body>
<!-- <script src="js/star.js"></script> -->

<script>


	
	
	var starRating = function(){
		var $star = $(".star-input"),
		    $result = $star.find("output>b");
			
		  	$(document)
			.on("focusin", ".star-input>.input", 
				function(){
		   		 $(this).addClass("focus");
		 	})
				 
		   	.on("focusout", ".star-input>.input", function(){
		    	var $this = $(this);
		    	setTimeout(function(){
		      		if($this.find(":focus").length === 0){
		       			$this.removeClass("focus");
		     	 	}
		   		}, 100);
		 	 })
		  
		    .on("change", ".star-input :radio", function(){
		    	$result.text($(this).next().text());
		  	})
		    .on("mouseover", ".star-input label", function(){
		    	$result.text($(this).text());
		    })
		    .on("mouseleave", ".star-input>.input", function(){
		    	var $checked = $star.find(":checked");
		    		if($checked.length === 0){
		     	 		$result.text("0");
		   		 	} else {
		     	 		$result.text($checked.next().text());
		    		}
		  	});
		};

		starRating();
	
	
	
	

</script>