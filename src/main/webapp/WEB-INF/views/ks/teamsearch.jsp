<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>

<head>
<title>title</title>
<!-- Bootstrap cdn 설정 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<!-- 페이징 기능 꾸미기 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<!-- 게시글 작성버튼 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

	<!-- Begin Page Content -->
	<div class="container-fluid">
	
		<!-- Page Heading -->
		<h1 class="h3 mb-2 font-weight-bold text-gray-800">부서게시판</h1>
		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">Total ${count}건</h6>
			</div>
			<!-- 검색[s] -->
			<div class="card-header py-3">
			<form method="get" id="listForm" action="/ks/teamsearch">
				<input type="text" id="teamsearch" name="teamsearch"
					value="${dto.teamsearch}" style="width: 300px; height: 40px;"
					placeholder="검색어를 입력하세요." /> 
					<input type="submit" class="btn btn-primary" value="검색">
			</form>		
			</div>
<!-- 검색[e] -->

<div class="card-body">
	<div class="table-responsive">
		<table class="table table-bordered" width="100%" cellspacing="0">
			<thead>
				<tr>
					<th class="text-center" width="200">글번호</th>
					<th class="text-center">제목</th>
					<th class="text-center" width="250">작성자</th>
					<th class="text-center" width="300">작성일</th>
					<th class="text-center" width="200">조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${blist}" var="dto">
					<tr>
						<td class="text-center hidden-sm hidden-xs">
						<c:out value="${dto.boardno }" /></td>
						<td><a href="/ks/teamboard/${dto.boardno}"> 
						<c:out value="${dto.boardtitle}" /></a> 
						<c:if test="${dto.boarddate>=nowday }">
								<img class="upload" src="<c:url value='/resources/img/new.svg' />" 
								style="width: 28px; height: 15px;">	</c:if></td>
						<td class="text-center"><c:out value="${dto.empnm }" /></td>
						<td class="text-center hidden-sm hidden-xs  ">
						<c:out value="${dto.boarddate }" /></td>
						<td class="text-center hidden-sm hidden-xs">
						<c:out value="${dto.readcount}" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<c:if test="${count == 0}"> 검색 조건에 맞는 글이 없습니다. </c:if>
	</div>
	<div style="overflow: hidden;">
		<div>
			<!-- 페이징 부분 -->
			<div style="float: left;">
				<ul class="pagination">
					<li><c:if test="${begin > pageNum }">
							<a href="teamsearch?p=${begin-1}&teamsearch=${teamsearch}" class="page prv"></a> </c:if> 
							<span>«</span>
							</li>
					<li><c:forEach begin="${begin }" end="${end }" var="i">
							<a href="teamsearch?p=${i}&teamsearch=${teamsearch}">${i}</a>
						</c:forEach>
						</li>
					<li><c:if test="${end < totalPages }">
							<a href="teamsearch?p=${end+1}&teamsearch=${teamsearch}" class="page next"></a> </c:if> 
						<span>»</span>
						</li>
				</ul>
			</div>
		</div>
		<!-- !페이징 부분 -->

		<!-- 게시글 작성버튼 S -->
		<div style="float: right;">
			<button style="margin-right: 0.5em; text-align: right; height: 40px;"
				class="btn btn-primary" type="button"
				onclick="location.href='/ks/teamboard'">전체 목록</button>
		</div>
		<!-- 게시글 작성버튼 E -->
	</div>
</div>
</div>
</div>
<!-- /.container-fluid -->

