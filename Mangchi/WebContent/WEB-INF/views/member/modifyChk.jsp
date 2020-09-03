<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${resultCnt == 1}">
	<script>
		alert("수정이 완료되었습니다.");
	</script>
</c:if>
<c:if test="${resultCnt == 0}">
	<script>
		alert("수정에 실패하였습니다.");
	</script>
</c:if>
<c:if test="${resultCnt == 2}">
	<script>
		alert("회원 탈퇴 처리가 정상적으로 되었습니다.");	
	</script>
</c:if>
<c:if test="${resultCnt == 3}">
	<script>
		alert("회원 탈퇴 처리가 실패했습니다.");	
	</script>
</c:if>
	<script>
	location.replace("/Mangchi/index.do");
	</script>