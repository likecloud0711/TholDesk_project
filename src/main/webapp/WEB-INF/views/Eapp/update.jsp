<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="/WEB-INF/views/includes/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전자결재:보고서수정페이지</title>
<!-- Bootstrap cdn 설정 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<!-- 페이징 기능 꾸미기 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<!-- 게시글 작성버튼 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body>
<div><jsp:include page="../top.jsp" flush='false' /></div>

		<h3 class="h3 mb-2 font-weight-bold text-gray-800">보고서 수정</h3>
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
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="/WEB-INF/views/includes/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전자결재:보고서수정페이지</title>
<!-- Bootstrap cdn 설정 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<!-- 페이징 기능 꾸미기 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<!-- 게시글 작성버튼 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body>
<div><jsp:include page="../top.jsp" flush='false' /></div>

		<h3 class="h3 mb-2 font-weight-bold text-gray-800">보고서 수정</h3>
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
>>>>>>> refs/remotes/origin/serim
</html>