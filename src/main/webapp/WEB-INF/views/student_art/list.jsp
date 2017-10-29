<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<!-- Main Style -->
<link href="${root}/css/academy/style.css" rel="stylesheet">


<script type="text/javascript">
function read(num){
	location.href= "./read?pageName=academy";
}
</script>

<!-- header -->
<header id="page-top" class="blog-banner">
    <!-- Start: Header Content -->
    <div class="container" id="blog">
        <div class="row blog-header text-center wow fadeInUp" data-wow-delay="0.5s">
            <div class="col-sm-12">
                <!-- Headline Goes Here -->
                <h4 style="font-family: '휴먼편지체';"> Academy / Gallery </h4>
                <h3 style="font-family: '휴먼편지체';"> 수강생 작품 </h3> 
            </div>
        </div>
        <!-- End: .row -->
    </div>
    <!-- End: Header Content -->
</header>
<!--/. header -->
  <!-- Start : Blog Page Content 
==================================================-->
    <div class="blog_container blog_page_three">
        <div class="container">
            <div class="row">
                <!-- Blog Area -->
                <div class="col-sm-12 col-xs-12 blog-area">
                    <div class="row">
                    
                    	<c:forEach begin="0" end="8">
                        <div class="col-md-4 col-sm-6 col-xs-12">
                            <div class="blog-warp-1 wow fadeInLeft" data-wow-delay="0.5s">
                            <a href="./read">
								<div class="blog_imgg">
									<img src="${root}/images/academy/main.jpg"/>
		
								</div>
							</a>
                                <div class="blog_content_warp">
                                    <h5 style="text-align: center;"><a href="./read?photofoliono=1&pageName=project">홍삼이 짱짱맨</a></h5>
                                    <p style="text-align: center;">홍삼은 건강에 짱입니다 여러분들 </p>
                                </div>
                            </div>
                        </div>

                        </c:forEach>
                        

                </div>
                	<div class="col-lg-12" style="margin-top: 50px;">
			<nav class="pagination">
				<ul class="pager" style="float: right">
					<li><a href="#"> &lt;</a></li>
					<li><a href="#">01</a></li>
					<li class="pagi-big"><a href="#"> 02 </a></li>
					<li><a href="#">03</a></li>
					<li><a href="#">04</a></li>
					<li><a href="#">05</a></li>
					<li><a href="#">&gt;</a></li>
				</ul>
			</nav>
		</div>
                
                <!--/ Blog Area -->
                
            </div>
        </div>
        </div>
        <!-- Container /- -->
    </div>
    <!--  End : Blog Page Content
==================================================-->