<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/member_ssi.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 20px;
}
</style>
<link href="${root }/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body>

	<DIV class="title">회원가입 처리</DIV>

	<div class='content'>
		<c:choose>
			<c:when test="${flag }">
	회원가입 성공
</c:when>
			<c:otherwise>
	회원가입 실패
</c:otherwise>
		</c:choose>
	</div>

	<c:choose>
		<c:when test="${flag }">
			<DIV class='bottom'>
				<input type='button' value='로그인'
					onclick="location.href='login'"> <input
					type='button' value='홈' onclick="location.href='${root}'">
			</DIV>
		</c:when>

		<c:otherwise>
			<DIV class='bottom'>
				<input type='button' value='다시시도' onclick="history.back()">
				<input type='button' value='홈'
					onclick="location.href='${root}'">
			</DIV>
		</c:otherwise>
	</c:choose>

</body>
<!-- *********************************************** -->
</html>
