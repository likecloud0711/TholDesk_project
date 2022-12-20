<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반려문서 상세보기</title>
</head>
<body>
<table>
			<tr>
				<th>문서번호</th>
				<th>양식명</th>
				<th>제목</th>
				<th>기안자</th>
				<th>기안부서</th>
				<th>기안일자</th>
				<th>내용</th>
				<th>반려사유</th>
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
				<td>${dto.opcont }</td>
				<td>${dto.reject }</td>
			</tr>
</table>
<button type="button" onclick="location.href='/Eapp/update/${dto.opno }'">수정</button>
<button type="button" onclick="location.href='/Eapp/eapproval'">목록</button>
<input type="button" id="delete" value="삭제">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function(){
		$("input[id]").click(function(){
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