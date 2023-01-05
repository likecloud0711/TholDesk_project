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
<title>결재처리 페이지 : 품의서</title>
<!-- Bootstrap cdn 설정 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<!-- 페이징 기능 꾸미기 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<!-- 게시글 작성버튼 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body>
    <table border="1" style="width: 800px; font-size: 20px; border-collapse: collapse; background-color: white;">
                <tr align="center">
                    <td rowspan="2" colspan="3" style="width: 80px; height: 20px; font-size: 40px; font-weight: 600;">품 의 서</td>
                   <td valign="middle" rowspan="2" style="width: 80px; font-size: 25px;" >결 재</td>
                    <td style="height: 30px; width: 100px;">결재자1</td>
                    <td style="width: 100px;">결재자2</td>
                </tr>
                   <tr align="center">
                    <td style="height: 70px; width=60;">${signer1 }</td>
                    <td style="height: 70px; width=60;">${signer2 }</td>                
                    </tr>
                <tr align="center">
                    <td style="height: 70px; width: 80px;">성 명</td>
                    <td colspan="2">${dto.empnm }</td>
                    
                 <td style="width: 80px;">부 서</td>
                        <td colspan="2" width=120;>${dto.teamnm }</td>
                </tr>
                <tr align="center">
                    <td style="height: 70px; width: 80px;">직 급</td>
                    <td colspan="2"><c:if test="${dto.grade  == 100}">사장</c:if>
						<c:if test="${dto.grade  == 20}">부장</c:if>
						<c:if test="${dto.grade  == 30}">과장</c:if>
						<c:if test="${dto.grade  == 40}">대리</c:if>
						<c:if test="${dto.grade  == 50}">사원</c:if></td>
                    
                    
                    <td style="width: 90px;">문서 번호</td>
                                        <td colspan="2" width=120;>${dto.opno}</td>
                </tr>
                <tr align="center">
                    <td style="height: 70px; width: 80px;">제 목</td>
                    <td colspan="6">${dto.optitle }</td>
                </tr>
                <tr align="center">
                    <td rowspan="10" style="height: 170px; width: 80px;">내 용</td>
					<td colspan="6" rowspan="10">${dto.opcont }</td>
                </tr>
            </table>
            <div>${dto.draftdt } 위 내용을 청구하오니 결재바랍니다.</div>
           
<form method="get" id="signdone1" action="/Eapp/returncontent">
<input type="hidden" name="opno" value="${dto.opno}">
<c:if test="${dto.opsign1 == empno }">
<input type="hidden" name="opstatus" value="1">
</c:if>
<c:if test="${dto.opsign2 == empno }">
<input type="hidden" name="opstatus" value="2">
</c:if>
<input type="button" id="signdone2" value="승인">
<input type="button" onclick="location.href='/Eapp/rejectcont/${dto.opno}'" id="returnsign2" value="반려">
<button type="button" onclick="location.href='../eapproval'">목록</button>
</form>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function(){
		$("#signdone2").click(function(){
			
			
			$("#signdone1").attr("action", "/Eapp/signcontent");
			$("#signdone1").submit();
		})
	})
	
	
</script>           
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
<title>결재처리 페이지 : 품의서</title>
<!-- Bootstrap cdn 설정 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<!-- 페이징 기능 꾸미기 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<!-- 게시글 작성버튼 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body>
    <table border="1" style="width: 800px; font-size: 20px; border-collapse: collapse; background-color: white;">
                <tr align="center">
                    <td rowspan="2" colspan="3" style="width: 80px; height: 20px; font-size: 40px; font-weight: 600;">품 의 서</td>
                   <td valign="middle" rowspan="2" style="width: 80px; font-size: 25px;" >결 재</td>
                    <td style="height: 30px; width: 100px;">결재자1</td>
                    <td style="width: 100px;">결재자2</td>
                </tr>
                   <tr align="center">
                    <td style="height: 70px; width=60;">${signer1 }</td>
                    <td style="height: 70px; width=60;">${signer2 }</td>                
                    </tr>
                <tr align="center">
                    <td style="height: 70px; width: 80px;">성 명</td>
                    <td colspan="2">${dto.empnm }</td>
                    
                 <td style="width: 80px;">부 서</td>
                        <td colspan="2" width=120;>${dto.teamnm }</td>
                </tr>
                <tr align="center">
                    <td style="height: 70px; width: 80px;">직 급</td>
                    <td colspan="2"><c:if test="${dto.grade  == 100}">사장</c:if>
						<c:if test="${dto.grade  == 20}">부장</c:if>
						<c:if test="${dto.grade  == 30}">과장</c:if>
						<c:if test="${dto.grade  == 40}">대리</c:if>
						<c:if test="${dto.grade  == 50}">사원</c:if></td>
                    
                    
                    <td style="width: 90px;">문서 번호</td>
                                        <td colspan="2" width=120;>${dto.opno}</td>
                </tr>
                <tr align="center">
                    <td style="height: 70px; width: 80px;">제 목</td>
                    <td colspan="6">${dto.optitle }</td>
                </tr>
                <tr align="center">
                    <td rowspan="10" style="height: 170px; width: 80px;">내 용</td>
					<td colspan="6" rowspan="10">${dto.opcont }</td>
                </tr>
            </table>
            <div>${dto.draftdt } 위 내용을 청구하오니 결재바랍니다.</div>
           
<form method="get" id="signdone1" action="/Eapp/returncontent">
<input type="hidden" name="opno" value="${dto.opno}">
<c:if test="${dto.opsign1 == empno }">
<input type="hidden" name="opstatus" value="1">
</c:if>
<c:if test="${dto.opsign2 == empno }">
<input type="hidden" name="opstatus" value="2">
</c:if>
<input type="button" id="signdone2" value="승인">
<input type="button" onclick="location.href='/Eapp/rejectcont/${dto.opno}'" id="returnsign2" value="반려">
<button type="button" onclick="location.href='../eapproval'">목록</button>
</form>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function(){
		$("#signdone2").click(function(){
			
			
			$("#signdone1").attr("action", "/Eapp/signcontent");
			$("#signdone1").submit();
		})
	})
	
	
</script>           
</body>
>>>>>>> refs/remotes/origin/serim
</html>