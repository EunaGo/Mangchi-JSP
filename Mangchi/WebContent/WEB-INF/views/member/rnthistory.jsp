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
<title>대여 내역</title>
<link rel="canonical"
	href="https://getbootstrap.com/docs/4.5/examples/carousel/">
<link rel='stylesheet' href='<c:url value="/css/list.css"/>'>
<!-- Bootstrap core CSS -->
<link rel='stylesheet'
	href='<c:url value="/assets/dist/css/bootstrap.css"/>'>
<link rel='stylesheet' href='<c:url value="/css/default.css"/>'>
<!-- Custom styles for this template -->
<link href='<c:url value="/css/carousel.css"/>' rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Gothic+Coding&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<br>
	<br>
	<br>
	<div class="container">
		<div class="nav-scroller bg-white shadow-sm">
			<nav class="nav nav-underline">
				<a class="nav-link"
					href="${pageContext.request.contextPath}/request/reqhistory.do">요청
					내역</a> <a class="nav-link"
					href="${pageContext.request.contextPath}/request/rnthistory.do">대여
					내역</a>
			</nav>
		</div>
		<h1>대여 내역</h1>

		<%-- 		<c:if test="${not empty listView.requestList}">

		<table border=1>
			<th>게시물 번호</th>
			<th>게시글 제목</th>
			<th>가격</th>
			<th>등록 날짜</th>
			<th>렌탈 기간</th>
			<th>지역</th>
			<c:forEach items="${listView.requestList}" var="rental">
				<tr>
					<td>${rental.req_idx}</td>
					<td>${rental.req_title}</td>
					<td>${rental.req_price}</td>
					<td>${rental.req_regdate}</td>
					<td>${rental.req_term}</td>
					<td>${rental.req_loc}</td> 
				</tr>
			</c:forEach>

		</table>
	</c:if> --%>
		<c:if test="${not empty listView.requestList}">
			<c:forEach items="${listView.requestList}" var="request">
				<article class="horizontal card" >
					<div class="card__content">
						<div class="card__title">
							<p id="p1">NO.${request.req_idx} >> ${request.req_title}</p>
						</div>
						<div class="card__excerpt">
							<table>

								<tr>
									<td><p id="p2">작성자 | ${request.member_nick}</p></td>
									<td></td>
									<td><p id="p2">지역 | ${request.req_loc}</p></td>
								</tr>
								<tr>
									<td><p id="p2">대여 기간 | 
									${request.day}일  ${request.hour}시간 ${request.minute}분</p></td>
									<td></td>
									<td><p id="p2">
											대여 상태 |
											<c:if test="${request.req_status eq 0}">
								렌탈 상태: 대기중
							</c:if>
											<c:if test="${request.req_status eq 1}">
								렌탈 상태: 렌탈 중
							</c:if>
											<c:if test="${request.req_status eq 2}">
								렌탈 상태: 렌탈 완료
							</c:if>
										</p></td>
								</tr>
								<tr>
									<td><p id="p2">가격 | ${request.req_price}</p></td>
									<td></td>
									<td><p id="p2">작성 날짜 | ${request.req_regdate}</p></td>
								</tr>
							</table>
						</div>
						<div class="card__tags">

							<a href="#" class="stretched-link" ><input type="hidden" class="${request.req_idx}" value="${request.req_idx}"></a>
						</div>
					</div>
				</article>
				<br>
			</c:forEach>
		</c:if>
		<c:if test="${listView.pageTotalCount > 0}">

			<div class="paging">
				<c:forEach begin="1" end="${listView.pageTotalCount}" var="num">
					<a href="rnthistory.do?page=${num}"
						${listView.currentPageNumber eq num? 'class="currentPage"':''}>[
						${num} ]</a>
				</c:forEach>
			</div>

		</c:if>
	</div>

	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
<script>
/*  	$('a').click(function(e){
  	
	 var test = $(this).children('input').val();
	 
	 console.log(test);
	 //console.log(testval); //req_idx=xx
	
	 //location.href='${pageContext.request.contextPath}/board/detailRequestInfo.do?'+testval;
	 });  
	 */

 	  $('a').click(function(e) {

		var req_idx = $(this).children('input').val();

		var action = '${pageContext.request.contextPath}/board/detailRequestInfo.do';

		var form = $('<form></form>');
		form.attr('charset', 'utf-8');
		form.attr('method', 'post');
		form.attr('action', action);
		form.appendTo('body');

		var inputIdx = $('<input type="hidden" value="'+req_idx+'" name="req_idx">');
		form.append(inputIdx);
		form.submit();
			});   
</script>



<script src="<c:url value='/assets/dist/js/bootstrap.bundle.js'/>"></script>















