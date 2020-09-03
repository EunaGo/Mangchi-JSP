<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${delresult==1}">
<script>
	alert('삭제되엇습니다');
	location.href='<c:url value="/index.do"/>';
</script>
</c:if>
<c:if test="${delresult==0}">
<script>
	alert('삭제실패 \n 확인해주세요');
	location.href='<c:url value="/index.do"/>';
</script>
</c:if>
