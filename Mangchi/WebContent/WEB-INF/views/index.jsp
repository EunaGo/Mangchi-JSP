<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v4.0.1">

    <title> M A N G C H | 우리 동네 대여 서비스</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/carousel/">

    <!-- Bootstrap core CSS -->
	<link rel='stylesheet' href='<c:url value="/assets/dist/css/bootstrap.css"/>'>

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
    <!-- Custom styles for this template -->
    <link href='<c:url value="/css/carousel.css"/>' rel="stylesheet">
   	<link href="https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
    <style>
    	h1, h3, h5, p {
    		font-family: 'Jua', sans-serif;
    		color: black;
    	}
    	
    	.nanum .lead {
			font-family:'Nanum Gothic Coding', monospace;;
			font-size: 1em;
    	}
    	

    </style>
  </head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	<div>
		
<main role="main">

  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
      <div class="carousel-item active">
      
        <img src="<c:url value="/img/index/home.png"/>">
        <div class="container">
          <div class="carousel-caption text-left">
            <h1>당장 필요한 물건이 있는데 <br>사기엔 돈이 아깝다면?</h1>
            <p class="nanum">우리 동네 대여 서비스  M A N G C H !</p>
            <p><a class="btn btn-lg btn-primary" href="<c:url value="/board/boarding.do"/>" role="button">JOIN WITH US!</a></p>
          </div>
        </div>
      </div>
      <div class="carousel-item">
        <img src="<c:url value="/img/index/wooden.png"/>">
        <div class="container">
          <div class="carousel-caption">
            <h1>집에서 놀고 있는 물건이 있는데 팔기엔 아쉽다면?</h1>
            <p class="nanum">우리 동네 대여 서비스  M A N G C H !</p>
            <p><a class="btn btn-lg btn-primary" href="<c:url value="/board/boarding.do"/>" role="button">JOIN WITH US!</a></p>
          </div>
        </div>
      </div>
      <div class="carousel-item">
       <img src="<c:url value="/img/index/home3.jpg"/>">
        <div class="container">
          <div class="carousel-caption text-right">
            <h1>우리 동네에 내가 당장 필요한 물건과<br>내 물건이 갑자기 필요해진 사람이 있다?</h1>
            <p class="nanum">우리 동네 대여 서비스  M A N G C H !</p>
            <p><a class="btn btn-lg btn-primary" href="<c:url value="/board/boarding.do"/>" role="button">JOIN WITH US!</a></p>
          </div>
        </div>
      </div>
    </div>
    <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>


  <!-- Marketing messaging and featurettes
  ================================================== -->
  <!-- Wrap the rest of the page in another container to center all the content. -->

  <div class="container marketing">

    <!-- Three columns of text below the carousel -->
    <div class="row">
      <div class="col-lg-4">
        <img class="rounded-circle" src="<c:url value="/img/team/권재준.png"/>" style="width:140px; height:140px">
        <h2>권재준</h2>
        <p class="nanum">팀원<br>대여 요청</p>
      </div><!-- /.col-lg-4 -->
      <div class="col-lg-4">
        <img class="rounded-circle" src="<c:url value="/img/team/김보겸.jpg"/>" style="width:140px; height:140px; "><!-- <rect width="100%" height="100%" fill="#777"/> -->
        <h2>김보겸</h2>
        <p class="nanum"><strong>★☆팀장☆★</strong><br>사용자 리뷰</p>
      </div><!-- /.col-lg-4 -->
      <div class="col-lg-4">
        <img class="rounded-circle" src="<c:url value="/img/team/고은아.png"/>" style="width:140px; height:140px; "><!-- <rect width="100%" height="100%" fill="#777"/> -->
        <h2>고은아</h2>
        <p class="nanum">팀원<br>마이 거래리스트, 검색</p>
      </div><!-- /.col-lg-4 -->
      <div class="col-lg-4">
        <img class="rounded-circle" src="<c:url value="/img/team/박성민.jpg"/>" style="width:140px; height:140px">
        <h2>박성민</h2>
        <p class="nanum">팀원<br>회원가입, 로그인</p>
      </div><!-- /.col-lg-4 -->
      <div class="col-lg-4">
        <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 140x140"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"/><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>
        <h2>박진명</h2>
        <p class="nanum">팀원<br>지도 API</p>
      </div><!-- /.col-lg-4 -->
      <div class="col-lg-4">
        <img class="rounded-circle" src="<c:url value="/img/team/홍세영.png"/>" style="width:140px; height:140px">
        <h2>홍세영</h2>
        <p class="nanum">팀원<br>쪽지보내기</p>
      </div><!-- /.col-lg-4 -->
    </div><!-- /.row -->


    <!-- START THE FEATURETTES -->

    <hr class="featurette-divider">

    <div class="row featurette">
      <div class="col-md-7">
        <h3 class="featurette-heading">간편한 회원가입, 로그인 </h3>
        <h5> <span class="text-muted"> >> BOTH! << </span></h5>
        <p class="lead">주요 포탈 API를 활용하여 클릭 한번에 회원가입부터 로그인까지 가능하도록 하였습니다.</p>
      </div>
      <div class="col-md-5">
        <img class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" src="<c:url value="/img/team/로그인화면.JPG"/>" style="width: 500px; height: 500px;" >
      </div>
    </div>

    <hr class="featurette-divider">

    <div class="row featurette">
      <div class="col-md-7 order-md-2">
        <h3 class="featurette-heading"> 요청 게시판에 대여요청 올리기 </h3>
        <h5> <span class="text-muted">당장 망치가 필요한데 한번 쓰려고 사기에는 아까워! << </span></h5>
        <p class="lead"> 당장 급한 물건이 있을 때 내 위치와 함께 필요한 물품을 게시하여 내 주위 사람들에게 도움을 청할 수 있습니다. </p>
      </div>
      <div class="col-md-5">
        <img class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" src="<c:url value="/img/team/내게시물1.JPG"/>" style="width: 500px; height: 500px;">
      </div>
    </div>

    <hr class="featurette-divider">

    <div class="row featurette">
      <div class="col-md-7">
        <h3 class="featurette-heading">내 주위에 내 물건을 필요로 하는 사람이 있을까?</h3>
        <h5> <span class="text-muted"> >> 집에 물건은 남아돌고 용돈은 부족하고.... </span></h5>
        <p class="lead">지도 API를 사용하여 내 위치와 게시물을 올린 사람의 거리를 계산하여 같은 동네, 집 앞에서 간편한 거래가 가능하도록 하였습니다.</p>
      </div>
      <div class="col-md-5 order-md-1">
        <svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 500x500"><title>Placeholder</title><rect width="100%" height="100%" fill="#eee"/><text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text></svg>
      </div>
    </div>

    <hr class="featurette-divider">

    <div class="row featurette">
      <div class="col-md-7 order-md-2">
        <h3 class="featurette-heading">간단하게 쪽지 주고 받기</h3>
        <h5> <span class="text-muted">>> BOTH! << </span></h5>
        <p class="lead">대여를 요청하는 게시물 중, 내가 가지고 있는 물건을 적당한 거리에 있는 사람이 필요로 한다면 글에서 바로 쪽지보내기를 클릭할 수 있습니다.</p>
      </div>
      <div class="col-md-5">
        <img class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" src="<c:url value="/img/team/쪽지1.JPG"/>" style="width: 500px; height: 500px;">
      </div>
    </div>
    
	<hr class="featurette-divider">
    
    <div class="row featurette">
      <div class="col-md-7">
        <h3 class="featurette-heading"> 나에게 대여해 줄 상대 선택하기 </h3>
        <h5><span class="text-muted"> 딱 내가 찾던 물건이에요! << </span></h5>
        <p class="lead">내 게시글을 통해 쪽지를 보낸 사람들 중에서 거래를 약속한 사람을 선택합니다.</p>
      </div>
      <div class="col-md-5">
        <svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 500x500"><title>Placeholder</title><rect width="100%" height="100%" fill="#eee"/><text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text></svg>
      </div>
    </div>

    <hr class="featurette-divider">
    
    <div class="row featurette">
      <div class="col-md-7 order-md-2">
        <h3 class="featurette-heading"> 대여기간이 끝나고 <br>서로에 대한 후기 남기기 </h3>
        <h5><span class="text-muted"> >> BOTH! << </span></h5>
        <p class="lead"> 물건을 빌려준 사람도, 빌린 사람도 상대방에 대한 후기를 남기고 자신의 평점을 마이페이지에서 확인할 수 있습니다.</p>
      </div>
      <div class="col-md-5">
        <img class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" src="<c:url value="/img/team/마이페이지.JPG"/>" style="width: 500px; height: 500px;">
      </div>
    </div>

    <hr class="featurette-divider">
    <!-- /END THE FEATURETTES -->

  </div><!-- /.container -->
</main>
	</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script>window.jQuery || document.write('<script src="<c:url value='/assets/js/vendor/jquery.slim.min.js'/>"><\/script>')</script><script src="<c:url value='/assets/dist/js/bootstrap.bundle.js'/>"></script></body>
