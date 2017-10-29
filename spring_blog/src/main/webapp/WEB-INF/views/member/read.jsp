<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/member_ssi.jsp" %>
<c:if test="${empty nowPage || nowPage == 'null' }">
	<c:set var="nowPage" value="1"/>
</c:if>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title>
<script type="text/javascript">
function updateFile(){
var url = "updateFileForm.do";
url += "?id=${dto.id}";
url += "&oldfile=${dto.fname}";
 
location.href=url;
}
</script>
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 
<script type="text/javascript">
function mlist() {
	var url = "./list";
	url += "?col=${col}";
	url += "&word=${word}";
	url += "&nowPage=${nowPage}";
	location.href=url;
}
function mdelete() {
	var url = "./delete";
	url += "?col=${col}";
	url += "&word=${word}";
	url += "&nowPage=${nowPage}";
	url += "&oldFile=${dto.fname}";
	url += "&id=${dto.id}";
	
	location.href=url;
}
function down(){
	var url = "${root}/download";
	url += "?dir=/member/storage";
	url += "&filename=${dto.fname}";
	
	location.href=url;
}
function update() {
	var url = "./update";
	url += "?col=${col}";
	url += "&word=${word}";
	url += "&nowPage=${nowPage}";
	url += "&id=${dto.id}";
	
	location.href=url;
}
function updatePw() {
	var url = "./updatePw";
	url += "?col=${col}";
	url += "&word=${word}";
	url += "&nowPage=${nowPage}";
	url += "&id=${dto.id}";
	
	location.href=url;
}
function updateFile() {
	var url = "./updateFile";
	url += "?col=${col}";
	url += "&word=${word}";
	url += "&nowPage=${nowPage}";
	url += "&id=${dto.id}";
	url += "&oldFile=${dto.fname}";
	
	location.href=url;
}
</script>
<link href="${root}/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
 
<DIV class="title">${dto.mname}의 회원정보</DIV>
 
 
<TABLE>
  <tr>
   <td colspan="2">
   <img src="./storage/${dto.fname}">
   </td>
  </tr>
  <TR>
    <TH>아이디</TH>
    <TD>${dto.id}</TD>
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
    <TH>우편번호</TH>
    <TD>${dto.zipcode}</TD>
  </TR>
  <TR>
    <TH>주소</TH>
    <TD>
    ${dto.address1}
    ${dto.address2}
    </TD>
  </TR>
  <TR>
    <TH>직업</TH>
    <TD>
     직업코드:${dto.job}
     (${util:jobName(dto.job)})
    </TD>
  </TR>
  <TR>
    <TH>날짜</TH>
    <TD>${dto.mdate}</TD>
  </TR>
</TABLE>
  
<DIV class='bottom'>
<c:if test="${not empty sessionScope.id && sessionScope.grade != 'A' }">
  <input type='button' value='비번변경' onclick="updatePw()">
  <input type='button' value='파일변경' onclick="updateFile()">
  <input type='button' value='다운로드' onclick="down()"> 
  <input type='button' value='회원목록' onclick="mlist()">
</c:if>
  <input type='button' value='정보수정' onclick="update()">
  <input type='button' value='회원삭제' onclick="mdelete()">
</DIV>
 
 
</body>
<!-- *********************************************** -->
</html> 