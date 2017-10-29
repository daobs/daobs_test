<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
div {
	text-align: center;
	/* margin-top: 100px; */
	font-weight: bold;
} 
</style> 
<link rel="styleSheet" href="${root}/css/style.css" type="text/css">
<script type="text/javascript">
function mlist(){
	var url = "./list";
	url += "?col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
	location.href= url;
}
</script>
</head> 
<body> 
<div class="title">[ 삭 제 확 인  ]</div>
<c:choose>
<c:when test="${flag}">
<div class="content">답글이 존재하므로 삭제할 수 없습니다.</div>
<div class="bottom">	
		<button type="button" onclick="history.back()" >뒤로가기</button>
		<button type="button" onclick="location.href='./list'">목록</button>
	</div>
</c:when>
<c:otherwise>
<form action="./delete" method="post">
	<input type="hidden" name="memono" value="${param.memono}">
	<input type="hidden" name="col" value="${param.col}">
	<input type="hidden" name="word" value="${param.word}">
	<input type="hidden" name="nowPage" value="${param.nowPage}">
	<div class="content">
		삭제를 하면 복구할 수 없습니다.<br><br>
		삭제를 하시려면 삭제 버튼을 눌러주세요.<br><br>
		취소는 '목록'버튼을 눌러주세요.<br><br>
	</div>
	<div class="bottom">	
		<button type="button" onclick="mlist()">목록</button>
		<button type="submit">삭제</button>
	</div>
</form>
</c:otherwise>
</c:choose>
</body> 
</html>
 