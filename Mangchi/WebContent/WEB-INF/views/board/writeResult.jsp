<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="ko">
<head>

<title>M A N G C H | 우리 동네 대여 서비스</title>

<body>
	<c:if test="${writeResult < 1}">
		<script>
			alert('작성에 실패\n다시작성해주세요');
			location.href = 'posting.do';
		</script>
	</c:if>
	<c:if test="${writeResult >= 1}">
		<script>
			alert('작성되었습니다');
			location.href = 'currentMyRequest.do';
		</script>
	</c:if>
</body>
</html>