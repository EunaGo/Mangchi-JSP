<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Jekyll v4.0.1">
<title>M A N G C H | 쪽지 보내기</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/4.5/examples/carousel/">

<!-- Bootstrap core CSS -->
<link rel='stylesheet'
	href='<c:url value="/assets/dist/css/bootstrap.css"/>'>
<link rel='stylesheet' href='<c:url value="/css/default.css"/>'>
<!-- Custom styles for this template -->
<link href='<c:url value="/css/carousel.css"/>' rel="stylesheet">
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<br>
	<br>
	<br>
	<br>
	<br><br><br><br><br><br>
	<c:forEach items="${hollysList}" var="hol">
		${hol.req_loc}<br>
		${hol.distance}<br>
	</c:forEach>

	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>window.jQuery || document.write('<script src="<c:url value='/assets/js/vendor/jquery.slim.min.js'/>"><\/script>')</script><script src="<c:url value='/assets/dist/js/bootstrap.bundle.js'/>"></script>
</body>
</html>