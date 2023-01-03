<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연차신청서</title>
</head>
<body>
	<table border="1" style="width: 800px; font-size: 20px; border-collapse: collapse;">
                <tr align="center">
                    <td rowspan="2" colspan="3" style="width: 80px; height: 20px; font-size: 40px; font-weight: 600;">연 차 신 청 서</td>
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
                    <td colspan="2">${dto.grade }</td>
                    
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
            <a href="../eapproval">목록</a>
<c:if test="${empno == dto.empno }">
<a href="/Eapp/update/${dto.opno }">수정</a>
<a href="../eapproval" id="delete" >삭제</a>
</c:if>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function(){
		$("a[id]").click(function(){
			var act = confirm("삭제하시겠습니까?");
			if(act){let no = $(this).attr("id");
			
			$.ajax({url:"/Eapp/delete",
				data: "opno="+${dto.opno}, method:"delete"})
				.done(function(){
					location.href="/Eapp/eapproval";
				})
				return false;}
			else{
				
			}
			
		}) 
	})
</script>
</body>
</html>