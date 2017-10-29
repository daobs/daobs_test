<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
	function read(bbsno) {
		var url = "./read";
		url += "?bbsno=" + bbsno;
		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";
		location.href = url;
	}
</script>
<style type="text/css">
* {
	font-size: 20px;
}

.search {
	margin: 10px auto;
	text-align: center;
}
</style>
<%-- 
<link href="${pageContext.request.contextPath }/css/style.css" rel="Stylesheet" type="text/css">
--%>
</head>
<!-- *********************************************** -->
<body>

	<DIV class="title">[ BBS BOARD ]</DIV>
	<div class="search">
		<form method="post" action="./list">
			<select name="col">
				<option value="wname"
					<c:out value="${col=='wname' ? 'selected' : '' }"/>>작성자</option>
				<option value="title"
					<c:out value="${col=='title' ? 'selected' : '' }"/>>제목</option>
				<option value="content"
					<c:out value="${col=='content' ? 'selected' : '' }"/>>내용</option>
				<option value="total">전체출력</option>
			</select> <input type="text" name="word" value="${word}">
			<button>검색</button>
			<button type="button" onclick="location.href='./create'">등록</button>
		</form>
	</div>
	<div class="container">
		<h2>게시판 목록</h2>
		<TABLE class="table table-hover">
			<TR>
				<TH>번호</TH>
				<TH>제목</TH>
				<TH>성명</TH>
				<TH>조회수</TH>
				<TH>등록일</TH>
				<TH>grpno</TH>
				<TH>indent</TH>
				<TH>ansnum</TH>
			</TR>
			<c:choose>
				<c:when test="${empty list}">
					<tbody>
						<tr>
							<td colspan="8">등록된 글이 없습니다.</td>
						</tr>
					</tbody>
				</c:when>
				<c:otherwise>
					<c:forEach var="dto" items="${list }">

						<tr>
							<td>${dto.bbsno}</td>
							
							<td><c:forEach var="j" begin="1" end="${dto.indent }">
									<c:out value="&nbsp;" escapeXml="false" />
									
								</c:forEach> <c:if test="${dto.indent > 0 }">
									<img src='${root}/images/re.jpg'>
									
								</c:if> 
								<c:set var = "rcount" value = "${util:rcount(dto.bbsno, rdao) }"></c:set>
								<a href="javascript:read('${dto.bbsno}')"> 
								${dto.title}
								<c:if test="${rcount > 0 }">
									<span style="color: red">(${rcount })</span>
								</c:if>
								</a> 
								<c:if test="${util:newImg(fn:substring(dto.wdate, 0,10)) }">
									<img src="${root}/images/new.gif">
								</c:if></td>
							<td>${dto.wname}</td>
							<td>${dto.viewcnt}</td>
							<td>${dto.wdate}</td>
							<td>${dto.grpno}</td>
							<td>${dto.indent}</td>
							<td>${dto.ansnum}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>


		</TABLE>
	</div>

	<DIV class='bottom'>${paging}</DIV>


</body>
<!-- *********************************************** -->
</html>
