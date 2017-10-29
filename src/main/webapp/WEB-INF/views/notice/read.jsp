<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<link href="${root}/css/bs/style.css" rel="stylesheet">

<script>
function ndelete() {
	if(confirm("정말 삭제하시겠습니까?")){
		var url = "./delete"
		url += "?noticeno=${vo.noticeno}";
		url += "&col=${param.col}";        
		url += "&word=${param.word}";      
		url += "&nowPage=${param.nowPage}";
			
		location.href=url;
	}
}
</script>
<header id="page-top" class="blog-banner" >
       <!-- Start: Header Content -->
       <div class="container" id="blog">
           <div class="row blog-header text-center wow fadeInUp" data-wow-delay="0.5s">
               <div class="col-sm-12">
                   <!-- Headline Goes Here -->
                   <h4 style="font-family: '휴먼편지체';"> 왕은실 Caligraphy </h4>
                   <h3 style="font-family: '휴먼편지체';">공지사항</h3> 
               </div>
           </div>
           <!-- End: .row -->
       </div>

       <!-- End: Header Content -->
</header>
<div>
	<table class= "table">
	<tr>
		<td style="font-weight: bold;">${vo.title}</td>
	</tr>
	<tr>
		<td>${vo.content }</td>
	</tr>
	</table>
</div>
<c:if test="${sessionScope.grade eq 'A' }">
<div style="margin-top: 50px">
	<button type="button" class = "form-control btn-primary" onclick="ndelete()">삭제</button>
</div>
</c:if>