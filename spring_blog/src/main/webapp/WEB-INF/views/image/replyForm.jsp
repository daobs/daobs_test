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
<link href="${root }/css/style.css" rel="stylesheet" 
type="text/css">
</head> 
<body>
<div class="title">답변</div>
<form name="frm" method="POST" action="./reply" enctype="multipart/form-data">
<input type="hidden" name="imageno" value="${dto.imageno}">
<input type="hidden" name="grpno" value="${dto.grpno}">
<input type="hidden" name="indent" value="${dto.indent}">
<input type="hidden" name="ansnum" value="${dto.ansnum}">
<input type="hidden" name="col" value="${param.col}">
<input type="hidden" name="word" value="${param.word}">
<input type="hidden" name="nowPage" value="${param.nowPage}">

		<table>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="pname" size="45"
					value="${dto.pname}" /></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" size="45"
					value="${dto.title}의답변" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="45" name="content"></textarea>
				</td>
				
			</tr>
			<tr>
				<th>답글 이미지</th>
				<td ><input type="file" name="fnameMF" accept=".png,.jpg,.gif">
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td ><input type="password" name="passwd">
				</td>
			</tr>
		</table>
		<div class="bottom">
<input type="submit" value="답변">
</div>

</form>
</body> 
</html>