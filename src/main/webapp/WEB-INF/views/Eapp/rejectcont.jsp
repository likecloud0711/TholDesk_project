<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반려사유 기입</title>
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
				<td>${dto.empnm } ${dto.grade }</td>
				<td>${dto.teamnm }</td>
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
<form method="post" id="rejectcont" action="/Eapp/rejectcont">
<input type="hidden" value="${dto.opno}" name="opno">
<textarea name="reject" placeholder="내용을 입력해주세요."></textarea>
<input type="submit" value="확인"> 
</form>
</body>
</html>