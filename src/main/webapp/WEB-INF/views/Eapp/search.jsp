<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="/WEB-INF/views/includes/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전자결재:검색결과</title>
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
}


</style>
</head>
<body>
<div><jsp:include page="../top.jsp" flush='false' /></div>


<div id="center">
	<h1 class="h1 mb-2 font-weight-bold text-gray-800">${search }(으)로 검색한 결과입니다.</h1>
	<!-- 1. 검색 조건에 맞는 글 갯수(page처리)
	2. 검색 조건에 맞는 글 중 현재 페이지에 보일 글 꺼내기 -->

	
	<c:if test="${count != 0 }">
<div class="card-body">
	<div class="table-responsive">
		<table class="table table-bordered" width="100%" cellspacing="0">
			<tr>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>내용</th>
			</tr>
			<c:forEach items="${esList }" var="es">
			<tr>
			<td><a href="content/${es.opno }">${es.optitle }</a></td>
			<td>${es.empnm }</td>
			<td>${es.draftdt }</td>
			<td>${es.opcont }</td>
			</tr>
			</c:forEach>
		</table>
		<div id="page" style="float: left; display:inline-block;">
	<ul class="pagination">
			<li><c:if test="${begin > pageNum }">
			<a href="eapproval?p=${begin-1 }" class="page prv">[이전]</a>
			</c:if>
			<span>«</span>
			</li>
			<li><c:forEach begin="${begin }" end="${end }" var="i">
				<a href="eapproval?p=${i }">${i }</a>
			</c:forEach>
			</li>
			<li><c:if test="${end < totalPages }">
			<a href="eapproval?p=${end+1 }">[다음]</a>
			</c:if>
				<span>»</span>
						</li>
			</ul>
	</div>
		</div>
</div>
</c:if>
<div>

</div>
<div class="card shadow mb-4"> <!-- 문서함 밑 공간부분 시작 -->
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary"></h6>
			</div>
		<div class="card-header py-3">
			<c:if test="${count == 0 }"> 검색 조건에 맞는 글이 없습니다. </c:if>
			<form action="search"> <!-- 검색시작 -->
			<select name="searchn">
			<option value="0">제목</option>
			<option value="1">내용</option>
			<option value="2">기안자</option>
			</select>
			<input type="text" name="search" size="15" maxlength="50" />
			<input type="submit" class="btn btn-primary" value="검색">
			</form>
		</div>
		</div><!-- 문서함 밑 end -->
</div>
</body>
</html>