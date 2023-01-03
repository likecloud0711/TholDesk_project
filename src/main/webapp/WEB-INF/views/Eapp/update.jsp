<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문서 수정</title>
</head>
<body>
	<form method="post" id="update" action="/Eapp/update">
	<input type="hidden" name="_method" value="put">
	<input type="hidden" name="opno" value="${dto.opno }">
	<table border="1">
	<tr>
	<td>제목</td>
	<td><input name="optitle" value="${dto.optitle }"/></td>
	</tr>
	<tr>
	<td>내용</td>
	<td><textarea name="opcont" cols="100" rows="80">${dto.opcont }</textarea></td>
	</tr>
	</table>
	</form>
	<input type="submit" id="save" value="수정 완료">
	<button onclick="location.href='../eapproval'">취소</button>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script>
	$(document).ready(function(){
		$("#save").click(function(){
			$("#update").submit();
		})
	})
</script>
	
</body>
</html>