<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
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
.search{
	margin : 10px auto;
	text-align: center;
}
</style>
<link href="${root}/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
	function read(memono) {
		var url = "./read";
		url += "?memono=" + memono;
		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";
		location.href = url;
	}
</script>
</head>
<body>
	<div class="title">[ 메 모 목 록 ]</div>
	<hr>
	<div class="search">
		<form action="./list" method="post">
			<select name="col">
				<option value="title"
				<c:out value="${col=='title' ? 'selected' : '' }"/>
				>제목</option>
				<option value="content"
				<c:out value="${col=='content' ? 'selected' : '' }"/>
				>내용</option>
				<option value="total" >전체출력</option>
			</select>
			<input type="text" name="word" value="${word}">
			<button>검색</button>
			<button type="button" onclick="location.href='./create'">등록</button>
		</form>
	</div>
	<table>
		<tr>
			<th>번 호</th>
			<th>제 목</th>
			<th>날 짜</th>
			<th>조회수</th>
			<th>grpno</th>
			<th>indent</th>
			<th>ansnum</th>
		</tr>
		<c:choose>
		<c:when test="${empty list }">
		<!-- rs.next()를 사용하면 이미 └ 아래에 이미 내려와있기 때문에 그 내용을 바로 출력해주기
	위해서 do~while문 사용 -->
		<tr>
			<td colspan="7">등록된 메모가 없습니다.</td>
		</tr>
		
		</c:when>
		<c:otherwise>
		<c:forEach var="dto" items="${list }">
		<tr>
			<td>${dto.memono}</td>
			<td>
			<c:forEach var="j" begin="1" end="${dto.indent }">
				<c:out value="&emsp;&nbsp;" escapeXml="false"></c:out>
			</c:forEach>
			<c:if test="${dto.indent > 0}">
				<img src='${root }/images/re.jpg'>
			</c:if>
			<a href="javascript:read('${dto.memono}')">${dto.title} </a>
			<c:if test="${util:newImg(fn:substring(dto.wdate,0,10))}">
			<img src="${root}/images/new.gif">
			</c:if>
			</td>
			<td>${dto.wdate}</td>
			<td>${dto.viewcnt}</td>
			<td>${dto.grpno}</td>
			<td>${dto.indent}</td>
			<td>${dto.ansnum}</td>
		</tr>
		</c:forEach>
		</c:otherwise>
		</c:choose>
	</table>
	<div class="bottom">
		${paging}
	</div>

</body>
</html>