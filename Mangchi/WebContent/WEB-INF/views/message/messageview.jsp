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
<title>M A N G C H | 쪽지보기</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/4.5/examples/carousel/">

<!-- Bootstrap core CSS -->
<link rel='stylesheet'
	href='<c:url value="/assets/dist/css/bootstrap.css"/>'>
<link rel='stylesheet' href='<c:url value="/css/default.css"/>'>
<!-- Custom styles for this template -->
<link href='<c:url value="/css/carousel.css"/>' rel="stylesheet">
<style>
div.wrap {
	margin: 100px;
	height: 500px;
}

div.card {
	border: 3px solid #DDD;
	margin: 0 auto;
	width: 500px;
	height: 500px;
}

div.noteheader {
	margin-left: 30px;
	margin-top: 10px;
}

div.textview {
	margin: 0 auto;
	width: 400px;
	height: 400px;
	overflow: auto;
	width: 400px;
}

span.noteTitle {
	text-align: center;
	font-weight: bold;
}

div.buttonArea {
	margin: 10px auto;
}

@media only screen and (max-width: 760px) , ( min-device-width : 768px)
	and (max-device-width: 1024px) {
}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>
	
	function messageDel(idx) {
		if (confirm('해당 메시지를 정말로 삭제하시겠습니까?\n삭제된 메시지는 복구할 수 없습니다.')) {
			location.href = 'messageDelete.do?idx=' + idx;
		}
	}
</script>
<c:if test="${loginInfo.id != viewNote.msg_writerId }">
	<script>
	
	$(document).ready(function(){
		
		$('body').hover(function(){
			
			$.ajax({
				url:'readCheck.do',
				data : {
					idx: $('#viewIdx').val()
				},
				success : function(data) {
					console.log(${viewNote.readcheck});
				}
				
			});
			
		});
		
	});
	
</script>
</c:if>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<div class="wrap">

		<div class="boxarea" id="noteBoxArea">
			<button class="btn btn-outline-success my-2 my-sm-0" type="button">
				<a href='<c:url value="/message/messageBox.do"/>'>쪽지함으로 돌아가기</a>
			</button>

		</div>
		<hr>
		<div class="card noteview">
			<input type="hidden" id="viewIdx" value=${viewNote.msg_idx}>
			<div class="noteheader">
				게시판 번호 : ${viewNote.req_idx} 
				<br> 
				<c:if test="${loginInfo.id != viewNote.msg_writerId }">
				FROM :${viewNote.msg_writerId} 
				</c:if>
				<c:if test="${loginInfo.id == viewNote.msg_writerId }">
				TO : ${viewNote.msg_receiver }
				</c:if>
				<br> DATE : ${viewNote.msg_date}
			</div>
			<hr>
			<span class="noteTitle">${viewNote.msg_title}</span>
			<hr>
			<div class="textview">
				<p>${viewNote.msg_text}</p>
				<img src='<c:url value="${viewNote.msg_img}"/>'
					style="width: 100px;">
			</div>
			<div class="buttonArea">
				<c:if test="${loginInfo.id != viewNote.msg_writerId }">
					<button class="btn btn-outline-success my-2 my-sm-0" type="button">
						<a href="javascript:messageDel(${viewNote.msg_idx})">삭제하기</a>
					</button>

					<button class="btn btn-outline-success my-2 my-sm-0" type="button">
						<a href="repMessage.do?idx=${viewNote.msg_idx}">답장하기</a>
					</button>
				</c:if>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
<script>
	window.jQuery
			|| document
					.write('<script src="<c:url value='/assets/js/vendor/jquery.slim.min.js'/>"><\/script>')
</script>
<script src="<c:url value='/assets/dist/js/bootstrap.bundle.js'/>"></script>
</body>
