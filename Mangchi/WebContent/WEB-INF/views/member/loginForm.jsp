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
    <meta name = "google-signin-client_id"content = "75140810207-a1qug6ggrqqageuv1q6gi8i0tkh5lpi6.apps.googleusercontent.com">
    
    <title>로그인 / 회원가입</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/carousel/">

    <!-- Bootstrap core CSS -->
	<link rel='stylesheet' href='<c:url value="/assets/dist/css/bootstrap.css"/>'>
	<link rel='stylesheet' href='<c:url value="/css/default.css"/>'> 
    <!-- Custom styles for this template -->
    <link href='<c:url value="/css/carousel.css"/>' rel="stylesheet">
    <link href='<c:url value="/css/RegForm.css"/>' rel="stylesheet">
    

 <script src="https://apis.google.com/js/platform.js" async defer></script>
  </head>
  
  <style>
  
  </style>
  
  
  
  
<body>
<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&autoLogAppEvents=1&version=v7.0&appId=289834475439470" nonce="TQFrHHrv"></script>
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	<div>

<main role="main">

  <div id="myCarousel" class="carousel slide" data-ride="carousel">

	<div class="section">
		<div class="container">
			<div class="row full-height justify-content-center">
				<div class="col-12 text-center align-self-center py-5">
					<div class="section pb-5 pt-5 pt-sm-2 text-center">
						<h6 class="mb-0 pb-3"><span>Log In </span><span>Sign Up</span></h6>
			          	<input class="checkbox" type="checkbox" id="reg-log" name="reg-log"/>
			          	<label for="reg-log"></label>
						<div class="card-3d-wrap mx-auto">
							<div class="card-3d-wrapper" >
								<div class="card-front" style=" height: 600px;">
									<div class="center-wrap">
										<div class="section text-center">
											<h4 class="mb-4 pb- 3">Log In</h4>
											<form action="login.do" method="post">
											<div class="form-group">
												<input type="email" name="logemail" class="form-style" placeholder="Your Email" id="logemail" autocomplete="off">
												<i class="input-icon uil uil-at"></i>
											</div>	
											<div class="form-group mt-2">
												<input type="password" name="logpass" class="form-style" placeholder="Your Password" id="logpass" autocomplete="off">
												<i class="input-icon uil uil-lock-alt"></i>
											</div>
											<input type="submit" class="btn mt-4" value="로그인">
											</form>
                            				<p class="mb-0 mt-4 text-center"><a href="#0" class="link">Forgot your password?</a></p>
                            				<br>
                            				<!-- 카카오 로그인 api -->
                            				<a id="custom-login-btn" href="#"><img src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg" width="222"/></a>
                            				<!-- 페이스북 버튼 -->
                            				<div class="form-group mt-2">
                            					<div class="fb-login-button" data-size="large" data-button-type="login_with" data-layout="default" data-auto-logout-link="false" data-use-continue-as="false" data-width=""></div>
												<i class="input-icon uil uil-lock-alt"></i>
											</div>
											<div class="form-group mt-2">
												<!-- <div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div> -->
												
												<div style="margin-left: 75px;">
												<div class="g-signin2" data-width="220" data-height="40">
												<i class="input-icon uil uil-lock-alt" style="text-align:center; "></i>
											</div></div>	

				      					</div>
			      					</div>
			      				</div>
			      				</div> <!-- card-front -->
								<div class="card-back" style="height: 600px;">
									<div class="center-wrap"> 
										<div class="section text-center">
											<h4 class="mb-4 pb-3">Sign Up</h4>
											<form action="regForm.do" method="post">
											<div class="form-group">
												<input type="text" name="unick" class="form-style" placeholder="Your NickName" id="nick" autocomplete="off" required>
												<i class="input-icon uil uil-user"></i>
											</div>	
											<div class="form-group mt-2">
												<input type="email" name="uid" class="form-style" placeholder="Your Email" id="uid" autocomplete="off" required>
												<i class="input-icon uil uil-at"></i>
											</div>	
											<div id="idSuccess">사용 가능한 아이디입니다.</div>
											<div id="idDanger">중복된 아이디입니다.</div>
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
											<div class="form-group mt-2">
												<input type="text" name="uaddr" class="form-style" placeholder="Your Address Check" id="uaddr" autocomplete="off" required readonly>
												<i class="input-icon uil uil-lock-alt"></i>
											</div>
											<div class="form-group mt-2">
												<input type="button" class="btn mt-4" onclick="sample5_execDaumPostcode()" value="주소 검색">
											</div>
											<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
											<input type="hidden" name="lat" id="lat">
											<input type="hidden" name="longi" id="longi">
											<input type="submit" class="btn mt-4 regSub" value="회원가입">
											</form>
				      					</div>
			      					</div>
			      				</div> <!--  card back -->
			      			
			      			</div> <!-- card-3d-wrapper -->
			      			
			      		</div>
			      	</div>
		      	</div>
	      	</div>
	    </div>
	</div>
  </div>
  
 
	</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>

<script>
window.fbAsyncInit = function() {
  FB.init({
    appId      : '289834475439470',
    xfbml      : true,
    version    : 'v7.0'
  });
  FB.AppEvents.logPageView();
};

