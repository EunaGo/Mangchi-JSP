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
<title>카카오 회원가입</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/4.5/examples/carousel/">

<!-- Bootstrap core CSS -->
<link rel='stylesheet'
	href='<c:url value="/assets/dist/css/bootstrap.css"/>'>
<link rel='stylesheet' href='<c:url value="/css/default.css"/>'>
<!-- Custom styles for this template -->
<link href='<c:url value="/css/carousel.css"/>' rel="stylesheet">
<link href='<c:url value="/css/RegForm.css"/>' rel="stylesheet">


</head>
<body>

	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<div>
		<main role="main">
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
				<div class="section">
					<div class="container">
						<div class="row full-height justify-content-center">
							<div class="col-12 text-center align-self-center py-5">
								<div class="section pb-5 pt-5 pt-sm-2 text-center">
									<div class="card-3d-wrap mx-auto">
										<div class="card-3d-wrapper">
											<div class="card-front">
												<div class="center-wrap">
													<div class="section text-center">
														<c:if test="${resultCnt == 0}">
															<h1>회원가입에 실패하였습니다.</h1>
														</c:if>
														<c:if test="${resultCnt == 1}">
															<h1>회원가입을 축하합니다.</h1><br>
															<h3> 잠시후 메인화면으로 이동합니다.</h3>
															
															<script>
															setTimeout(function() {
																location.replace("/Mangchi/index.html");
																}, 5000);
															</script>
														</c:if>
														
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</main>
	</div>

	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

	<!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script> -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="<c:url value='/assets/js/vendor/jquery.slim.min.js'/>"><\/script>')
	</script>
	<script src="<c:url value='/assets/dist/js/bootstrap.bundle.js'/>"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5a8a5ce6115cd1642bcb72f180541d7b&libraries=services"></script>
</body>
</html>
