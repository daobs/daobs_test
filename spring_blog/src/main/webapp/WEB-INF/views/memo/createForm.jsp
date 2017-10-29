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
<link href="${root }/css/style.css" rel="styleSheet" type="text/css">
</head> 
<body> 
<div class="title">[ 메 모 작 성  ]</div>
<form action="./create" method="post" name="frm">
	<fieldset>
		<legend></legend>
		<table>
		<tr>
			<th>제 목</th>
			<td> <input type="text" name="title" size="30" > </td>
		</tr>
		<tr>
			<th>내 용</th>
			<td>
				<textarea rows="10" cols="29" name="content"></textarea>
			</td>
		</tr>
		</table>
	<div class="bottom">
		<input type="submit" value="저장">
	</div>
	</fieldset>
</form>
</body> 
</html>
