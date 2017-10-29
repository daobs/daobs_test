<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/member_ssi.jsp" %>
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
<script type="text/javascript">
function use() {
	opener.frm.id.value = '${param.id}';
	window.close();
}
</script>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
 
<DIV class="title">아이디 중복 확인</DIV>
 
 <div class="content">
 입력된 ID : ${param.id}<br><br>
 <c:choose>
 	<c:when test="${flag }">
 		중복된 아이디입니다.
 	</c:when>
 	<c:otherwise>
 		사용가능.<br>
 		<button type='button' onclick='use()'>사용</button>
 	</c:otherwise>
 </c:choose>
 </div>
  
  <DIV class='bottom'>
    <input type='button' value='다시 시도' onclick="location.href='id_form'">
    <input type='button' value='닫기' onclick="window.close()">
  </DIV>