(function(d, s, id){
   var js, fjs = d.getElementsByTagName(s)[0];
   if (d.getElementById(id)) {return;}
   js = d.createElement(s); js.id = id;
   js.src = "https://connect.facebook.net/en_US/sdk.js";
   fjs.parentNode.insertBefore(js, fjs);
 }(document, 'script', 'facebook-jssdk'));
  
  
  //콜백
  
/* {
    status: 'connected',
    authResponse: {
        accessToken: '...',
        expiresIn:'...',
        signedRequest:'...',
        userID:'...'
    }
} */
//페북 최신 상태를 얻어옴
function checkLoginState() {
	  FB.getLoginStatus(function(response) {
	    statusChangeCallback(response);
	  });
}
</script>

<!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script> -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>window.jQuery || document.write('<script src="<c:url value='/assets/js/vendor/jquery.slim.min.js'/>"><\/script>')</script><script src="<c:url value='/assets/dist/js/bootstrap.bundle.js'/>"></script>
	
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
	Kakao.init('5a8a5ce6115cd1642bcb72f180541d7b');
	
	$(function(){
		
		
		
		
		var idCheck = function(res){
            var id = res.id;
            var nick = res.properties.nickname;
            var photo = res.properties.profile_image;
            $.ajax({
            	url:"<c:url value='/member/kakaoCheck.do'/>",
            	type:"post",
            	data:{id:id, nick:nick, photo:photo},
            	success:function(data){
            		if(data==0){
            			alert("사이트가 처음이시군요?" +
            						"\n 추가 회원 가입이 필요합니다." +
            						"\n 회원가입 페이지로 이동합니다.");
            			location.replace("kakaoRegForm.do?kid="+id);
            		}else if(data==1){
            			alert("추가 회원가입을 안하셨군요?" +
            					"\n 추가 회원 가입이 필요합니다." +
								"\n 회원가입 페이지로 이동합니다.");
            			location.replace("kakaoRegForm.do?kid="+id);
            		}else if(data=2){
            			alert("로그인 되었습니다.");
            			location.replace("kakaoLogin.do?kid="+id);
            			 Kakao.Auth.logout(function() {
            				 //보x씨가 찾은 해결법? 안됨
            				 Kakao.init('5a8a5ce6115cd1642bcb72f180541d7b');
                         });
            		};
            	},
            	error:function(request,status,error){
            		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}
            });
		};
		
		
		var kakaoLogin = function(){
			Kakao.Auth.loginForm({
	               success: function(authObj) {
						
	            	   Kakao.API.request({
	                       url: '/v2/user/me',
	                       success: function(res) {
	                           
	                           idCheck(res);
	                              
	                       },
	                       fail: function(error) {
	                           alert(JSON.stringify(error));
	                       }
	                   });

	               },
	               fail: function(error) {
	                   alert(JSON.stringify(error))
	               }
	           });
		}
		
		var kakaoLoninBtnOnClickEvent = function(){
			$("#custom-login-btn").on("click", function(){
				kakaoLogin();
			});
		}
		
		
		
		
		var init = function(){
			kakaoLoninBtnOnClickEvent();
		}
		
		init();
	})
	
	
	
	
	
	/*
	$(function(){
		
		$.kakaoLogin = function(){
			Kakao.Auth.login({
	               success: function(authObj) {
						
	            	   Kakao.API.request({
	                       url: '/v2/user/me',
	                       success: function(res) {

	                           //alert(JSON.stringify(authObj));
	                           alert('로그인 되었습니다.');
								
	                           
		                        //$('#login').css('display', 'none');
		                        //$('#uinfo').css('display', 'inline');
		                        //$('#status').css('display', 'inline');
		                        //$('#logout').css('display', 'inline');
								
	                           console.log(res);

	                           // -> 요기에다가 회원가입이나 로그인하는 서버 로직 호출

	                       },
	                       fail: function(error) {
	                           alert(JSON.stringify(error));
	                       }
	                   });

	               },
	               fail: function(error) {
	                   alert(JSON.stringify(error))
	               }
	           });
		}
		
		$.fn.kakaoLoninBtnOnClickEvent = function(){
			var $this = $(this);
			$this.on("click", function(){
				$.kakaoLogin();
			})
		}
		
		
		$($.initView = function(){
			$("#custom-login-btn").kakaoLoninBtnOnClickEvent();
		})
		
		
		$.initView();
		
	})
	*/
	</script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5a8a5ce6115cd1642bcb72f180541d7b&libraries=services"></script>
  <script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script>
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
                document.getElementById("uaddr").value = addr;
                // 주소로 상세 정보를 검색
                 geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        $('#lat').attr('value',result.y);
                        $('#longi').attr('value',result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "none";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
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
<!-- 아이디 중복 체크 -->
<script>
	$(document).ready(function() {
		$("#idSuccess").hide();
		$("#idDanger").hide();
		$('#uid').focusout(function() {
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


<script type="text/javascript"> // 구글 api 


function onSuccess(googleUser) {
    console.log('Logged in as: ' + googleUser.getBasicProfile().getName());
  }
  function onFailure(error) {
    console.log(error);
  }
  function renderButton() {
    gapi.signin2.render('my-signin2', {
      'scope': 'profile email',
      'width': 240,
      'height': 50,
      'longtitle': true,
      'theme': 'dark',
      'onsuccess': onSuccess,
      'onfailure': onFailure
    });
  }



</script>

</body>
</html>

  
  
  
  
  