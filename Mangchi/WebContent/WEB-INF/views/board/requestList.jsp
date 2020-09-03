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
<title>대여 요청 게시판</title>


<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>


<link rel="canonical"
	href="https://getbootstrap.com/docs/4.5/examples/carousel/">

<!-- Bootstrap core CSS -->
<link rel='stylesheet'
	href='<c:url value="/assets/dist/css/bootstrap.css"/>'>
<link rel='stylesheet' href='<c:url value="/css/default.css"/>'>
<!-- Custom styles for this template -->
<link href='<c:url value="/css/carousel.css"/>' rel="stylesheet">
<link href='<c:url value="/css/map.css"/>' rel="stylesheet">


</head>


<body>

<div id="map" style="width: 100%; height: 350px; display: none;"></div>



	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	
	
	
	<h1>게시판 들어갈 자리</h1>
	

	<c:if test="${empty requestWritingList}">
		<h1>게시물 없음</h1>
	</c:if>

	<div class="container">
	<table border="1" id="tab">
	
		 <tr>
			<th>작성자 이름</th>
			<th>게시물 제목</th>
			<th>가격</th>
			<th>등록 날짜</th>
			<th>지역</th>
			<th>상세내용</th>
			<th>조회수</th>
			<th>현재 상태</th>
			<th>이미지?</th>
			<th>나와 사용자 사이의 거리</th>
		</tr> 

	</table>
</div>
 
	<div class="paging">
		
	</div>

	
	<p id="result"></p>
	
	


<script>
	var locationList = new Array();
	var allList = new Array();
	var userAddr = '${loginInfo.addr}';
	
	<c:forEach var="requestList" items="${requestWritingList}">
		locationList.push("${requestList.req_loc}");
		
		requestAll = {
				req_idx: '${requestList.req_idx}',
				writer_nick: '${requestList.writer_nick}',
				req_title:'${requestList.req_title}',
				req_helper:'${requestList.req_helper}',
				req_price:	'${requestList.req_price}',
				req_regdate:'${requestList.req_regdate}',
				req_loc:'${requestList.req_loc}',
				req_text:'${requestList.req_text}',
				req_readcnt:'${requestList.req_readcnt}',
				req_status:'${requestList.req_status}',
				req_img:'${requestList.req_img}',
			};
		
		allList.push(requestAll);
	</c:forEach>
</script>



	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	
		<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=69c40691beee2a7bf82c96e2f85f0da8&libraries=services"></script>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=69c40691beee2a7bf82c96e2f85f0da8"></script>
	<script src="<c:url value="/js/map.js" />"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script>
	window.jQuery
			|| document
					.write('<script src="<c:url value='/assets/js/vendor/jquery.slim.min.js'/>"><\/script>')
</script>
<script src="<c:url value='/assets/dist/js/bootstrap.bundle.js'/>"></script>
<script>

</script>
</body>
</html>
