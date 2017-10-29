<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답변</title>
<script type="text/javascript">
	function inCheck(f) {
		if (f.wname.value == "") {
			alert("이름을 입력하세요");
			f.wname.focus();
			return false;
		}
		if (f.title.value == "") {
			alert("제목을 입력하세요");
			f.title.focus();
			return false;
		}
		if (CKEDITOR.instances['content'].getData() == '') {
		      window.alert('내용을 입력해 주세요.');
		      CKEDITOR.instances['content'].focus();
		      return false;
		}
		if (f.passwd.value == "") {
			alert("비번을 입력하세요");
			f.passwd.focus();
			return false;
		}
	}
</script>

<link href="${root}/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
<script type="text/JavaScript">
	window.onload = function() {
		CKEDITOR.replace('content'); // <TEXTAREA>태그 id 값
	};
</script>
</head>
<!-- *********************************************** -->
<body>

	<DIV class="title">게시판 등록</DIV>

	<FORM name='frm' method='POST' action='./reply'
		onsubmit="return inCheck(this)">
		<input type="hidden" name="bbsno" value="${dto.bbsno}">
		<input type="hidden" name="grpno" value="${dto.grpno}">
		<input type="hidden" name="indent" value="${dto.indent}">
		<input type="hidden" name="ansnum" value="${dto.ansnum}">
		<input type="hidden" name="col" value="${param.con}">
		<input type="hidden" name="word" value="${param.word}">
		<input type="hidden" name="nowPage" value="${param.nowPage}">
		<TABLE>
			<TR>
				<TH>성명</TH>
				<TD><input type="text" name="wname"></TD>
			</TR>
			<TR>
				<TH>제목</TH>
				<TD><input type="text" name="title" value="${dto.title}"></TD>
			</TR>
			<TR>
				<TD colspan="2"><textarea rows="10" cols="45" name="content"></textarea></TD>
			</TR>
			<TR>
				<TH>비밀번호</TH>
				<TD><input type="password" name="passwd"></TD>
			</TR>
		</TABLE>

		<DIV class='bottom'>
			<input type='submit' value='댓글 등록'> <input type='button'
				value='취소' onclick="history.back()">
		</DIV>
	</FORM>


</body>
<!-- *********************************************** -->
</html>
