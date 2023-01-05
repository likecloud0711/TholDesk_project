<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="/WEB-INF/views/includes/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결재 처리 목록</title>
<!-- Bootstrap cdn 설정 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<!-- 페이징 기능 꾸미기 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<!-- 게시글 작성버튼 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
table {
	border: 1px solid black;
	width: 700px;
	border-collapse: collapse;
}

th {border: 1px solid black;
	text-align: center;
	background-color: navy;
	width: 150px;
	color: white;
}
td{border: 1px solid black;
	background-color: white;
	text-align: center;
}


</style>
</head>
<body>


		<h3 class="h3 mb-2 font-weight-bold text-gray-800">결재 처리 목록</h3>
	
<div class="card-body">
	<div class="table-responsive">
		<table class="table table-bordered" width="100%" cellspacing="0">
			<tr>
				<th>문서번호</th>
				<th>양식명</th>
				<th>제목</th>
				<th>기안자</th>
				<th>기안부서</th>
				<th>기안일자</th>
			</tr>
			<c:forEach items="${dto}" var="sl">
			
			<tr>
				<td><a href="signcontent/${sl.opno}">${sl.opno}</a></td>

				<c:if test="${sl.formno == 1 }">
				<td>품의서</td>
				</c:if>
				<c:if test="${sl.formno == 2 }">
				<td>연차신청서</td>
				</c:if>
				<c:if test="${sl.formno == 3 }">
				<td>재택근무신청서</td>
				</c:if>
				<td><a href="signcontent/${sl.opno}">${sl.optitle }</a></td>
				<td>${sl.empnm }<c:if test="${sl.grade  == 100}">사장</c:if>
						<c:if test="${sl.grade  == 20}">부장</c:if>
						<c:if test="${sl.grade  == 30}">과장</c:if>
						<c:if test="${sl.grade  == 40}">대리</c:if>
						<c:if test="${sl.grade  == 50}">사원</c:if></td>
				<td>${sl.teamnm }</td>
				<td>${sl.draftdt }</td>
			</tr>
		</c:forEach>
	</table>
	</div>
	</div>
</body>
</html>