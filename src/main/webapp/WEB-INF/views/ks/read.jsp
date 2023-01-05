<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

function deleteConfirm(){

if(!confirm("삭제 하시겠습니까?")){
	return false;
}else{
	location.href="/ks/delete?no="+${dto.boardno};
}
}

</script>

<%@include file="../includes/header.jsp"%>

<div class="row" style="margin-bottom:20px; margin-left:1px; margin-top:20px;">
<div class="col-lg-12">
<h1 class="page-header mb-2 font-weight-bold text-gray-800" style="color:#212121;">상세 페이지</h1>
<h4 class="mb-2 font-weight-bold text-gray-800"style="color:#212121;">(공지사항)</h4>
</div>
</div>
<div class="container-fluid">
<div class="card shadow mb-4">
<div class="panel">
<div id="contAreaBox">
<div class="panel">
<div class="panel-body">
<form action="/ks/read" method="post">
<div class="table-responsive" style="text-align:center;">
<table id="datatable-scroller"
	class="table table-bordered tbl_Form">
	<colgroup>
		<col width="15%"/>
		<col width="35%"/>
		<col width="15%"/>
		<col width="*"/>
	</colgroup>
	<tbody>
		<tr>
			<th class="active">작성자</th>
			<td style="color:#212121;">${dto.empnm}(${dto.empno})</td>
			<th class="active">작성일</th>
			<td style="color:#212121;">${dto.boarddate}</td>
		</tr>
		<tr>
			<th class="active">제목</th> <!-- 현재 액티브한 부분을 보여줌 -->
			<td style="color:#212121;">${dto.boardtitle}</td>
			<th class="active">조회수</th>
			<td style="color:#212121;">${dto.readcount}</td>
		</tr>
		<tr>
			<th class="active">내용</th>
			<td colspan="3" style="color:#212121;">${dto.boardcontents}</td>
		</tr>
		<tr>
			<th class="active">첨부파일</th>
			<td colspan="3"><a href="/download/${dto.boardno}">${dto.originalname}</a></td>
		</tr>
	</tbody>
</table>
</div>
</form>
</div>
</div>
</div>
</div>
</div>
<div style="margin-left:1px;" align="center">
<a href="/ks/board" class="btn btn-primary">목록</a>
<c:if test="${dto.empnm == dto1.empnm }">
<a href="/ks/update/${dto.boardno}" class="btn btn-success">수정</a>
<button type="button" class="btn btn-danger" onclick="deleteConfirm();">삭제</button>
</c:if>
</div>
</div>

<%@include file="comment.jsp" %>
<%@include file="../includes/footer.jsp"%>
