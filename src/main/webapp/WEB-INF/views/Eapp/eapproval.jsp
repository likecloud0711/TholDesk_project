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
<title>전자결재 화면</title>
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
<%-- <div><jsp:include page="../top.jsp" flush='false' /></div> --%>

	<div class="container-fluid">

		<h3 class="h3 mb-2 font-weight-bold text-gray-800">문서함</h3>
<!-- 검색기능 -->
		<div class="card shadow mb-4"> <!-- 문서함 밑 공간부분 시작 -->
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary"></h6>
			</div>
		<div class="card-header py-3">
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
		
	
<div class="card-body">
	<div class="table-responsive">
		<table class="table table-bordered" width="100%" cellspacing="0">
			<thead>
				<tr>
					<th class="text-center">문서번호</th>
					<th class="text-center">양식명</th>
					<th class="text-center">제목</th>
					<th class="text-center">기안자</th>
					<th class="text-center">기안부서</th>
					<th class="text-center">기안일자</th>
					<th class="text-center">상태</th>
				</tr>
			</thead>
			<tbody>	
				<c:forEach items="${list}" var="appo">
					<tr>
						<td class="text-center hidden-sm hidden-xs"><a href="content/${appo.opno}">${appo.opno}</a></td>

						<c:if test="${appo.formno == 1 }">
						<td class="text-center">품의서</td>
						</c:if>
						<c:if test="${appo.formno == 2 }">
						<td class="text-center">연차신청서</td>
						</c:if>
						<c:if test="${appo.formno == 3 }">
						<td class="text-center">재택근무신청서</td>
						</c:if>
						<td class="text-center"><a href="content/${appo.opno}">${appo.optitle }</a></td>
						<td class="text-center">${appo.empnm } 
						<c:if test="${appo.grade  == 100}">사장</c:if>
						<c:if test="${appo.grade  == 20}">부장</c:if>
						<c:if test="${appo.grade  == 30}">과장</c:if>
						<c:if test="${appo.grade  == 40}">대리</c:if>
						<c:if test="${appo.grade  == 50}">사원</c:if>
						</td>
						<td class="text-center">${appo.teamnm }</td>
						<td class="text-center">${appo.draftdt }</td>
						<c:if test="${appo.opstatus == 0}">
						<td class="text-center">제출</td>
						</c:if>
						<c:if test="${appo.opstatus == 1}">
						<td class="text-center">대기</td>
						</c:if>
						<c:if test="${appo.opstatus == 2}">
						<td class="text-center">승인</td>
						</c:if>
						<c:if test="${appo.opstatus == 3}">
						<td class="text-center">반려</td>
						</c:if>
						<c:if test="${appo.opstatus == 4}">
						<td class="text-center">임시저장</td>
						</c:if>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	</div>
	<div style="float: right; display:inline" > <!-- 작성, 로그아웃 버튼 -->
		<a href="/Eapp/write"><button class="btn btn-primary">작성</button></a>
		</div>
	<div style="overflow: hidden;" > 
	<!-- 페이징 -->
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
<title>전자결재 화면</title>
<!-- Bootstrap cdn 설정 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<!-- 페이징 기능 꾸미기 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<!-- 게시글 작성버튼 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>                                                                                                                                            ipt>
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
<%-- <div><jsp:include page="../top.jsp" flush='false' /></div> --%>

	<div class="container-fluid">

		<h3 class="h3 mb-2 font-weight-bold text-gray-800">문서함</h3>
<!-- 검색기능 -->
		<div class="card shadow mb-4"> <!-- 문서함 밑 공간부분 시작 -->
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary"></h6>
			</div>
		<div class="card-header py-3">
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
		
	
<div class="card-body">
	<div class="table-responsive">
		<table class="table table-bordered" width="100%" cellspacing="0">
			<thead>
				<tr>
					<th class="text-center">문서번호</th>
					<th class="text-center">양식명</th>
					<th class="text-center">제목</th>
					<th class="text-center">기안자</th>
					<th class="text-center">기안부서</th>
					<th class="text-center">기안일자</th>
					<th class="text-center">상태</th>
				</tr>
			</thead>
			<tbody>	
				<c:forEach items="${list}" var="appo">
					<tr>
						<td class="text-center hidden-sm hidden-xs"><a href="content/${appo.opno}">${appo.opno}</a></td>

						<c:if test="${appo.formno == 1 }">
						<td class="text-center">품의서</td>
						</c:if>
						<c:if test="${appo.formno == 2 }">
						<td class="text-center">연차신청서</td>
						</c:if>
						<c:if test="${appo.formno == 3 }">
						<td class="text-center">재택근무신청서</td>
						</c:if>
						<td class="text-center"><a href="content/${appo.opno}">${appo.optitle }</a></td>
						<td class="text-center">${appo.empnm } 
						<c:if test="${appo.grade  == 100}">사장</c:if>
						<c:if test="${appo.grade  == 20}">부장</c:if>
						<c:if test="${appo.grade  == 30}">과장</c:if>
						<c:if test="${appo.grade  == 40}">대리</c:if>
						<c:if test="${appo.grade  == 50}">사원</c:if>
						</td>
						<td class="text-center">${appo.teamnm }</td>
						<td class="text-center">${appo.draftdt }</td>
						<c:if test="${appo.opstatus == 0}">
						<td class="text-center">제출</td>
						</c:if>
						<c:if test="${appo.opstatus == 1}">
						<td class="text-center">대기</td>
						</c:if>
						<c:if test="${appo.opstatus == 2}">
						<td class="text-center">승인</td>
						</c:if>
						<c:if test="${appo.opstatus == 3}">
						<td class="text-center">반려</td>
						</c:if>
						<c:if test="${appo.opstatus == 4}">
						<td class="text-center">임시저장</td>
						</c:if>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	</div>
	<div style="float: right; display:inline" > <!-- 작성, 로그아웃 버튼 -->
		<a href="/Eapp/write"><button class="btn btn-primary">작성</button></a>
		</div>
	<div style="overflow: hidden;" > 
	<!-- 페이징 -->
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

</body>
>>>>>>> refs/remotes/origin/serim
</html>