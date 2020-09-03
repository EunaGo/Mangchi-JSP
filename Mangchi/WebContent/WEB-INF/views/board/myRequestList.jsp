<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="ko">
<head>
<title>M A N G C H | 우리 동네 대여 서비스</title>
<!-- Bootstrap core CSS -->
<link rel='stylesheet'
	href='<c:url value="/assets/dist/css/bootstrap.css"/>'>
<style>
.list_num{
		float: left;
}


.list_num_sel{
	font-size: 1.5em;
	font-weight: bold;
	float: left;
}
.list{
	width : 100%;
	height: auto;
}
.req_box{
	background-color: antiquewhite;
	width:80%;
	border-radius:20px;
	cursor: pointer;
	margin: 10px;
	padding: 20px;
	
}

</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<br><br><br><br><br><br>
	<div class="list">
		<c:if test="${not empty myRequestListView.rqList}">
			
			<c:forEach items="${myRequestListView.rqList}" var="req">
				<div class="req_box">
					${req.req_title}<br>
					${req.writer_nick}<br>
					${req.req_loc}<br>
					${req.req_price}원<br>
					등록일 ${req.req_regdate}<br>
					반납일 ${req.req_term}
				</div>
		<%-- 			<td><a href="memberDel.do?delid=${member.uid}">삭제</a></td> --%>
			</c:forEach>
		</c:if>
	</div>
	<div class="paging">
	<c:if test="${myRequestListView.pageTotalCount > 0}">
		<c:forEach var="num" begin="1" end="${myRequestListView.pageTotalCount}">
			<div class="${myRequestListView.currentPageNumber == num? 'list_num_sel':'list_num'}"><a href="myRequestList.do?page=${num}" >&nbsp;${num}&nbsp;</a></div>
		</c:forEach>
	</c:if>
	</div><br>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
<script>
	$(document).ready
	$('.req_box').on('click',function(){
		$('.a');
    });
</script>
</body>
</html>