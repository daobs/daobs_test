<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/member_ssi.jsp"%>
<c:if test="${empty nowPage || nowPage == 'null' }">
	<c:set var="nowPage" value="1" />
</c:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
	function read() {
		var url = "read";
		url += "?id=${param.id}";
		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";

		location.href = url;
	}
	function mlist() {
		var url = "${root}/admin/list";
		url += "?col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";

		location.href = url;
	}
</script>
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

	<DIV class="title">정보수정</DIV>

	<div class="content">
		<c:choose>
			<c:when test="${flag}">
		정보를 수정했습니다.
	</c:when>
			<c:otherwise>
		정보수정 실패
	</c:otherwise>
		</c:choose>
	</div>
	<DIV class='bottom'>
		<input type='button' value='정보확인' onclick="read()"> <input
			type='button' value='다시시도' onclick="history.back()">
			<c:if test="${not empty sessionScope.id && sessionScope.grade == 'A' }">
			<button type="button" onclick="mlist()">목록</button>
			</c:if>
	</DIV>



</body>
<!-- *********************************************** -->
</html>
