<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
<form>
	<table>
	<tr>
		<th>작성자</th>
		<td>
			<input type = "text" name = "seedWriter">
		</td>
	</tr>
	<tr>
		<th>제목</th>
		<td>
			<input type = "text" name = "seedTitle">
		</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>
			<input type = "text" name = "seedContent">
		</td>
	</tr>
	
	</table>
	<button type = "submit">등록</button>
	<button onclick="history.back()">취소</button>
</form>
</div>
</body>
</html>