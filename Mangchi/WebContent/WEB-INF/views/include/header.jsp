<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	
	<style>
.btn {
	border-radius: 4px;
	height: 44px;
	font-size: 13px;
	font-weight: 600;
	text-transform: uppercase;
	-webkit-transition: all 200ms linear;
	transition: all 200ms linear;
	padding: 0 30px;
	letter-spacing: 1px;
	display: -webkit-inline-flex;
	display: -ms-inline-flexbox;
	display: inline-flex;
	-webkit-align-items: center;
	-moz-align-items: center;
	-ms-align-items: center;
	align-items: center;
	-webkit-justify-content: center;
	-moz-justify-content: center;
	-ms-justify-content: center;
	justify-content: center;
	-ms-flex-pack: center;
	text-align: center;
	border: none;
	background-color: #ffeba7;
	color: #102770;
	box-shadow: 0 8px 24px 0 rgba(255, 235, 167, .2);
}

.btn:active, .btn:focus {
	background-color: #102770;
	color: #ffeba7;
	box-shadow: 0 8px 24px 0 rgba(16, 39, 112, .2);
}

.btn:hover {
	background-color: #102770;
	color: #ffeba7;
	box-shadow: 0 8px 24px 0 rgba(16, 39, 112, .2);
}

 </style>
 
	<nav class="navbar navbar-expand-md navbar-light fixed-top"
		style="background-color: #d9e1e8;">
		<a class="navbar-brand" href="<c:url value='/index.do'/>"><img
			src="<c:url value='/img/logo11.png'/>" class="logo_img"
			style="width: 100px; height: 50px;"></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarCollapse" aria-controls="navbarCollapse"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarCollapse">
			<ul class="navbar-nav mr-auto">
				<c:if test="${empty loginInfo}">
					<li class="nav-item active"><a class="nav-link"
						href="<c:url value='/member/loginForm.do'/>">LOGIN</a></li>
				</c:if>
				<c:if test="${not empty loginInfo}">
					<li class="nav-item active"><a class="nav-link" id="logout"
						href="<c:url value='#'/>">LOGOUT</a></li>
				</c:if>
				<li class="nav-item"><a class="nav-link"
					href="<c:url value='/board/boarding.do'/>">BOARD</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<c:url value="/board/posting.do"/>">WRITING</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<c:url value="/message/messageBox.do?receiver=${loginInfo.id}"/>">MESSAGE BOX</a></li>
				<c:if test="${not empty loginInfo}">
					<li class="nav-item"><a class="nav-link"
						href="<c:url value='/member/mypage.do'/>">MY PAGE</a></li>
				</c:if>
			</ul>
			<form class="form-inline mt-2 mt-md-0"
				action="${pageContext.request.contextPath}/board/searchrequest.do"
				method="get">
				<input class="form-control mr-sm-2" type="text" name="Search"
					placeholder="Search" aria-label="SEARCH">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">SEARCH</button>
			</form>
		</div>
	</nav>

</header>
<script>
		$('#logout').click(function() {
			if (confirm('정말 로그아웃 하시겠습니까?')) {
				location.href = '<c:url value="/member/logout.do"/>';
			}
		});
	</script>
