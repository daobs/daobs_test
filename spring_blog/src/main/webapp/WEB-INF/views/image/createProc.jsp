<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"   %>
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
<link href="${root }/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
 
<DIV class="title"> [ 이미지게시판 등록 처리 ] </DIV>
	<div class="content">
	<c:choose>
		<c:when test="${flag }">
		사진이 등록되었습니다.
		</c:when>
		<c:otherwise>
		사진등록이 실패했습니다.
		</c:otherwise>
	</c:choose>
  	</div>
  <DIV class='bottom'>
    <input type='button' value='목록'  onclick="location.href='./list'">
    <input type='button' value='계속등록' onclick="location.href='./create'">
  </DIV>

 
</body>
<!-- *********************************************** -->
</html> 
