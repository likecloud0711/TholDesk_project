<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>

<div class="row" style="margin-bottom:20px; margin-left:1px;">
<div class="col-lg-12">
<h1 class="page-header">공지사항 작성 페이지</h1>
</div>
</div>

<div class="panel" style="margin-left:1px;">
<div id="contAreaBox">
<div class="panel">
<div class="panel-body">
<form action="/ks/update" method="post" >
<input type="hidden" id="boardno" name="boardno" value="${dto.boardno }"/>
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
			<th class="active">제목</th>
			<td class="form-inline"><input type="text" id="boardtitle"
				name="boardtitle" class="form-control" style="width: 840px" value="${dto.boardtitle }"/>
			</td>
		</tr>
		<tr>
			<th class="active" >작성자</th>
			<td class="form-inline"><input type="text" id="empnm"
				name="empnm" class="form-control" style="width: 200px" value="${dto.empnm }"/>
			</td>
		</tr>
		<tr>
			<th class="active" >내용</th>
			<td class="form-inline"><textarea 
				id="boardcontents" name="boardcontents" cols="100" rows="10"
				class="form-control">${dto.boardcontents }</textarea></td>
		</tr>
		<tr>	
			<th class="active">첨부파일</th>
			<td class="form-inline">
				<input type="file" value="upload">
		</tr>

	</tbody>
</table>
</div>
<div style="margin-left:1px;" align="center">
<button type="submit" class="btn btn-success">완료</button>
<a href="/ks/board" class="btn btn-danger">취소</a>
</div>
</form>
</div>
</div>
</div>
</div>


<%@include file="../includes/footer.jsp"%>