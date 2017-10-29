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

</style> 
<link href="${root}/css/style.css" rel="styleSheet" type="text/css">
<script type="text/javascript">
function mupdate(memono){
	var url = "./update";
	url += "?memono="+memono;
	url += "&col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
	location.href= url;
}
function mdelete(memono){
	var url ="./delete";
	url += "?memono="+memono;
	url += "&col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
	location.href=url;
}
function mreply(memono){
	var url = "./reply";
	url += "?memono="+memono;
	url += "&col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
	location.href=url;
}
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

<div class="title"> [ 메 모 내 용 ] </div>
<table>
	<tr>
		<th> 제 목 </th>
		<td>${dto.title}</td>	
	</tr>
	<tr>
		<th> 내 용 </th>
		<%-- <td> ${content %>  </td> --%>
		<td> <textarea rows="10" cols="29" readonly="readonly" style="resize: none;"> ${dto.content} </textarea> </td>
	</tr>
	<tr>
		<th> 조회수 </th>
		<td>${dto.viewcnt} </td>
	</tr>
	<tr>
		<th> 등록일 </th>
		<td>${dto.wdate} </td>
	</tr>
</table>
<div class="bottom">
	<button type="button" onclick="location.href='./create'">등록</button>
	<button type="button" onclick="mupdate('${dto.memono}')">수정</button>
	<button type="button" onclick="mdelete('${dto.memono}')">삭제</button>
	<button type="button" onclick="mreply('${dto.memono}')">답글</button>
	<button type="button" onclick="mlist()">목록</button> 
</div>

</body> 
</html>