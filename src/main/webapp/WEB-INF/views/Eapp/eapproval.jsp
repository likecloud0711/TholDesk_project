<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전자결재 화면</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

</head>
<body>
<%-- <%@include file="/WEB-INF/include/header.jsp"%> --%>
<div><jsp:include page="../top.jsp" flush='false' /></div>
<h1>Thol desk 전자결재</h1>
  
<nav>
	<ul>
		<li><a href="/Eapp/signlist">결재처리목록</a></li>
		<li><a href="/Eapp/permission">승인문서</a></li>
		<li><a href="/Eapp/waiting">대기문서</a></li>
		<li><a href="/Eapp/reject">반려문서</a></li>
		<li><a href="/Eapp/outboxpage">임시보관함</a></li>
	</ul>
</nav>
<h3>문서함</h3>
<div class="search"> <!-- 검색기능 -->
<form action="search">
<select name="searchn">
<option value="0">제목</option>
<option value="1">내용</option>
<option value="2">기안자</option>
</select>
<input type="text" name="search" size="15" maxlength="50" />
<input type="submit" value="검색">
</form>
<a href="/Eapp/write">작성</a>
<a href="/logout"><button>로그아웃</button></a>
</div>
<div>
	<table>
			<tr>
				<th>문서번호</th>
				<th>양식명</th>
				<th>제목</th>
				<th>기안자</th>
				<th>기안부서</th>
				<th>기안일자</th>
				<th>상태</th>
			</tr>
		<c:forEach items="${list}" var="appo">
			
			<tr>
				<td><a href="content/${appo.opno}">${appo.opno}</a></td>

				<c:if test="${appo.formno == 1 }">
				<td>품의서</td>
				</c:if>
				<c:if test="${appo.formno == 2 }">
				<td>연차신청서</td>
				</c:if>
				<c:if test="${appo.formno == 3 }">
				<td>재택근무신청서</td>
				</c:if>
				<td><a href="content/${appo.opno}">${appo.optitle }</a></td>
				<td>${appo.empnm } ${appo.grade }</td>
				<td>${appo.teamnm }</td>
				<td>${appo.draftdt }</td>
				<c:if test="${appo.opstatus == 0}">
				<td>제출</td>
				</c:if>
				<c:if test="${appo.opstatus == 1}">
				<td>대기</td>
				</c:if>
				<c:if test="${appo.opstatus == 2}">
				<td>승인</td>
				</c:if>
				<c:if test="${appo.opstatus == 3}">
				<td>반려</td>
				</c:if>
				<c:if test="${appo.opstatus == 4}">
				<td>임시저장</td>
				</c:if>
			
			</tr>
		</c:forEach>
	</table>
	<div id="page">
			<c:if test="${begin > pageNum }">
			<a href="eapproval?p=${begin-1 }">[이전]</a>
			</c:if>
			<c:forEach begin="${begin }" end="${end }" var="i">
				<a href="eapproval?p=${i }">${i }</a>
			</c:forEach>
			<c:if test="${end < totalPages }">
			<a href="eapproval?p=${end+1 }">[다음]</a>
			</c:if>
			
	</div>
</div>		
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

</body>
</html>