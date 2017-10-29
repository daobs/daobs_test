<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
	function inputCheck(f) {
		if (f.passwd.value == "") {
			alert("비번입력바람");
			f.passwd.focus();
			return false;
		}
	}
	function blist() {
		var url = "list";
		url += "?col=${param.col}";        
		url += "&word=${param.word}";      
		url += "&nowPage=${param.nowPage}";
		
		location.href=url;
	}
</script>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 20px;
}

div {
	text-align: center;
}
</style>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body>

	<DIV class="title">삭제</DIV>
	<c:choose>
		<c:when test="${flag}">
		<div class="content">답변글이 존재함으로 삭제할 수 없습니다.</div>
			<DIV class='bottom'>
				<input type='submit' value='목록' onclick="blist()">
				<input type='button' value='뒤로가기' onclick="history.back()">
			</DIV>
		</c:when>
	<c:otherwise>
	<FORM name='frm' method='POST' action='./delete'
		onsubmit="return inputCheck(this)">
		<input type="hidden" name="bbsno" value="${param.bbsno }">
		<input type="hidden" name="col" value="${param.col }">
		<input type="hidden" name="word" value="${param.word }">
		<input type="hidden" name="nowPage" value="${param.nowPage }">
		<div>삭제하면 복구 할 수 없습니다.</div>
		<br>
		<br>
		<TABLE>
			<TR>
				<TH>비밀번호</TH>
				<TD><input type="password" name="passwd"></TD>
			</TR>
		</TABLE>

		<DIV class='bottom'>
			<input type='submit' value='확인'>
			<input type='button' value='취소' onclick="history.back()">
		</DIV>
	</FORM>
	</c:otherwise>
	</c:choose>

</body>
<!-- *********************************************** -->
</html>
