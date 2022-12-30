<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결재처리 목록</title>
</head>
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
	text-align: left;
}
</style>
<body>
<h2>결재처리 목록</h2>
	<table>
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
				<td>${sl.empnm } ${sl.grade }</td>
				<td>${sl.teamnm }</td>
				<td>${sl.draftdt }</td>
			</tr>
		</c:forEach>
	</table>
	<a href="/Eapp/eapproval">목록</a>
</body>
</html>