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
													<c:if test="${idx == 3}">
														<h4 class="mb-4 pb-3">주소 수정 페이지</h4>
														<form action="modifyAddr.do" method="post">
															<div class="form-group mt-2">
																<input type="text" name="addr" class="form-style"
																	placeholder="Modify Address" id="addr"
																	autocomplete="off" required readonly>
											
															</div>
															<div class="form-group mt-2">
																<input type="button" class="btn mt-4" onclick="sample5_execDaumPostcode()" value="주소 검색">
															</div>
															<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
															<input type="submit" class="btn mt-4" value="수정하기">
														</form>
													</c:if>
													<c:if test="${idx == 2}">
														<h4 class="mb-4 pb-3">닉네임 수정 페이지</h4>
														<form action="modifyNick.do" method="post">
															<div class="form-group mt-2">
																<input type="text" name="nick" class="form-style"
																	placeholder="Your NickName" id="nick"
																	autocomplete="off" required>
																	<i class="input-icon uil uil-at"></i>
															</div>
															<input type="submit" class="btn mt-4">
														</form>
													</c:if>
													<c:if test="${idx == 1}">
														<h4 class="mb-4 pb-3">비밀번호 수정 페이지</h4>
														<form action="modifyPw.do" method="post">
															<div class="form-group mt-2">
																<input type="password" name="upw" class="form-style" placeholder="Your Password" id="upw" autocomplete="off" required>
																<i class="input-icon uil uil-lock-alt"></i>
															</div>
															<div class="form-group mt-2">
																<input type="password" name="upwChk" class="form-style" placeholder="Your Password Check" id="upwChk" autocomplete="off" required>
																<i class="input-icon uil uil-lock-alt"></i>
															</div>
															<div id="success">비밀번호가 일치합니다.</div>
															<div id="danger">비밀번호가 일치하지 않습니다.</div>
															<input type="submit" class="btn mt-4" value="수정">
														</form>
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


<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });


    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("addr").value = addr;
                // 주소로 상세 정보를 검색
               /*  geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                }); */
            }
        }).open();
    }
</script>
<!-- 아이디 중복 체크 -->
<script>
	$(document).ready(function() {
		$("#idSuccess").hide();
		$("#idDanger").hide();
		$('#logemail').focusout(function() {
			$.ajax({
				url : 'loginIdChk.do',
				data : {
					uid : $(this).val()
				},
				success : function(data) {
					if (data == '0') {
						$("#idSuccess").show();
						$("#idDanger").hide();
						$("#regSub").removeAttr("disabled");
					} else {
						$("#idSuccess").hide();
						$("#idDanger").show();
						$("#regSub").attr("disabled", "disabled");
					}
				}
			});
		});
	});
</script>
<!-- 비밀번호체크 -->
<script>
	$('document').ready(function() {
		$(function() {
			$("#success").hide();
			$("#danger").hide();
			$("input").keyup(function() {
				var pwd1 = $("#upw").val();
				var pwd2 = $("#upwChk").val();
				if (pwd1 != "" || pwd2 != "") {
					if (pwd1 == pwd2) {
						$("#success").show();
						$("#danger").hide();
						$("#regSub").removeAttr("disabled");
					} else {
						$("#success").hide();
						$("#danger").show();
						$("#regSub").attr("disabled", "disabled");
					}
				}
			});
		});
	});
</script>
</body>
</html>





