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

.search {
	margin: 10px auto;
	text-align: center;
}
</style>
<link href="${root}/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
function read(teamno){
	var url = "./read";
	url += "?teamno="+teamno;
	url += "&col=${col}";
	url += "&word=${word}";
	url += "&nowPage=${nowPage}";
	location.href=url;
}
function tlist(){
	var url = "./list";
	url += "?col=${col}";
	url += "&word=${word}";
	url += "&nowPage=${nowPage}";
	location.href = url;
	}
</script>
</head>
<body>
	<div class="title">[ TEAM 목록 ]</div>
	<hr>
	<div class="search">
		<form action="./list" method="post">
			<select name="col">
				<option value="name"
				<c:out value="${col=='name' ? 'selected' : '' }"/>
					>이름</option>
				<option value="phone"
				<c:out value="${col=='phone' ? 'selected' : '' }"/>
					>전화번호</option>
				<option value="skill"
				<c:out value="${col=='skill' ? 'selected' : '' }"/>
					>보유기술</option>
				<option value="total">전체출력</option>
			</select> <input type="text" name="word" value="${word}">
			<button>검색</button>
			<button type="button" onclick="location.href='./create'">등록</button>
		</form>
	</div>

	<br>
	<br>
		<c:forEach var="dto" items="${list}">
	<table>
			<tr>
				<td rowspan="4" width="30%"><img
					src="./storage/${dto.filename}" width="300px" height="280px"></td>
				<th width="20%">이&emsp;&emsp;름</th>
				<td width="50%"><a href="javascript:read('${dto.teamno}')">${dto.name}
				</a></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>${dto.phone}</td>
			</tr>
			<tr>
				<th>보유기술</th>
				<td>${dto.skill}</td>
			</tr>
	</table>
		</c:forEach>
	<div class="bottom">
		${paging}
	</div>
</body>
</html>