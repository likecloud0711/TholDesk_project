<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문서 상세보기</title>
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
<table>
			<tr>
				<th>문서번호</th>
				<th>양식명</th>
				<th>제목</th>
				<th>기안자</th>
				<th>기안부서</th>
				<th>기안일자</th>
				<th>상태</th>
				<th>내용</th>
			</tr>
			<tr>
				<td>${dto.opno}</td>

				<c:if test="${dto.formno == 1 }">
				<td>품의서</td>
				</c:if>
				<c:if test="${dto.formno == 2 }">
				<td>연차신청서</td>
				</c:if>
				<c:if test="${dto.formno == 3 }">
				<td>재택근무신청서</td>
				</c:if>
				<td>${dto.optitle }</td>
				<td>${dto.empno }</td>
				<td>기안부서</td>
				<td>${dto.draftdt }</td>
				<c:if test="${dto.opstatus == 0}">
				<td>제출</td>
				</c:if>
				<c:if test="${dto.opstatus == 1}">
				<td>대기</td>
				</c:if>
				<c:if test="${dto.opstatus == 2}">
				<td>승인</td>
				</c:if>
				<c:if test="${dto.opstatus == 3}">
				<td>반려</td>
				</c:if>
				<td>${dto.opcont }</td>
			</tr>
</table>
<a href="/Eapp/update/${dto.opno }">수정</a>
<a href="../eapproval">목록</a>
<a href="../eapproval" id="delete" >삭제</a>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function(){
		$("a[id]").click(function(){
			let no = $(this).attr("id");
			
			$.ajax({url:"/Eapp/delete",
				data: "opno="+${dto.opno}, method:"delete"})
				.done(function(){
					location.href="/Eapp/eapproval";
				})
				return false;
		}) 
	})
</script>
</body>
</html>