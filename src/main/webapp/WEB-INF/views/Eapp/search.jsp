<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 글 목록</title>
<style>
#center {
	width: 700px;
	margin-left: auto;
	margin-right: auto;
}

table {
	border: 1px solid black;
	width: 700px;
	border-collapse: collapse;
}

th {border: 1px solid black;
	background-color: orange;
	width: 150px;
}
td{border: 1px solid black;}
a {
	margin: 10px auto;
}

#page {
	text-align: center;
}
</style>
</head>
<body>
<div id="center">
	<h1>${search }(으)로 검색한 결과입니다.</h1>
	<!-- 1. 검색 조건에 맞는 글 갯수(page처리)
	2. 검색 조건에 맞는 글 중 현재 페이지에 보일 글 꺼내기 -->
	<div align="right">
		<a href="/Eapp/eapproval">main</a>
	</div>
	
	<c:if test="${count != 0 }">
		<table>
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
		<div id="page">
		<c:if test="${begin > pageNum }">
		<a href="search?p=${begin -1 }&search=${search }&searchn=${searchn }">이전</a>
		</c:if>
		<c:forEach begin="${begin }" end="${end }" var="i">
		<a href="search?p=${i }&search=${search}&searchn=${searchn}">${i }</a>
		</c:forEach>
		<c:if test="${end < totalPages }">
		<a href="search?p=${end+1 }&search=${search}&searchn=${searchn}">[다음]</a>
		</c:if>
</div>
</c:if>
<c:if test="${count == 0 }"> 검색 조건에 맞는 글이 없습니다. </c:if>
<div id="search" align="center">
<form action="search">
<select name="searchn">
<option value="0">제목</option>
<option value="1">내용</option>
<option value="2">작성자</option>
</select>
<input type="text" name="search" size="15" maxlength="50" />
<input type="submit" value="검색" />
</form>
</div>
</div>
</body>
</html>