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
  </head>
<body onload="javascript:window_onload()">
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	
	<!-- <div style="margin-top: 50px;">
	
	5초후 페이지 이동합니다
	
	
	
	</div>

<div style="margin-bottom: 5%;"></div> -->

	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script>window.jQuery || document.write('<script src="<c:url value='/assets/js/vendor/jquery.slim.min.js'/>"><\/script>')</script><script src="<c:url value='/assets/dist/js/bootstrap.bundle.js'/>"></script></body>

<script>
function window_onload(){

    setTimeout('go_url()',500)  // 0.5초후 go_url() 함수를 호출한다.

 }

 function go_url(){

    location.href="<%=request.getContextPath()%>/request/rnthistory.do" 

 }

</script>