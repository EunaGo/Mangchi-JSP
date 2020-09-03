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
<title>마이페이지</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/4.5/examples/carousel/">

<!-- Bootstrap core CSS -->
<link rel='stylesheet'
	href='<c:url value="/assets/dist/css/bootstrap.css"/>'>
<link rel='stylesheet' href='<c:url value="/css/default.css"/>'>
<!-- Custom styles for this template -->
<link href='<c:url value="/css/carousel.css"/>' rel="stylesheet">

<style type="text/css">

span.star-prototype, span.star-prototype > * {
    height: 16px; 
    background: url(http://i.imgur.com/YsyS5y8.png) 0 -16px repeat-x;
    width:80px;
    display: inline-block;
}
 
span.star-prototype > * {
    background-position: 0 0;
    max-width:80px; 
}

</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
<c:if test="${loginInfo==null}">
	<script>
		alert('글을 쓰려면 로그인 해주세요');
		
		location.href='<c:url value="/member/loginForm.do"/>';
	</script>
</c:if>


	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<br>
	<br>
	<br>
	<div class="container">
		<div class="row mb-2">
			<div class="col-md-6">
				<div
					class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
					<div class="col p-4 d-flex flex-column position-static">
						<strong style="color: #102770">프로필</strong>
						<h3 class="mb-0">
							${membernick} 
						</h3>
						<div class="mb-1 text-muted">
							${memberaddr}
						</div>
						<p class="card-text mb-auto">[${membernick}] 님 환영합니다 !!</p>
						<br>
							<div class="row mb-2">
								&nbsp;&nbsp;&nbsp;<a href="modify.do?idx=2">닉네임 수정&nbsp;&nbsp;&nbsp;</a><a href="modify.do?idx=1">비밀번호 수정&nbsp;&nbsp;&nbsp;</a><a href="#" id="deleteMemeber">회원 탈퇴</a>
							</div>
						
					</div>
					<div class="col-auto d-none d-lg-block"></div>
				</div>
			</div>
			<div class="col-md-6">
				<div
					class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
					<div class="col p-4 d-flex flex-column position-static">
						<strong style="color: #102770">거래 내역</strong>

						<div class="row mb-2">
							<div style="width: 50%; text-align: center">
							<a href="${pageContext.request.contextPath}/request/reqhistory.do"><img src="<c:url value="/img/logo2.png"/>" style="width: 150px; height: 100px;"></a>		
									<p style="text-align: center">요청 내역</p>
							</div>
							<div style="width: 50%; text-align: center">
							<a href="${pageContext.request.contextPath}/request/rnthistory.do"><img src="<c:url value="/img/logo3.png"/>" style="width: 150px; height: 100px;" ></a>						
									<p style="text-align: center">대여 내역</p>
							</div>
						</div>
						
					</div>
					<div class="col-auto d-none d-lg-block"></div>
				</div>
			</div>
		</div>
		<div class="row mb-2">
		<div class="col-md-6">
				<div
					class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
					<div class="col p-4 d-flex flex-column position-static">
						<strong style="color: #102770">동네 설정</strong>
						<h3 class="mb-0">
							<동네 설정>
						</h3>
						<div class="mb-1 text-muted">
							<지역 (ex:성산동)>
						</div>
						<p class="card-text mb-auto">This is a wider card with
							supporting text below as a natural lead-in to additional content.</p>
						<a href="modify.do?idx=3" class="stretched-link">동네 수정하기</a>
						
					</div>
					<div class="col-auto d-none d-lg-block"></div>
				</div>
			</div>
			
			
				<div class="col-md-6">
				<div
					class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
					<div class="col p-4 d-flex flex-column position-static">
						<strong style="color: #102770">평점 현황</strong>

						<div class="row mb-2">
							<div class="col-lg-6">
								
								<c:if test="${score+((score%1>0.5)?(1-(score%1))%1:-(score%1))<=2.9 }">
						<img src="<%=request.getContextPath()%>/img/bad.png" width="100px;" height="100px;">
							<div style="display: inline; font-weight: bold; font-size:30px; margin-left: 30px; color: red;">나쁨</div>
						</c:if>
						
						
						
						
						
						<c:if test="${score+((score%1>0.5)?(1-(score%1))%1:-(score%1))>=3 }">
						<img src="<%=request.getContextPath()%>/img/good.png" width="100px;" height="100px;">
							<div style="display: inline; font-weight: bold; font-size:30px; margin-left: 30px; color: green;">좋음</div>
						</c:if>
								
								
							</div>
						
						
							
						
						
						<!-- <span class="star-prototype"> -->
						<%-- <c:out value="${score+((score%1>0.5)?(1-(score%1))%1:-(score%1)) }"/> --%>
						<!-- </span> -->
							
						
					
						 <div class="col-lg-6" style="text-align: center;">
					
							<p style="font-weight: bold; font-size: 50px; ">
						<c:out value="${score+((score%1>0.5)?(1-(score%1))%1:-(score%1)) }"/>
						</p>
						
							<a  href="${pageContext.request.contextPath}/reviews/reviewList.do">내가쓴 리뷰</a>
							
							
							 </div> 
						</div>
						
					
						
					</div>
				
				</div>
				
			</div>
			
			
			
		</div>
	</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script>
$('documnet').ready(function name() {
	
	$.fn.generateStars = function() {
	    return this.each(function(i,e){$(e).html($('<span/>').width($(e).text()*16));});
	};

	// 숫자 평점을 별로 변환하도록 호출하는 함수
	$('.star-prototype').generateStars();

	
});



	window.jQuery
			|| document
					.write('<script src="<c:url value='/assets/js/vendor/jquery.slim.min.js'/>"><\/script>')
					
$('#deleteMemeber').click(function (){
	if(confirm("정말 탈퇴하시겠습니까?")){
		location.href = 'delete.do';
	}
});
	

</script>

<script src="<c:url value='/assets/dist/js/bootstrap.bundle.js'/>"></script>
</body>

