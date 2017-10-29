<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
* { 
	font-size: 20px;
	color: pink;
}

div {
	text-align: center;
	margin-top: 20px;
	margin-bottom: 20px;
	color: red;
}

table {
	width: inherit;
	margin: 0 auto;
}

table, th, td {
	font-family: MD아롱체;
	color: pink;
	border: 1px solid gray;
	border-collapse: collapse;
	padding: 6px;
}
</style>

<script type="text/javascript">
function inCheck(f){
if(f.fname.value=="")
	alert("사진을 선택하세요");
	f.fname.focus();
	return false;
}
</style>

<script type="text/javascript">
function inCheck(f){
	if(f.pname.valuse==""){
		alert("사진이름을 입력하세요");
		f.wname.focus();
		return false;
	}
	
	if(f.title.valuse==""){
		alert("제목을 입력하세요");
		f.title.focus();
		return false;
	}
	if(f.content.valuse==""){
		alert("내용을 입력하세요");
		f.content.focus();
		return false;
	}
	if(f.passwd.valuse==""){
		alert("비번을 입력하세요");
		f.passwd.focus();
		return false;
	}
	
}

</script>

</head>
<!-- *********************************************** -->
<body>
	<!-- *********************************************** -->

	<div class="title">사진정보 수정</div>
	<form name="frm" method='post' action="./update" onsubmit="return inCheck(this)">
		<input type="hidden" name="imageno" value="${param.imageno}">
		<input type="hidden" name="col" value="${param.col}">
		<input type="hidden" name="word" value="${param.word}">
		<input type="hidden" name="nowPage" value="${param.nowPage}">
		<table>
			<tr>
				<th style="background-color: pink; color: white;">사진</th>
				<td><img style="margin-left: 60px; margin-right: 25px;"
					width="500px" src="./storage/${dto.fname}"></td>
			</tr>

			<tr>
				<th style="background-color: pink; color: white;">작성자</th>
				<td><input type="text" name="pname" style="width: 510px;"
					value="${dto.pname}"></td>
			</tr>

			<tr>

				<th style="background-color: pink; color: white;">제목</th>
				<td><input type="text" name="title" value="${dto.title}"
					style="width: 510px;"></td>
			</tr>
			<TR>
				<TH style="background-color: pink; color: white;">내용</TH>
				<TD><textarea rows="10" cols="54" name="content">${dto.content}</textarea>
				</TD>
			</TR>
     <TR>
      <TH>비밀번호</TH>
      <TD><input type="password" name="passwd"></TD>
    </TR>

		</table>
		  <DIV class='bottom'>
    <input type='submit'  style="background-color: pink; color: white;" value='수정'>
    <input type='button' style="background-color: pink; color: white;" value='취소' onclick="history.back()">
  </DIV>
		
	</form>



	<!-- *********************************************** -->
</body>
<!-- *********************************************** -->

</html>
