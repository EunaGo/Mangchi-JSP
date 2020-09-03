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
	height: 500px;
}


div.SendNoteArea {
	display: none;
}

/* div.contentsArea {
	height: 450px;
	overflow: auto;
} */

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
div.paging {
	text-align: center;
}

@media 
only screen and (max-width: 760px),
(min-device-width: 768px) and (max-device-width: 1024px)  {

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
	
	tr { border: 1px solid #ccc; }
	
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
	
	td::before{
	font-weight: bold;
	color: #369;
	}
	
	
	td:nth-of-type(4){
	
	width: 80%;
	}
}	

</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>
	function messageListDel(idx) {
		if (confirm('해당 메시지를 정말로 삭제하시겠습니까?')) {
			location.href = 'messageDelete.do?idx=' + idx;
		}
	}

	function messageDel(idx) {
		if (confirm('해당 메시지를 정말로 삭제하시겠습니까?\n삭제된 메시지는 복구할 수 없습니다.')) {
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
				type="button">
				<a href="<c:url value="/message/messageBox.do"/>">쪽지함으로 돌아가기</a>
			</button>

		</div>
		<hr>
		<div class="contentsArea">
			<div class="noteBox ReNoteArea">
				<c:if test="${searchNoteList.messageList != null}">
					<table class="table table-hover">
						<tr>
							<th scope="col">#</th>
							<th scope="col">받은이</th>
							<th scope="col">보낸이</th>
							<th scope="col">제목</th>
							<th scope="col">날짜</th>
							<th scope="col">삭제</th>
						</tr>
						<c:forEach items="${searchNoteList.messageList}" var="notes">
							<c:if test="${noteSort==1 }">
								<c:if test="${loginInfo.id eq notes.msg_receiver}">
									<tr>
										<th scope="row">-</th>
										<td>${notes.msg_receiver}</td>
										<td>${notes.msg_writerId}</td>
										<td><a class="view"
											href="/message/noteview.do?idx=${notes.msg_idx}">${notes.msg_title}</a>
										</td>
										<td>${notes.msg_date}</td>
										<td><a href="javascript:messageDel(${notes.msg_idx})">
												<svg width="1em" height="1em" viewBox="0 0 16 16"
													class="bi bi-trash" fill="currentColor"
													xmlns="http://www.w3.org/2000/svg">
  <path
														d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z" />
  <path fill-rule="evenodd"
														d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z" />
</svg>
										</a></td>
									</tr>
								</c:if>
							</c:if>
							<c:if test="${noteSort==2 }">
								<c:if test="${loginInfo.idx eq notes.msg_writer}">
									<tr>
										<th scope="row">-</th>
										<td>${notes.msg_receiver}</td>
										<td>${notes.msg_writerId}</td>
										<td><a class="view"
											href="/message/noteview.do?idx=${notes.msg_idx}">${notes.msg_title}</a>
										</td>
										<td>${notes.msg_date}</td>
										<c:if test="${notes.readcheck==0}">
											<td><span class="readCheck" style="color: red;">읽지
													않음</span></td>
											<td><a
												href="javascript:messageListDel(${notes.msg_idx})">
													발송취소 </a></td>
										</c:if>
										<c:if test="${notes.readcheck==1}">
											<td><span class="readCheck" style="color: green;">읽음</span></td>
											<td style="color: gray;">발송취소불가</td>
										</c:if>
									</tr>
								</c:if>
							</c:if>
						</c:forEach>
					</table>
				</c:if>

				<c:if test="${searchNoteList.messageList==null}">

					<h3>검색 결과가 존재하지 않습니다.</h3>

				</c:if>
				<div class="paging">
					<c:forEach begin="1" end="${searchNoteList.pageTotalCount}" var="num">
						<a href="searchNote.do?page=${num}"
							${searchNoteList.currentPageNumber eq num ? 'class="currentPage"' : '' }>[${num}]</a>
					</c:forEach>
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
	window.jQuery
			|| document
					.write('<script src="<c:url value='/assets/js/vendor/jquery.slim.min.js'/>"><\/script>')
</script>
<script src="<c:url value='/assets/dist/js/bootstrap.bundle.js'/>"></script>
</body>
