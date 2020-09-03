<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${delresult==1}">
<script>
	alert('메시지가 삭제되었습니다.');
	location.href="<c:url value='/message/messageBox.do'/>";
</script>
</c:if>