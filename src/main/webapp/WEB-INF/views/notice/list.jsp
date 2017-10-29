<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<style>
hr {
  border-width: 1px 0;
  border-color : #cac3c3;
  margin: 18px 0;
}
</style>

<script>
function read(noticeno) {
	var url = "./read";
	url += "?noticeno=" + noticeno;
	url += "&col=${col}";
	url += "&word=${word}";
	url += "&nowPage=${nowPage}";
	location.href = url;
}
</script>

<div align="center">
<h3>공지사항</h3>


<table class = "table">
<tr>	
	<th width="5%">NO</th>
	<th width = "70%">제목</th>
	<th>작성일</th>
	<th>조회수</th>
</tr>
<c:choose>
	<c:when test="${empty list}">
		<tbody>
			<tr>
				<td colspan="8">등록된 글이 없습니다.</td>
			</tr>
		</tbody>
	</c:when>
	<c:otherwise>
		<c:forEach var="vo" items="${list }">
			<tr>
				<td>${vo.noticeno}</td>
				<td>
					<a href="javascript:read('${vo.noticeno}')"> 
					${vo.title}
				</a> 
				</td>
				<td>${vo.wdate}</td>
				<td>${vo.viewcnt}</td>
			</tr>
		</c:forEach>
	</c:otherwise>
</c:choose>
</table>
</div>
<hr>
<DIV>${paging}</DIV>
<br>
<div align="center" class = "row">
	<form method="post" action="./list" class="form-inline">
	<div class="col-md-16">
		<select name="col" class = "form-control">
			<option value="title"
				<c:out value="${col=='title' ? 'selected' : '' }"/>>제목</option>
			<option value="content"
				<c:out value="${col=='content' ? 'selected' : '' }"/>>내용</option>
			<option value="total">전체출력</option>
		</select> 
			<input type="text" name="word" class = "form-control" value="${word}">
			<button type = "submit" class = "form-control btn-primary"> 검색</button>
	</div>
	</form>
</div>
<c:if test="${sessionScope.grade eq 'A' }">
<div style="margin-top: 50px">
	<button type="button" class = "form-control btn-primary" onclick="location.href='create'">등록</button>
</div>
</c:if>
