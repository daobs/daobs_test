<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
<style type="text/css">
*{
	font-family:gulim;
	font-size:20px;
}
</style>
</head>
<body>
<DIV class="title">오류페이지</DIV>

<div class="content">
현재페이지에서 <br>
오류 발생
</div>

<DIV class="bottom">
	<button type="button" onclick="history.back()">다시시도</button>
</DIV>

</body>
</html>






