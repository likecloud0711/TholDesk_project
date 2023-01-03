<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>

<div class="row" style="margin-bottom:20px; margin-left:1px;">
<div class="col-lg-12">
<h1 class="page-header">작성 페이지</h1>
</div>
</div>

<div class="panel" style="margin-left:1px;">
<div id="contAreaBox">
<div class="panel">
<div class="panel-body">
<form role="form" action="/ks/write" method="post" onsubmit="return _onSubmit();" enctype="multipart/form-data">
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
				<td class="form-inline"><input type="text" id="empnm" 
				name="empnm" class="form-control" style="width: 200px" value="${dto.empnm}" readonly/>
				<input type="hidden" name="announceyn" value="N"/>
				<input type="hidden" name="empno" value="${dto.empno}"/>
				<!-- <td><input class="txt w100" name="id" value="${user.id}" /></td> --> 
				</td>
			</tr>
			<tr>
				<th class="active">제목</th>
				<td class="form-inline">
				<input type="text" id="boardtitle"
					name="boardtitle" class="form-control" style="width: 840px" />
				</td>
			</tr>

			<tr>
				<th class="active" >내용</th>
				<td class="form-inline"><textarea 
						id="boardcontents" name="boardcontents" cols="100" rows="10"
						class="form-control"></textarea></td>
			</tr>
		</tbody>
								<tr>
				<th class="active">첨부파일</th>
				<td class="form-inline">
				<input type="file" name="file" value="upload">
				</td>
			</tr>
	</table>
</div>
<div align="center">

	<button style="margin-right: 0.5em; text-align: right; height: 40px;"
					class="btn btn-primary" type="submit">등록</button>
	<a href="/ks/board" class="btn btn-warning">취소</a>
</div>
</form>
</div>
</div>
</div>
</div>
<!-- 알러트 부분 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

function _onSubmit(){

if($("#boardtitle").val() == ""){
  	alert("제목을 입력해주세요");
	$("#boardtitle").focus();
	return false;
  }

if($("#boardcontents").val() == ""){
  	alert("내용을 입력해주세요");
	$("#boardcontents").focus();
	return false;
  }

if(!confirm("등록하시겠습니까?")){
return false;
}
}
</script>
<!-- !!알러트 부분 -->


<%@include file="../includes/footer.jsp"%>