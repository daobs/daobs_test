<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CREATE TEAM FORM</title>
<style type="text/css">
* {
	font-size: 20px;
	font-family: 돋움체;
	font-weight: bold;
	padding-bottom: 2px;
	padding-top: 2px;
}
</style>
<link href="${root}/css/style.css" rel="Stylesheet" type="text/css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
    
    function tlist(){
    	var url = "./list";
    	url += "?col=${param.col}";
    	url += "&word=${param.word}";
    	url += "&nowPage=${param.nowPage}";
    	location.href=url;
    }
</script>
</head>
<body>
<div class="title"> [ 팀 정보 수정  ]</div>
<hr>
<br>
<form action="./update" method="post" name="frm">
<input type="hidden" name="teamno" value="${dto.teamno}">
<input type="hidden" name="col" value="${param.col}">
<input type="hidden" name="word" value="${param.word}">
<input type="hidden" name="nowPage" value="${param.nowPage}">

<fieldset>
<legend></legend>
<table>
	<tr>
		<th>이름</th>
		<td><input type="text" name="name" value="${dto.name}"></td>
	</tr>
	<tr>
		<th>성별</th>
		<td>
		<label> <input type="radio" name="gender" value="남자"
		<c:if test="${dto.gender == '남자' }">
		checked="checked"
		</c:if>
		> 남자 </label>
		<label> <input type="radio" name="gender" value="여자"
		<c:if test="${dto.gender == '여자' }">
		checked="checked"
		</c:if>
		> 여자 </label>
			
		</td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td> <input type="text" name="phone" value="${dto.phone}"> </td>
	</tr>
	<tr>
		<th>우편번호</th>
		<td><input type="text" name="zipcode" size="7" maxlength="5" id="sample6_postcode" placeholder="우편번호" value="${dto.zipcode}" > 
			<input type="button" value="주소검색" onclick="sample6_execDaumPostcode()">
		</td>
	</tr>
	<tr>
		<th>주소</th>
		<td>
			<input type="text" name="address1" size="65" id="sample6_address" placeholder="주소" value="${dto.address1}"><br>
			<input type="text" name="address2" size="65" id="sample6_address2" placeholder="상세주소" value="${dto.address2}">
		</td>
	</tr>
	<tr>
		<th>보유기술</th>
		<td>
			<label> <input type="checkbox" name="skills" value="java"
			<c:if test="${fn:indexOf(dto.skill, 'java') != -1}">
			checked="checked"
			</c:if>
			> java </label>
			<label> <input type="checkbox" name="skills" value="jsp"
			<c:if test="${fn:indexOf(dto.skill, 'jsp') != -1}">
			checked="checked"
			</c:if>
			> jsp </label>
			<label> <input type="checkbox" name="skills" value="MVC"
			<c:if test="${fn:indexOf(dto.skill, 'MVC') != -1}">
			checked="checked"
			</c:if>
			> MVC </label>
			<label> <input type="checkbox" name="skills" value="spring"
			<c:if test="${fn:indexOf(dto.skill, 'spring') != -1}">
			checked="checked"
			</c:if>
			> spring </label>
			<label> <input type="checkbox" name="skills" value="jQuery"
			<c:if test="${fn:indexOf(dto.skill, 'jQuery') != -1}">
			checked="checked"
			</c:if>
			> jQuery </label>
		</td>
	</tr>
	<tr>
		<th>취미</th>
		<td>
			<select name="hobby">
				<option >취미를 선택하세요</option>
				<option value="기술서적읽기">기술서적읽기</option>
				<option value="웹툰보기">웹툰보기</option>
				<option value="운동">운동</option>
				<option value="영화">영화</option>
				<option value="색칠공부">색칠공부 </option>
				<option value="게임">게임</option>
				<option value="보드타기">보드타기</option>
			</select>
			<script type="text/javascript">
			document.frm.hobby.value='${dto.hobby}';
			</script>
		</td>
	</tr>
	<tr>
		<th>사진</th>
		<td><!-- <input type="file" name="filename" > --> ${dto.filename} </td>
	</tr>
</table>
<div class="bottom">
	<button type="submit">수정</button>
	<button type="reset">다시입력</button>
	<button type="button" onclick="tlist()">목록</button>
</div>
</fieldset>
</form>
</body>
</html>