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
<title>M A N G C H | 쪽지함</title>

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
	height: 700px;
}

div.boxarea {
	overflow: hidden;
}

div.searchNote {
	width: 700px;
	float: right;
}

/* div.noteBox {
	height: 650px;
}

div.onlybox {
	height: 600px;
	overflow: auto;
} */


div.paging {
	text-align: center;
}

table.box {
	width: 800px;
	color: #AAAAAA;
}

.check_ok {
	color: green;
}

.check_not {
	color: red;
}

a.currentPage{
	font-weight: bold;
}

@media only screen and (max-width: 760px) , ( min-device-width : 768px)
	and (max-device-width: 1024px) {
	/* Force table to not be like tables anymore */
	table, thead, tbody, th, td, tr {
		display: block;
	}

	/* Hide table headers (but not display: none;, for accessibility) */
	thead tr {
		position: absolute;
		top: -9999px;
		left: -9999px;
	}
	tr {
		border: 1px solid #ccc;
	}
	td {
		/* Behave  like a "row" */
		border: none;
		border-bottom: 1px solid #eee;
		position: relative;
		padding-left: 50%;
	}
	td:before {
		/* Now like a table header */
		position: absolute;
		/* Top/left values mimic padding */
		top: 6px;
		left: 6px;
		width: 45%;
		padding-right: 10px;
		white-space: nowrap;
	}
	td::before {
		font-weight: bold;
		color: #369;
	}
	td:nth-of-type(4) {
		width: 80%;
	}
}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>
	function messageListDel(idx) {
		if (confirm('아직 상대가 메시지를 읽지 않았습니다.\n발송을 취소하시겠습니까?')) {
			location.href = 'messageDelete.do?idx=' + idx;
		}
	}

</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<div class="wrap">

		<div class="boxarea" id="noteBoxArea">
			<button class="btn btn-outline-success my-2 my-sm-0" id="reBox"
				type="button"><a href='<c:url value="/message/messageBox.do?receiver=${loginInfo.id}"/>'>받은 쪽지함</a></button>
			<button class="btn btn-outline-success my-2 my-sm-0" id="seBox"
				type="button"><a href='<c:url value="/message/sendMessageBox.do?writer=${loginInfo.idx}"/>'>보낸 쪽지함</a></button>
			<div class="searchNote">
				<form class="form-inline mt-2 mt-md-0"
					action="<c:url value="/message/searchNote.do"/>" method="post">
					<input type="hidden" name="loginId" value="${loginInfo.id }">
					<input type="hidden" name="loginIdx" value="${loginInfo.idx }">
					<select class="form-control mr-sm-2" name="noteSort">
						<option selected value="1">받은 쪽지함</option>
						<option value="2">보낸 쪽지함</option>
					</select> <select class="form-control mr-sm-2" name="searchSort">
						<option selected value="1">아이디</option>
						<option value="2">제목</option>
						<option value="3">내용</option>
					</select> <input class="form-control mr-sm-2" type="text" name="noteSearch"
						placeholder="Search" aria-label="Search">
					<button class="btn btn-outline-success my-2 my-sm-0" type="submit">쪽지
						검색</button>
				</form>
			</div>

		</div>
		<hr>
		<div class="contentsArea">

			<div class="noteBox SendNoteArea">
				<div class="onlybox">
					<c:if test="${sendNoteList.messageList != null}">
						<table class="table table-hover">
							<tr>
								<th scope="col">#</th>
								<th scope="col">받는이</th>
								<th scope="col">제목</th>
								<th scope="col">날짜</th>
								<th scope="col">읽음여부</th>
								<th scope="col">삭제</th>
							</tr>
							<c:forEach items="${sendNoteList.messageList}" var="SenderNotes">
								<c:if test="${loginInfo.idx eq SenderNotes.msg_writer}">
									<tr>
										<th scope="row">-</th>
										<td>${SenderNotes.msg_receiver}</td>
										<td><a class="view"
											href='<c:url value="/message/noteview.do?idx=${SenderNotes.msg_idx}"/>'>${SenderNotes.msg_title}</a></td>
										<td>${SenderNotes.msg_date}</td>
										<c:if test="${SenderNotes.readcheck==0}">
											<td><span class="readCheck" style="color: red;">읽지
													않음</span></td>
											<td><a
												href="javascript:messageListDel(${SenderNotes.msg_idx})">
													발송취소 </a></td>
										</c:if>
										<c:if test="${SenderNotes.readcheck==1}">
											<td><span class="readCheck" style="color: green;">읽음</span></td>
											<td style="color: gray;">발송취소불가</td>
										</c:if>

									</tr>
								</c:if>
							</c:forEach>
						</table>
					</c:if>

					<c:if test="${sendNoteList.messageList==null}">

						<h3>보낸 쪽지가 존재하지 않습니다.</h3>

					</c:if>
				</div>
				<div class="paging">
					<c:forEach begin="1" end="${sendNoteList.pageTotalCount}" var="num">
						<a href="sendMessageBox.do?page=${num}&writer=${loginInfo.idx}"
							${sendNoteList.currentPageNumber eq num ? 'class="currentPage"' : '' }>[${num}]</a>
					</c:forEach>
				</div>

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
