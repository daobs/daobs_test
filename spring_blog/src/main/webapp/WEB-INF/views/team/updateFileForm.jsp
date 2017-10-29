<%@ page contentType="text/html; charset=UTF-8" %> 
 
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
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
function inCheck(f){
	if(f.filename.value == ""){
		alert("파일을 선택하세요");
		f.filename.focus();
		return false;
	}
}
</script>
</head> 
<!-- *********************************************** -->
<body>
 
<DIV class="title">[ 팀 사진수정 ]</DIV>
 
<FORM name='frm' method='POST' enctype="multipart/form-data" action='./updateFile' onsubmit="return inCheck(this)">
<input type="hidden" name="teamno" value="${param.teamno}">
<input type="hidden" name="oldFile" value="${param.oldFile}">
<input type="hidden" name="col" value="${param.col}">
<input type="hidden" name="word" value="${param.word}">
<input type="hidden" name="nowPage" value="${param.nowPage}">
  <TABLE>
  	<TR>
      <TH>원본사진</TH>
      <TD><img src="./storage/${param.oldFile}" width="300px"> <br>
      	원본파일명 : ${param.oldFile}
      </TD>
    </TR>
    <TR>
      <TH>변경사진</TH>
      <TD><input type="file" name="filenameMF" accept=".jpg,.png,.gif,.jpeg"></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='사진변경'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 
