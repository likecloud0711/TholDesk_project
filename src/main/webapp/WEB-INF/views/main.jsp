<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/mainheader.css"/>
<meta charset="UTF-8">
<title>hello TDworks</title>

</head>
<body>

      
      <!-- 전자결재 -->
      <div style="display:flex">
     <div class="eapp" align="center" style="box-shadow: 2px 2px 2px;">   
     <h4>전자결재</h4>
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
	<button type="button" onclick="location.href='/Eapp/eapproval'">더보기</button>

	</div>
	<div style="width: 2%"></div>
	<!--  캘린더 -->
	<div><jsp:include page="./Calendar/miniCal.jsp" flush='false' /></div>
	</div>
</body>
</html>