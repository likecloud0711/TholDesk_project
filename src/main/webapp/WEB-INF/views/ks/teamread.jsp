<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

function deleteConfirm(){

if(!confirm("삭제 하시겠습니까?")){
	return false;
}else{
	location.href="/ks/teamdelete?no="+${dto.boardno};
}
}

</script>

<%@include file="../includes/header.jsp"%>

<div class="row" style="margin-bottom:20px; margin-left:1px;">
<div class="col-lg-12">
<h1 class="page-header">부서게시판 상세 페이지</h1>
</div>
</div>

<div class="panel" style="margin-left:1px;">
<div id="contAreaBox">
<div class="panel">
<div class="panel-body">
<form action="/ks/teamread" method="post">
<div class="table-responsive" style="text-align:center;">
<table id="datatable-scroller"
	class="table table-bordered tbl_Form">
	<caption></caption>
	<colgroup>
		<col width="250px" />
		<col />
	</colgroup>
	<tbody>
		<tr>
			<th class="active" >작성자</th>
			<td>
			${dto.empnm}
			</td>
		</tr>
		<tr>
			<th class="active">제목</th> <!-- 현재 액티브한 부분을 보여줌 -->
			<td>
			${dto.boardtitle}
			</td>
		</tr>
		<tr>
			<th class="active" >내용</th>
			<td>
			${dto.boardcontents}
			</td>
		</tr>
		<tr>
			<th class="active" >첨부파일</th>
			<td>
			<a href="/teamdownload/${dto.boardno}">${dto.originalname}</a>
			</td>
		</tr>
	</tbody>
</table>
</div>

<div style="margin-left:1px;" align="center">
<a href="/ks/teamboard" class="btn btn-primary">목록</a>
<a href="/ks/teamupdate/${dto.boardno}" class="btn btn-success">수정</a>
<button type="button" class="btn btn-danger" onclick="deleteConfirm();">삭제</button>

</div>
</form>
</div>
</div>
</div>
</div>

<%@include file="teamcomment.jsp" %>
<%@include file="../includes/footer.jsp"%>
