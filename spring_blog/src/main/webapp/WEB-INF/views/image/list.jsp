<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
* {
	font-size: 20px;
}
div {
	text-align: center;
}
.search {
	margin-top: 20px;
	margin-bottom: 20px;
}
table {
	width: 100px;
	margin: 0 auto;
}

table, th, td {
	text-align: center;
	border: 1px solid gray;
	border-collapse: collapse;
}

th, td {
	padding: 10px
}

a:LINK {
	color: ##234;
	text-decoration: none;
}

a:VISITED {
	color: #000000;
	text-decoration: none;
}

a:HOVER {
	color: #ff0000;
	text-decoration: none;
}

a:ACTIVE {
	color: #ff2487;
	text-decoration: none;
}
</style>

<script type="text/javascript">
function read(imageno){
	var url = "./read";
	url += "?imageno="+imageno;
	url = url+ "&col=${col}";
	url = url+ "&word=${word}";
	url += "&nowPage=${nowPage}";
	location.href = url;
	}
</script>
</head>
<!-- *********************************************** -->
<body>
	<!-- *********************************************** -->
	<DIV class="title" style="color: red;">[ 이미지게시판 목록 ]</DIV>
	<div class="search">
		<form method="post" action="./list">
			<select name="col">
				<option value="pname" 
				<c:out value="${col=='pname' ? 'selected' : '' }"/>				
				>작성자</option>
				<option value="title"
				<c:out value="${col=='title' ? 'selected' : '' }"/>	
				>제목</option>
				<option value="content"
				<c:out value="${col=='content' ? 'selected' : '' }"/>	
				>내용</option>
				<option value="전체출력">전체출력</option>
			</select> <input type="text" name="word">
			<button>검색</button>
			<button type="button" onclick="location.href='./create'">등록</button>
		</form>
	</DIV>

	<TABLE>
		<TR>
		<c:forEach var="dto" items="${list}">
			<TH style="color: pink;" colspan="6">
				<c:forEach var="j" begin="1" end="${dto.indent}">
						<c:out value="&nbsp;&nbsp;" escapeXml="false"/>
				</c:forEach>
				<c:if test="${dto.indent > 0 }">
						<img src='${root}/images/re.jpg'>
				</c:if>
			</TH>
		</c:forEach>
		</TR>
		<tr>
			<c:forEach var="dto" items="${list }">
				<TD colspan="6"><img src="./storage/${dto.fname}"
				width="300px"></TD>
			</c:forEach>
		</tr>
		<tr>
			<c:forEach var="dto" items="${list }">
				<td colspan="6" style="background-color: pink; color: white;"><a
				href="javascript:read('${dto.imageno}')"> ${dto.title}</a></td>
			</c:forEach>
		</tr>
		<tr>
			<c:forEach var="dto" items="${list }">
				<th style="background-color: pink; color: white;">Grpno</th>
				<td style="color: pink;">${dto.grpno}</td>
				<th style="background-color: pink; color: white;">Indent</th>
				<td style="color: pink;">${dto.indent}</td>
				<th style="background-color: pink; color: white;">Ansnum</th>
				<td style="color: pink;">${dto.ansnum}</td>
			</c:forEach>
		</tr>
	</table>
	<div class="bottom">
	${paging}
	</div>
</body>
</html>
