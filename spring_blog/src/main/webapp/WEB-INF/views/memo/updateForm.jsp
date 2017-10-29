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
	margin-top: 20px;
	margin-bottom: 20px;
} 
table {
	width : 50%;
	margin : 0 auto;
}
table,th,td {
	border: 2px solid black;
	border-collapse: collapse;
	border-radius: 3px;
}
.first {
	font-weight: bold;
	font-size: 30px;
}
fieldset,legend {
	border : none;
}
input[type="text"],textarea {
	margin-left: 10px;
	margin-top: 2px;
}
</style> 
</head> 
<body> 
<div class="first">[ 메 모 수 정  ]</div>
<form action="./update" method="post" name="frm">
<input type="hidden" name="memono" value="${dto.memono}">
<input type="hidden" name="col" value="${param.col}">
<input type="hidden" name="word" value="${param.word}">
<input type="hidden" name="nowPage" value="${param.nowPage}">
	<fieldset>
		<legend></legend>
		<table>
		<tr>
			<th>제 목</th>
			<td> <input type="text" name="title" size="30" value="${dto.title}"> </td>
		</tr>
		<tr>
			<th>내 용</th>
			<td>
				<textarea rows="10" cols="29" name="content">${dto.content} </textarea>
			</td>
		</tr>
		</table>
	<div>
		<input type="submit" value="저장">
	</div>
	</fieldset>
</form>
</body> 
</html>