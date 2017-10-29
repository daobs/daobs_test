<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<link href="${root}/css/academy/style.css" rel="stylesheet">

<script type="text/javascript">
	function read(){
		location.href= './read?pageName=academy';
	}
</script>

	<!-- header -->
	<header id="page-top" class="blog-banner"> <!-- Start: Header Content -->
	<div class="container" id="blog">
		<div class="row blog-header text-center wow fadeInUp"
			data-wow-delay="0.5s">
			<div class="col-sm-12">
				<!-- Headline Goes Here -->
				<h4 style="font-family: '휴먼편지체';">Academy / Notice</h4>
				<h3 style="font-family: '휴먼편지체';">수강 공지</h3>
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
				<div class="col-xs-12 blog-area">
					<div class="row">
						<div class="col-xs-12">
                            <div class="blog-warp-1 wow fadeInLeft" data-wow-delay="0.9s">
                                <div class="blog_content_warp" style="border: none;">
                                	<table>
                                		<tbody>
                                			<tr style="border-bottom: 2px solid #eee;border-top:2px solid #eee; ">
                                				<td>
		                                			<img alt="" src="${root}/images/academy/수강신청.jpg" style="width: 200px; height: 150px;">			
                                				</td>
                                				<td style="padding: 25px;">
                                					<h5>붓펜글씨</h5> 
				                                    <a href="#" class="subtext"> 김김김 강사님 </a>
				                                    <a href="#" class="subtext"> 장소 : 북촌센터 </a>
				                                    <p>Lorem Ipsum is simply dummy text ofthe anadthe printing of typesetting industrydummy texat the dummy text ofthe anadthe printing </p>
				                                    <a href="javascript:read()" class="blog_btn">Read More <span class="fa fa-angle-double-right"></span></a>
                                				</td>
                                			</tr>
                                			<tr style="border-bottom: 2px solid #eee;border-top:2px solid #eee; ">
                                				<td>
		                                			<img alt="" src="${root}/images/academy/수강신청.jpg" style="width: 200px; height: 150px;">			
                                				</td>
                                				<td style="padding: 25px;">
                                					<h5>붓펜글씨</h5> 
				                                    <a href="#" class="subtext"> 김김김 강사님 </a>
				                                    <a href="#" class="subtext"> 장소 : 북촌센터 </a>
				                                    <p>Lorem Ipsum is simply dummy text ofthe anadthe printing of typesetting industrydummy texat the dummy text ofthe anadthe printing </p>
				                                    <a href="javascript:read()" class="blog_btn">Read More <span class="fa fa-angle-double-right"></span></a>
                                				</td>
                                			</tr>
                                		</tbody> 
                                	</table>
                                </div>
                            </div>
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
					</div>

				</div>
				<!--/ Blog Area -->

			</div>
		</div>
		<!-- Container /- -->
	</div>
	<!--  End : Blog Page Content
==================================================-->