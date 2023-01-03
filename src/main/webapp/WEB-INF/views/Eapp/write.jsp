<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작성페이지</title>
</head>
<body>
<form method="post" id="writeform" action="write">
	<table border="1">
		<tr>
		</tr>
		<tr>
		<td>결재 제목</td>
		<td><input name="optitle"></td>
		</tr>
		<tr>
		<td>기안일자</td>
		<td><input name="draftdt" placeholder="yyyy-MM-dd" readonly></td>
		</tr>
		<tr>
		<td>양식</td>
		<td><select name="formno">
		<option value="1">품의서</option>
		<option value="2">연차신청서</option>
		<option value="3">재택근무신청서</option>
		</select>
		</td>
		<tr>
		<td>결재자 확인</td>
		<td>
		<select name='opsign1' id="sign1">
		<c:forEach items="${elist}" var="signer1">
			<option value="${signer1.empno}">${signer1.empnm }</option>
		</c:forEach>
		</select>
		<select name='opsign2' id="sign2">
  		<option value=''>-- 결재자2 --</option>
 		</select>
		</td>
		</tr>
		<tr>
		<td>내용</td>
		<td><div>
		<textarea name="opcont" rows="20" cols="10"
		placeholder="내용을 입력해주세요"
		style="width: 700px"></textarea>
		</div></td>
		</tr>
		<tr>
		<td colspan="2" align="center">
		<button type="button" id="cancle">취소</button>
		<input type="button" id="outbox" value="임시저장">
		<input type="submit" id="save" value="제출">		
		</td>
		</tr>
	</table>

</form>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
	$(function(){ //결재자 선택
		
		$("#sign1").change(function(){
			let empno = $(this).val();
			$.ajax({
				url : "/Eapp/sign2",
				type : "get",
				data : {"empno" : empno},
				dataType : "json"
			})
			.done(function(rep){
				// [{"empnm":"dddd","empno":1234}]
				for( i in rep){
					$("#sign2").append(
					"<option value='"+rep[i]["empno"]+"'>"+	rep[i]["empnm"]+"</option>"	
					);
				}
			})
			
		})//change
	})//ready
	
	$(document).ready(function(){
	    $('#cancle').click(function() {
	        var result = confirm('정말 취소 하시겠습니까?');

	        if(result) {
	           //yes
	            location.replace('/Eapp/eapproval');
	        } else {
	            //no
	        }
	    });
	});

	
		$(document).ready(function(){
			$("#outbox").click(function(){
				$("#writeform").attr("action", "/Eapp/outbox");
				$("#writeform").submit();
			})
		})
		
		
</script>


</body>
</html>