<%@page import="review.dao.ReviewDao"%>
<%@page import="review.service.ReviewServiceImpl"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page import="review.model.*" %>
    
<!DOCTYPE html>
<html>
<head>

<style type="text/css">
body {
	padding-top:7em !important;
	
}
div.center {
	margin: auto;
	width:50%;
	text-align: center;
}

div.center2{
margin: auto;
	width:50%;
	text-align: center;
}

button.buy {
	text-align: center;
	
}

button.sell{
	
}

 

table.type09 {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;

}
table.type09 thead th {
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #369;
    border-bottom: 3px solid #036;
}
table.type09 tbody th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #f3f6f7;
}
table.type09 td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}



</style>

<meta charset="UTF-8">


 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v4.0.1">
    
    
<title>거래 후기</title>


 <link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/carousel/">

    <!-- Bootstrap core CSS -->
	<link rel='stylesheet' href='<c:url value="/assets/dist/css/bootstrap.css"/>'>
	<link rel='stylesheet' href='<c:url value="/css/default.css"/>'> 
    <!-- Custom styles for this template -->
    <link href='<c:url value="/css/carousel.css"/>' rel="stylesheet">
<script src="http://code.jquery.com/jquery-1.12.4.js"></script>




</head>

<body>

<%@ include file="/WEB-INF/views/include/header.jsp" %>

<div class="center">
<button id="buy" class="btn btn-outline-success my-2 my-sm-0">나의 후기</button><button id="sell" class="btn btn-outline-success my-2 my-sm-0">내가 쓴후기</button>
</div>


<div class="center" id="center" style="margin-top: 30px;">



<table class="type09">
<thead>


<tr>
<th scope="cols">리뷰idx</th>
<th scope="cols">게시글번호</th>
<th scope="cols">나</th>
<th scope="cols">상대방</th>
<th scope="cols">점수</th>
<th scope="cols" style="width: 40%;">내용</th>
<th scope="cols">리뷰쓴날자</th>
</tr>

</thead>

<c:forEach items="${reviewList}" var="x">

	<tr>
		<td scope="row">${x.review_idx}</td>
		<td scope="row">${x.req_idx}</td>
		<td scope="row">${x.review_receiver}</td>
		<td scope="row">${x.review_writer}</td>
		<td scope="row">${x.review_score}</td>
		<td scope="row">${x.review_text}</td>
		<td scope="row">${x.review_regdate}</td>
		
		</tr>
		
		
</c:forEach>

 
</table>
</div>





<div class="center2" id="center2" style="margin-top: 30px; display: none;">
<table class="type09">

<thead>

<tr>
<th scope="cols">리뷰idx</th>
<th scope="cols">게시글번호</th>
<th scope="cols">상대방</th>
<th scope="cols">나</th>
<th scope="cols">점수</th>
<th scope="cols" style="width: 40%;">내용</th>
<th scope="cols">리뷰쓴날자</th>
</tr>

</thead>

<c:forEach items="${writerList}" var="y">

	<tr>
		<td  >${y.review_idx}</td>
		<td  >${y.req_idx}</td>
		<td  >${y.review_receiver}</td>
		<td  scope="row">${y.review_writer}</td>
		<td  scope="row">${y.review_score}</td>
		<td  scope="row" style="width: 40%;">${y.review_text}</td>
		<td  scope="row">${y.review_regdate}</td>
		
		</tr>
		
		
</c:forEach>

 
</table>
</div>




	<%@ include file="/WEB-INF/views/include/footer.jsp" %>

</body>
</html>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script>window.jQuery || document.write('<script src="<c:url value='/assets/js/vendor/jquery.slim.min.js'/>"><\/script>')</script><script src="<c:url value='/assets/dist/js/bootstrap.bundle.js'/>"></script></body>
<script>
$('#buy').click(function () {

	$('#center').insertAfter('#center2');
	 $('#center2').hide();
	 $('#center').show();
	$('#buy').css('font-weight','bold');
	$('#sell').css('font-weight','normal');
	/*$('#center').css('display','inline'); */
});



	$('#sell').click(function () {
		$('#center2').insertAfter('#center');
		 $('#center').hide();
		 $('#center2').show();
		 $('#sell').css('font-weight','bold');
		 $('#buy').css('font-weight','normal');
		/* $('#center').css('display','none');
		$('#center2').css('display','inline'); */
	});
	
</script>
