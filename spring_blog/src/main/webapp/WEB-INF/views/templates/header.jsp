<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="util" uri="/ELFunctions" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<style type="text/css">

.table, .td {
	border-style: none;
}

.img {
	width: 100%;
	height: 40%;
}

li#admin {
	float: right;
	padding-right: 30px
}
.title {
	text-align: center;
	font-size: 30px;
	font-weight: bold;
}
</style>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 
<!-- Latest compiled JavaScript -->
 
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- 상단 메뉴 -->
	<div style="background-color: #EEEEEE;">
		<table class="table">
			<tr>
				<td class="td">
					<img class="img" src="${root}/images/tropica.jpg">
				</td>
			</tr>

			<tr>
				<td class="td">
					<nav class="navbar navbar-inverse">						
						<div class="container-fluid">
							<div class="navbar-header">
								<a class="navbar-brand" href="${root}/">MVC_BLOG</a>
								<c:if test="${not empty sessionScope.id}">
									<a class="navbar-brand" href="${root}/member/delete">회원탈퇴</a>
									<a class="navbar-brand" href="${root}/member/update">회원수정</a>
								</c:if>
							</div>
							<ul class="nav navbar-nav">
													
								<li class="dropdown"><a class="dropdown-toggle"
									data-toggle="dropdown" href="#">게시판 <span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a href="${root}/bbs/create">생성</a></li>
										<li><a href="${root}/bbs/list">목록</a></li>
									</ul>
								</li>
								<li class="dropdown"><a class="dropdown-toggle"
									data-toggle="dropdown" href="#">메모 <span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a href="${root}/memo/create">생성</a></li>
										<li><a href="${root}/memo/list">목록</a></li>
									</ul>
								</li>
								<li class="dropdown"><a class="dropdown-toggle"
									data-toggle="dropdown" href="#">팀 <span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a href="${root}/team/create">생성</a></li>
										<li><a href="${root}/team/list">목록</a></li>
									</ul>
								</li>
								<li class="dropdown"><a class="dropdown-toggle"
									data-toggle="dropdown" href="#">이미지 <span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a href="${root}/image/create">생성</a></li>
										<li><a href="${root}/image/list">목록</a></li>
									</ul>
								</li>					
							</ul>
							<ul class="nav navbar-nav navbar-right">
								<c:choose>
									<c:when test="${empty sessionScope.id}">
										<li><a href="${root}/member/agree"><span class="glyphicon glyphicon-user"></span>Sign Up</a></li>
										<li><a href="${root}/member/login"><span class="glyphicon glyphicon-log-in"></span>Login</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="${root}/member/read"><span class="glyphicon glyphicon-user"></span> My Info</a></li>
										<li><a href="${root}/member/logout"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
										<c:if test="${sessionScope.grade eq 'A'}">
											<li id="admin">
		  										<a href="${root}/admin/list"><span class="glyphicon glyphicon-user"></span>
		  										회원목록</a>
		  									</li>
		  								</c:if>								
									</c:otherwise>
								</c:choose>
							</ul>
						</div>
					</nav>
				</td>
			</tr>
		</table>
	</div>
	<!-- 상단 메뉴 끝 -->

	<!-- 내용 시작 -->
	<div style="width: 100%; padding-top: 10px;">