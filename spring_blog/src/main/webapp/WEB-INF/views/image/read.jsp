<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"   %> 
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
textarea {
	background-color :white;
}
img {
	display: block;
	margin-left: auto;
	margin-right: auto;
	
}
.t2 {
	width: 50%;
	height: 100px;  
}
</style> 
<link href="${root}/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
function preply(){
	var url = "reply";
	url += "?imageno=${param.imageno}";
 	url += "&oldFile=${dto.fname}";
	url += "&col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
	
	location.href=url;
}

function pdelete(){
	var url = "delete";
	url += "?imageno=${param.imageno}";
	url += "&oldFile=${dto.fname}"
	url += "&col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
	location.href=url;
}

function pupdate(){
	var url = "update";
	url += "?imageno=${param.imageno}";
	url += "&oldFile=${dto.fname}";
	url += "&col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
	
	location.href=url;
}

function pupdateFile(){
	var url = "updateFile";
	url += "?imageno=${param.imageno}";
	url += "&oldFile=${dto.fname}";
	url += "&col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
	
	location.href=url;
}

function read(imageno){
	var url = "read";
	url += "?imageno="+imageno;
	location.href = url;
}
</script>
</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
 
<DIV class="title"> [ 이미지 ] </DIV>
 
  <TABLE>
    <TR>
      <TD colspan="2"><img src="./storage/${dto.fname}" width="500px" height="450px"></TD>
    </TR>
    <TR>
      <TH>글번호</TH>
      <TD>${dto.imageno}</TD>
    </TR>
    <TR>
      <TH>작성자</TH>
      <TD>${dto.pname}</TD>
    </TR>
    <TR>
      <TH>제목</TH>
      <TD>${dto.title}</TD>
    </TR>
    <TR>
      <TH>내용</TH>
      <TD><textarea rows="5" cols="35" name="content" disabled="disabled">${dto.content}</textarea> </TD>
    </TR>
    <TR>
      <TH>작성날짜</TH>
      <TD>${dto.wdate}</TD>
    </TR>
  </TABLE>
  <br><br>
  
  
  <!-- ㅆㅓㅁㄴㅔㅇㅣㄹㅇㅣㅁㅣㅈㅣ -->
  <div >
  <table style="width: 70%; ">
  		<tr >
  		<c:forEach var="i" begin="0" end="4">
  		<td style="width: 100px; height: 70px">
  				<c:choose>
  					<c:when test="${filename[i] == null }">
  						<img src="./storage/default.png " style="width: 100px; height: 70px; ">
  					</c:when>
  					<c:otherwise>
  						<c:choose>
  							<c:when test="${arrNo[i] == imageno }">
	  							<a href="javascript:read('${arrNo[i]}')"> 
				  				<img src="${root}/image/storage/${filename[i]} " style="width: 100px; height: 70px; border: 2px solid red;">
				  				</a>
  							</c:when>
  							<c:otherwise>
	  							<a href="javascript:read('${arrNo[i]}')">
				  				<img src="${root}/image/storage/${filename[i]} " style="width: 100px; height: 70px;">
				  				</a>
  							</c:otherwise>
  							
  						</c:choose>
  					</c:otherwise>
  				</c:choose>
  		</td>
  		</c:forEach>
  		</tr>
  
  </table>
  </div>

  <DIV class='bottom'>
    <input type='button' value='정보수정' onclick="pupdate()">
    <input type='button' value='사진수정' onclick="pupdateFile()">
    <input type='button' value='답변' onclick="preply()">
    <input type='button' value='삭제' onclick="pdelete()">
    <input type='button' value='목록' onclick="location.href='./list'">
  </DIV>
 
 
</body>
<!-- *********************************************** -->
</html> 
