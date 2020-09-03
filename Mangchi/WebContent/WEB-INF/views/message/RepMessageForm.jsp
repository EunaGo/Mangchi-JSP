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
<style>

body {
	margin: 0;
	padding: 0;
}

#note {
	border: 1, solid, black;
	margin: 100px;
	
}

table.noteForm{
	margin: 0 auto;
}

#noteText {
	width: 500px;
	height: 500px;
}


@media 
only screen and (max-width: 760px),
(min-device-width: 768px) and (max-device-width: 1024px)  {


}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	

	<div id="note">
		<form action="<c:url value='/message/sendMessage.do'/>" method="post" enctype="multipart/form-data">
			<input type="hidden" name="senderIdx" value="${loginInfo.idx}">
			<input type="hidden" name="reqListIdx" value="${req_idx}">

			<table class="noteForm">
				<tr>
					<td>보내는 사람</td>
					<td><input type="email" name="sender" id="sender" value="${loginInfo.id}" readonly></td>
				</tr>
				<tr>
					<td>받는 사람</td>
					<td><input type="email" name="noteId" id="noteId" value="${toPerson}" readonly></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="noteTitle" id="notetitle" placeholder="제목을 입력해주세요"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><input type="text" name="noteText" id="noteText" placeholder="쪽지 내용을 입력해주세요" required></td>
				</tr>
				<tr>
					<td>이미지</td>
					<td><input type="file" name="noteImage"></td>
				</tr>
				<tr>
					<td></td>
					<td style="text-align: center;"><input type="submit" class="btn btn-outline-success my-2 my-sm-0" value="쪽지보내기"></td>
				</tr>
			</table>
		</form>
	</div>

	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script>window.jQuery || document.write('<script src="<c:url value='/assets/js/vendor/jquery.slim.min.js'/>"><\/script>')</script>
<script src="<c:url value='/assets/dist/js/bootstrap.bundle.js'/>"></script>

