<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<link href="${root}/css/nh/style.css" rel="stylesheet">

<style type="text/css">
legend {
	font-family: "휴먼편지체";
	font-weight: bold;	
	font-size: 300%;
}

th {
	font-family: "휴먼편지체";
	font-size: :"120%";
	font-weight: bold;
}
</style>

<header id="page-top" class="blog-banner">
   <!-- Start: Header Content -->
   <div class="container" id="blog">
       <div class="row blog-header text-center wow fadeInUp" data-wow-delay="0.5s">
           <div class="col-sm-12">
               <!-- Headline Goes Here -->
               <h4 style="font-family: '휴먼편지체';"> Project / Request </h4>
               <h3 style="font-family: '휴먼편지체';"> 작업 의뢰 </h3> 
           </div>
       </div>
       <!-- End: .row -->
   </div>  <!-- End: Header Content -->
</header>

<div align="center">
	<form id="request" method="post" >
	<br><br>
		<fieldset
			style="border: 3; solid #808080; width: 600px; margin-bottom: 100px;">
			<legend >작업의뢰</legend>
			<table class="table">
				<tr>
					<th width="100" valign="top">의뢰로고명</th>
					<td><input type="text" name="logo_name" /></td>
				</tr>

				<tr>
					<th valign="top">의뢰부분</th>
					<td>
						<select name='part'>
							<option value="" />--의뢰 부분을 선택해주세요--
							</option>
							<option value="캘리그라피" />캘리그라피
							</option>
							<option value="캘리일러스트레이션" />캘리일러스트레이션
							</option>
							<option value="전각" />전각
							</option>
							<option value="디자인" />디자인
							</option>
						</select>
					</td>
				</tr>


				<tr>
					<th valign="top">적용분야</th>
					<td>
						<select name='part2'>
								<option value="" />--적용분야를 선택해주세요--
								</option>
								<option value="CI로고타입" />CI로고타입
								</option>
								<option value="BI로고타입" />BI로고타입
								</option>
								<option value="패키지로고타입" />패키지로고타입
								</option>
								<option value="신문광고" />신문광고
								</option>
								<option value="잡지광고" />잡지광고
								</option>
								<option value="차량광고" />차량광고
								</option>
								<option value="TV광고" />TV광고
								</option>
								<option value="카달로그" />카달로그
								</option>
								<option value="팜플렛" />팜플렛
								</option>
								<option value="브로슈어" />브로슈어
								</option>
								<option value="포스터" />포스터
								</option>
								<option value="편집" />편집
								</option>
								<option value="출판/북커버" />출판/북커버
								</option>
								<option value="사인" />사인
								</option>
								<option value="인테리어" />인테리어
								</option>
								<option value="기타" />기타
								</option>
						</select>
					</td>
				</tr>

				<tr>
					<th valign="top">내용</th>
					<td>
						<textarea name="memo" style="width: 440px; height: 160px;"></textarea>
					</td>
				</tr>

				<tr>
					<th>참고자료</th>
					<td>
						<input type='file' name='request_file' />
					</td>
				</tr>

				<tr>
					<th>글씨방향</th>
					<td>
						<select name='part3'>
							<option value='가로타입'>가로타입</option>
							<option value='세로타입'>세로타입</option>
							<option value='가로세로타입'>가로세로타입</option>
						</select>
					</td>
				</tr>
				
				<tr>
                  <th>진행일정</th>
                  <td>
                  	<input type="text" name="period_start" class="date"/> ~ <input type="text" name="period_end"  class="date" />
                  </td>
                </tr>

                <tr>
                  <th>의뢰사</th>
                  <td>
                  	<table class='in_table'>
                    	<colgroup>
                        	<col width='100'>
                          	<col>
                          	<col width='80'>
                          	<col>
                        </colgroup>
                   		<tr>
                          <td>
                            	회사명
                          </td>
                          <td colspan=3>
                            <input type="text" name="company_name"  class='wide'/>
                          </td>
                        </tr>     

                        <tr>
                          <td>
                            	부서명
                          </td>
                          <td colspan=3>
                            <input type="text" name="grade"   class='wide' />
                          </td>
                        </tr>                   
                                               
                        <tr>
                          <td>
                            	담당자명
                          </td>
                          <td>
                          	<input type="text" name="name"  />
                          </td>
                          <td>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;직책
                          </td>
                          <td>
                            <input type="text" name="grade"  />
                          </td>
                        </tr>

                      </table>

                  </td>
                </tr>

                <tr>
                  <th>연락처</th>
                  <td>
                  	<table class='in_table'>
                     		<colgroup>
                          	<col width='80'>
                          	<col>
                        	</colgroup>
                        	<tr>
	                          	<td>
	                            	회사전화
	                          	</td>
		                       	<td >
		                        	<input type="text" name="company_tel"  />
		                        </td>
                        	</tr>     

	                        <tr>
	                          <td>
	                          	핸드폰번호
	                          </td>
	                          <td>
	                          	<input type="text" name="hp"  />
	                          </td>
	                        </tr>                   
                                               
                        <tr>
                          <td>
                           	 팩스
                          </td>
                          <td>
                            <input type="text" name='fax'  />
                          </td>
                        </tr>

                        <tr>
                          <td>
                            	이메일
                          </td>
                          <td>
                            <input type="text" name='email'  />
                          </td>
                        </tr>
                      </table>

                  </td>
                </tr>

                <tr>
                  <th>
                    1차 의뢰서
                  </th>
                  <td>
                    <input type="text" name='req_1st' />
                  </td>
                </tr>

                <tr>
                  <th>
                   	 진행담당
                  </th>
                  <td>
                    <table width='100%'>
                      <tr>
                        <td>
                         	 홍길동 팀장<br>
                          	 02) 1234-1234<br>
                          	 <a href='mailto:test@gmail.com'>test@gmail.com</a>
                        </td>
                        <td width='160'> 
                          <div class="slider_btn" style="margin-bottom: 20px; text-align: center;">
							<a href="${root }" class="btn-primary">제출</a>									
						  </div>						  
                        </td>                        
                      </tr>
                    </table>

                  </td>
                </tr>
				
			</table>
		</fieldset>
	</form>
</div>