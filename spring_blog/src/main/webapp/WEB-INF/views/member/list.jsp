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
<script type="text/javascript">
	function read(id) {
		var url = "${root}/member/read";
		url += "?id=" + id;
		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";

		location.href = url;
	}
</script>
<link href="${root}/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body>

	<DIV class="title">회원목록</DIV>
	<div class="search" style="text-align: center;">
		<FORM name='frm' method='POST' action='./list'>
			<select name="col">
				<option value="mname"
					<c:out value="${col=='mname' ? 'selected' : '' }"/>>성명</option>
				<option value="email"
					<c:out value="${col=='email' ? 'selected' : '' }"/>>이메일</option>
				<option value="id" <c:out value="${col=='id' ? 'selected' : '' }"/>>아이디</option>
				<option value="total">전체출력</option>
			</select> <input type="text" name="word" value='${word }'> <input
				type="submit" value="검색"> <input type="button" value="회원가입"
				onclick="location.href='${root}/member/agree'">
		</FORM>
	</div>
	<TABLE>
		<c:forEach var="dto" items="${list}">
			<TR>
				<TD rowspan='5' width="30%"><img src='${root }/member/storage/${dto.fname}' width="225" height="225"></TD>
				<tH width="20%">아이디</tH>
				<TD width="50%"><a href="javascript:read('${dto.id}')">
						${dto.id}</a></TD>
			</TR>
			<TR>
				<TH>성명</TH>
				<TD>${dto.mname}</TD>
			</TR>
			<TR>
				<TH>전화번호</TH>
				<TD>${dto.tel}</TD>
			</TR>
			<TR>
				<TH>이메일</TH>
				<TD>${dto.email}</TD>
			</TR>
			<TR>
				<TH>주소</TH>
				<TD>${dto.address1} ${util:jobName(dto.job)}</TD>
			</TR>
		</c:forEach>
	</TABLE>

	<DIV class='bottom'>${paging}</DIV>


</body>
<!-- *********************************************** -->
</html>
