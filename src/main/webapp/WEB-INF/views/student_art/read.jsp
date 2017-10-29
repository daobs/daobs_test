<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<link href="${root}/css/academy/style.css" rel="stylesheet">
   

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

<!--Start: Work Section 
==================================================-->
    <section class="single-work-page">
        <div class="container">
            <div class="row">
                <!-- portfolio item -->
                <div class="col-sm-8 col-xs-12">
                    <div class="portfolioitem col-sm-12">
                        <div class="carousel slide" data-ride="carousel" id="blog-post-slider">
                        	<img alt="blog" src="${root}/images/academy/ac_bg.jpg"> <!-- Controls -->
                        </div>
                    </div>
                    <div class="portfoliodesc">
                        <div class="col-sm-12">
                            <div class="project-details">
                                <h4>PROJECT OVERVIEW</h4>
                                <hr>
                                <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Invidunt ut labore et dolore magna stet clita kasd gubergrenLorem ipsum dolor sit amet, consetetur sadipscing elitr</p>
                                <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren accusam et justo duo</p>
                            	<c:forEach begin="0" end="1">
                            		<img src="${root}/images/academy/04.jpg">
                            		<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Invidunt ut labore et dolore magna stet clita kasd gubergrenLorem ipsum dolor sit amet, consetetur sadipscing elitr</p>
                                	<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren accusam et justo duo</p>
                            	</c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
				
                <div class="col-sm-4 col-xs-12">
                    <div class="portfolio-single-detail">
                        <h4>수강생 작품 </h4>
                        <hr>
                        <ul class="list-unstyled project-detail-list margin-bottom-50">
                            <li><strong>수강생 이름</strong> David Jon</li>
                            <li><strong>과정명</strong> Computer Market</li>
                            <li><strong>등록날짜</strong> Jun 20, 2015</li>
                            <li><strong>담당작가</strong> Repair, Laptop</li>
                        </ul>
                        <h4>Contact us now</h4>
                        <hr>
                        <ul class="list-inline social-icons">
                            <li>
                            	<a href="#" class="facebook-bg-hover">
                            		<img src="${root}/images/academy/naver_cafe.png" height="70px">
                            	</a>
                            </li>
                        </ul>
                        <h4>GO to page</h4>
                        <hr>
                        <ul class="list-inline social-icons">
						<li>
							<p>
								<button class="w3-button w3-blue">글목록</button>
							</p>
						</li>
						<li>
							<p>
								<button class="w3-button w3-indigo">글수정</button>
							</p>
						</li>
						<li>
							<p>
								<button class="w3-button w3-deep-purple">글삭제</button>
							</p>
						</li>
						<li>
							<p>
								<button class="w3-button w3-purple">글작성</button>
							</p>
						</li>
					</ul>
                    </div>
                </div>
                
                <!--/ portfolio item -->
            </div>
            <!-- row /- -->
        </div>
        <!-- Container /- -->
    </section>
    <!-- End: Work Section 
==================================================-->
