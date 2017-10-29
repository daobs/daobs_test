<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"%> 

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
* { 
	font-size: 20px;
	font-family: MD아롱체;
	color: pink;
}

div {
	text-align: center;
	margin-top: 20px;
	margin-bottom: 20px;
	color: red;
}

table {
	width: inherit;
	margin: 0 auto;
}

table, th, td {
	font-family: MD아롱체;
	color: pink;
	border: 1px solid gray;
	border-collapse: collapse;
}
</style>

<script type="text/javascript">
function inCheck(f){
if(f.fname.value==""){
	alert("사진을 선택하세요");
	f.fname.focus();
	return false;
}
}

</script> 
</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
  
<div class="title">사진수정</div>
<form name='frm' method='post' 
enctype='multipart/form-data'
action='./updateFile'
onsubmit="return inCheck(this)"
>
<input type="hidden" name="imageno" value="${param.imageno}">
<input type="hidden" name="oldfile" value="${param.oldFile}">
<table>
<tr>
<th style="background-color: pink; color:white;">원본파일</th>
<td>
<img src="./storage/${param.oldFile}" width="500px" height="450px"><br>
원본파일명 : ${param.oldFile}
</td>
</tr>

<tr>
<th style="background-color: pink; color:white;">변경파일</th>
<td>
  <input type="file" name="fnameMF" accept=".png,.jpg,.gif">
</td>
</tr>


</table>
<div class="bottom">
<input type='submit' value="수정">
<input type="button" value="취소" onclick="history.back()">
</div>
</form>
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
 
</html> 
