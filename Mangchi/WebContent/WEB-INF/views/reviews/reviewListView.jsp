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

 

table {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
    width: 100%; 

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

+tr:nth-of-type(odd) { 
  
}
th { 
 
  color: white; 
  font-weight: bold; 
}
td, th { 
  padding: 6px; 
	
  text-align: left; 
}



@media 
only screen and (max-width: 760px),
(min-device-width: 768px) and (max-device-width: 1024px)  {

	/* Force table to not be like tables anymore */
	table, thead, tbody, th, td, tr { 
		display: block; 
	}
	
	/* Hide table headers (but not display: none;, for accessibility) */
	thead tr { 
		position: absolute;
		top: -9999px;
		left: -9999px;
	}
	
	tr { border: 1px solid #ccc; }
	
	td { 
		/* Behave  like a "row" */
		border: none;
		border-bottom: 1px solid #eee; 
		position: relative;
		padding-left: 50%; 
	
		
	}
	
	
	td.row {
	
	margin-bottom: 20px;
	
	}
	
	td:before { 
		/* Now like a table header */
		position: absolute;
		/* Top/left values mimic padding */
		top: 6px;
		left: 6px;
		width: 45%; 
		padding-right: 10px; 
		white-space: nowrap;
	}
	
	td::before{
	font-weight: bold;
	color: #369;
	}
	
	
	td:nth-of-type(4){
	
	width: 80%;
	}
	
	/*
	Label the data
	*/
	td:nth-of-type(1):before { content: "게시글 제목"; }
	td:nth-of-type(2):before { content: "닉네임"; }
	td:nth-of-type(3):before { content: "평점"; }
	td:nth-of-type(4):before { content: "내용"; }
	td:nth-of-type(5):before { content: "날자"; }
	


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
<th scope="cols">게시글 제목</th>
<th scope="cols">닉네임</th>
<th scope="cols">평점</th>
<th scope="cols" style="width: 40%;">내용</th>
<th scope="cols">리뷰쓴날자</th>
</tr>

</thead>

<c:forEach items="${reviewList}" var="x">

	<tr>
		<td  scope="row"">${x.req_title}</td>
		<td scope="row">${x.member_nick}</td>
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
<th scope="cols">게시글 제목</th>
<th scope="cols">닉네임</th>
<th scope="cols">평점</th>
<th scope="cols" style="width: 40%;">내용</th>
<th scope="cols">리뷰쓴날자</th>
</tr>

</thead>

<c:forEach items="${writerList}" var="y">

	<tr>
	
	<td  scope="row">${y.req_title}</td>
		<td  scope="row">${y.member_nick}</td>
		
		<td  scope="row">${y.review_score}</td>
		<td  scope="row">${y.review_text}</td>
		<td  scope="row">${y.review_regdate}</td>
		
		</tr>
		
		
</c:forEach>

 
</table>
</div>

<div style="margin-bottom: 5%;"></div>



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
