<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
* {
	font-family: gulim;
	font-size: 20px;
	text-align: center;
}
</style>
<link href="${root}/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
	function inCheck(f) {
		if (f.passwd.valuse == "") {
			alert("비번을 입력하세요");
			f.passwd.focus();
			return false;
		}
	}
	function ilist(){
		var url = "list";
		url += "?col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		location.href=url;
		
	}
</script>
</head>
<body>
	<c:choose>
		<c:when test="${flag}">
			<div class="content" style="color: red;">답글이 존재함으로 삭제 할 수 없습니다.
			</div>
			<br><br>
			<div class="bottom">

				<button type="button" onclick="location.href='./list'">돌아가기</button>

			</div>

		</c:when>
		<c:otherwise>
			<form action="delete" method="post" onsubmit="return inCheck(this)">
				<input type="hidden" name="imageno" value="${param.imageno}">
				<input type="hidden" name="oldFile" value="${param.oldFile}">
				<input type="hidden" name="col" value="${param.col}">
				<input type="hidden" name="word" value="${param.word}">
				<input type="hidden" name="nowPage" value="${param.nowPage}">

				<div>
					삭제를 하면 복구할 수 없습니다<br>
					<br> 삭제를 진행 하시겠습니까?<br>
					<br> 취소를 원하시면 목록버튼을 눌러주세요.<br>
					<br>
				</div>
				<table>
				<TR>
					<TH>비밀번호</TH>
					<TD><input type="password" name="passwd"></TD>
				</TR>
				</table>
				<div class="bottom">
					<br> <input type='submit'
						style="background-color: pink; color: white;" value='삭제'>
					<input type='button' style="background-color: pink; color: white;"
						value='목록' onclick="ilist()">

				</div>
			</form>

		</c:otherwise>
	</c:choose>


</body>