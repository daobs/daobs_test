<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/ssi/member_ssi.jsp" %> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title>
<script type="text/javascript">
function read(){
var url = "read";
url += "?id=${id}";
location.href=url;
 
}
</script> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 
<link href="${root}/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
 
<DIV class="title">사진변경</DIV>
<DIV class="content">
<c:choose>
	<c:when test="${flag }">
	사진을 변경했습니다.
	</c:when>
	<c:otherwise>
	사진 변경에 실패했습니다.
	</c:otherwise>
</c:choose>
</DIV> 
 
    
<DIV class='bottom'>
<c:choose>
<c:when test="${flag}">
  <input type='button' value='나의정보' onclick="read()">
</c:when>
<c:otherwise>
  <input type='button' value='다시시도' onclick="history.back()">
</c:otherwise>
</c:choose>
</DIV>
 
</body>
<!-- *********************************************** -->
</html> 