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
img {
	display: block;
	margin-left: auto;
	margin-right: auto;
}
</style> 
<link href="${root}/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">

function tupdate(){
	var url = "./update";
	url += "?teamno="+${dto.teamno};
	url += "&col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
	location.href=url;
}
function tdelete(){
	if(confirm("정말 삭제하시겠습니까?")){
		var url = "./delete";
		url += "?teamno=${dto.teamno}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&oldFile=${dto.filename}"
		url += "&nowPage=${param.nowPage}";
		location.href=url;
	}
}
function tlist(){
	var url = "./list";
	url += "?col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
	
	location.href=url; 
}
function updateFile(){
	var url = "./updateFile";
	url += "?teamno=${dto.teamno}";
	url += "&oldFile=${dto.filename}";
	url += "&col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
	location.href = url;
}
</script>
</head> 
<body> 
<div class="title"> [ TEAM 조회 ] </div>
<hr>
<br><br>
<table>
		<tr>
			<td rowspan="5" width="30%">
				<img src="./storage/${dto.filename}" width="300px"></td>
			<th width="20%">이&emsp;&emsp;름</th>
			<td width="50%">
				${dto.name}
			</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>${dto.phone}</td>
		</tr>
		<tr>
			<th>보유기술</th>
			<td>${dto.skill}</td>
		</tr>
		<tr>
			<th>성&emsp;&emsp;별</th>
			<td>${dto.gender}</td>
		</tr>
		<tr>
			<th>취&emsp;&emsp;미</th>
			<td >${dto.hobby}</td>
		</tr>
		<tr>
			<th>주&emsp;&emsp;소</th>
			<td colspan="2">${dto.address1} ${dto.zipcode}</td>
		</tr>
		<tr>
			<th>상세주소</th>
			<td colspan="2">${dto.address2}</td>
		</tr>
</table>
<div class="bottom">
<button type="button" onclick="location.href='./create'">등록</button>
<button type="button" onclick="tupdate()">수정</button>
<button type="button" onclick="tdelete()">삭제</button>
<button type="button" onclick="tlist()">목록</button>
<button type="button" onclick="updateFile()">사진수정</button>
</div>
</body> 
</html>